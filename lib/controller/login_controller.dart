//import 'dart:convert';
import 'dart:math';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';
import 'package:path/path.dart' as Path;
import 'package:firebase_storage/firebase_storage.dart';
import '../model/user/user.dart' as model;

class LoginController extends GetxController {
  GetStorage box = GetStorage();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userCollection;

  TextEditingController registerNameCtrl = TextEditingController();
  TextEditingController registerNumberCtrl = TextEditingController();
  TextEditingController registerPasswordCtrl = TextEditingController();
  TextEditingController loginNumberCtrl = TextEditingController();
  TextEditingController loginPasswordCtrl = TextEditingController();

  OtpFieldControllerV2 otpController = OtpFieldControllerV2();
  bool otpFieldShown = false;
  int? otpSend;
  int? otpEnter;

  model.User? loginUser;

  var otp = 0.obs;
  var myUser = model.User().obs;

  dynamic credentials;
  var isProfileUploading = false.obs;
  bool isLoginAsUser = false;
  var isDecided = false;

  void setOtp(int newOtp) {
    otp.value = newOtp;
  }

  @override
  void onReady() {
    Map<String, dynamic>? user = box.read('loginUser');
    if (user != null) {
      loginUser = model.User.fromJson(user);
      // Get.toNamed('/shop');
    }
    super.onReady();
  }

  @override
  void onInit() {
    userCollection = firestore.collection('users');
    getUserInfo(); // Fetch user info when the controller is initialized
    super.onInit();
  }

  void getUserInfo() {
    String id = loginUser?.id ?? '';
    if (id.isNotEmpty) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(id)
          .snapshots()
          .listen((event) {
        myUser.value = model.User.fromJson(event.data()!);
      });
    }
  }

  Future<void> addUser() async {
    try {
      if (otpSend == otpEnter) {
        var querySnapshot = await userCollection
            .where('number', isEqualTo: int.parse(registerNumberCtrl.text))
            .limit(1)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          Get.snackbar('Error', 'Phone number already registered',
              colorText: Colors.red);
          return;
        }

        DocumentReference doc = userCollection.doc();
        model.User user = model.User(
          id: doc.id,
          name: registerNameCtrl.text,
          number: int.parse(registerNumberCtrl.text),
          password: registerPasswordCtrl.text,
        );
        final userJson = user.toJson();
        await doc.set(userJson);

        // Create subcollections for products and orders
        //await doc.collection('products').add({});
        //await doc.collection('orders').add({});
        Get.toNamed('/login');
        Get.snackbar('Success', 'Registration successful',
            colorText: Colors.green);

        update();
        registerNumberCtrl.clear();
        registerNameCtrl.clear();
        registerPasswordCtrl.clear();
        otpController.clear();
        otpFieldShown = false;
        otp.value = 0;
      } else {
        Get.snackbar('Error', 'OTP is incorrect', colorText: Colors.red);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    } finally {
      update();
    }
  }

  void sendOtp() {
    try {
      if (registerNameCtrl.text.isEmpty ||
          registerNumberCtrl.text.isEmpty ||
          registerPasswordCtrl.text.isEmpty) {
        Get.snackbar('Error', 'Please fill all the fields',
            colorText: Colors.red);
        return;
      }
      final random = Random();
      int otp = 1000 + random.nextInt(9000);
      otpFieldShown = true;
      otpSend = otp;
      setOtp(otp);
      Get.snackbar('Success', 'Otp Sent Successfully', colorText: Colors.green);
    } catch (e) {
      print(e);
    } finally {
      update();
    }
  }

  Future<void> loginWithPhone() async {
    try {
      String phoneNumber = loginNumberCtrl.text;
      String password = loginPasswordCtrl.text;
      if (phoneNumber.isNotEmpty && password.isNotEmpty) {
        var querySnapshot = await userCollection
            .where('number', isEqualTo: int.tryParse(phoneNumber))
            .where('password', isEqualTo: password)
            .limit(1)
            .get();
        if (querySnapshot.docs.isNotEmpty) {
          var userDoc = querySnapshot.docs.first;
          var userData = userDoc.data() as Map<String, dynamic>;
          box.write('loginUser', userData);
          loginUser = model.User.fromJson(userData);
          loginNumberCtrl.clear();
          loginPasswordCtrl.clear();
          getUserInfo(); // Fetch user info after login
          Get.toNamed('/vendordashboard');
          Get.snackbar('Success', 'Login Successful', colorText: Colors.green);
        } else {
          Get.snackbar('Error', 'Invalid phone number or password',
              colorText: Colors.red);
        }
      } else {
        Get.snackbar('Error', 'Please enter phone number and password',
            colorText: Colors.red);
      }
    } catch (error) {
      print('Failed to Login: $error');
      Get.snackbar('Error', 'Failed to Login', colorText: Colors.red);
    }
  }

  model.User? getCurrentUser() {
    return loginUser;
  }

  void decideRoute() {
    if (isDecided) {
      return;
    }
    isDecided = true;
    print("called");

    /// step 1- Check user login?
    var user = loginUser;

    if (user != null) {
      /// step 2- Check whether user profile exists?
      FirebaseFirestore.instance
          .collection('users')
          .doc(user.id)
          .get()
          .then((value) {
        /// isLoginAsUser == true means navigate it to user module
        if (isLoginAsUser) {
          if (value.exists) {
            // User dashboard
            Get.toNamed('/vendordashboard');
          }
        } else {
          if (value.exists) {
          } else {
            // Navigate to vendor profile setup
            Get.toNamed('/profileSettings');
          }
        }
      }).catchError((e) {
        print("Error while decideRoute is $e");
      });
    }
  }

  Future<String> uploadImage1(File image) async {
    String imageUrl = '';
    String fileName = Path.basename(image.path);
    var reference = FirebaseStorage.instance
        .ref()
        .child('users/$fileName'); // Modify this path/string as needed
    UploadTask uploadTask = reference.putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    await taskSnapshot.ref.getDownloadURL().then(
      (value) {
        imageUrl = value;
        print("Download URL: $value");
      },
    );

    return imageUrl;
  }

  Future<void> storeUserInfo(
    File? selectedImage,
    //String name,
    //String number,
    String email,
    String businessName,
    String businessLocation,
    String accountName,
    String accountNumber, {
    String url = '',
  }) async {
    String urlNew = url;
    if (selectedImage != null) {
      urlNew = await uploadImage1(selectedImage);
    }
    String uid = loginUser?.id ?? '';
    if (uid.isNotEmpty) {
      FirebaseFirestore.instance.collection('users').doc(uid).set({
        'image': urlNew,
        //'name': name,
        //'number': number,
        'email': email,
        'businessName': businessName,
        'businessLocation': businessLocation,
        'accountName': accountName,
        'accountNumber': accountNumber,
      }, SetOptions(merge: true)).then((value) {
        isProfileUploading(false);

        // Navigate to the home screen
        Get.toNamed('/vendordashboard');
      });
    }
  }
}
