import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';

import '../model/user/user.dart';

class LoginController extends GetxController {
  GetStorage box = GetStorage();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userCollection;

  TextEditingController registerNameCtrl = TextEditingController();
  TextEditingController registerNumberCtrl = TextEditingController();
  TextEditingController registerPasswordCtrl =
      TextEditingController(); // Added for password
  TextEditingController loginNumberCtrl = TextEditingController();
  TextEditingController loginPasswordCtrl = TextEditingController();

  OtpFieldControllerV2 otpController = OtpFieldControllerV2();
  bool otpFieldShown = false;
  int? otpSend;
  int? otpEnter;

  User? loginUser;

  // Define OTP state within the LoginController
  var otp = 0.obs;

  void setOtp(int newOtp) {
    otp.value = newOtp;
  }

  @override
  void onReady() {
    Map<String, dynamic>? user = box.read('loginUsers');
    if (user != null) {
      loginUser = User.fromJson(user);
      Get.toNamed('/shop');
    }
    super.onReady();
  }

  @override
  void onInit() {
    userCollection = firestore.collection('users');
    super.onInit();
  }

  Future<void> addUser() async {
    try {
      if (otpSend == otpEnter) {
        // Check if the phone number already exists
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
        User user = User(
          id: doc.id,
          name: registerNameCtrl.text,
          number: int.parse(registerNumberCtrl.text),
          password: registerPasswordCtrl.text, // Save password
        );
        final userJson = user.toJson();
        await doc.set(userJson);
        Get.snackbar('Success', 'Registration successful',
            colorText: Colors.green);

        // Clear fields and reset OTP display
        update();
        registerNumberCtrl.clear();
        registerNameCtrl.clear();
        registerPasswordCtrl.clear(); // Clear password field
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
        // Check password field
        Get.snackbar('Error', 'Please fill all the fields',
            colorText: Colors.red);
        return;
      }
      final random = Random();
      int otp = 1000 + random.nextInt(9000);
      //print(otp);
      otpFieldShown = true;
      otpSend = otp;
      setOtp(otp); // Set the OTP in the state
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
      String password = loginPasswordCtrl.text; // Get password input
      if (phoneNumber.isNotEmpty && password.isNotEmpty) {
        var querySnapshot = await userCollection
            .where('number', isEqualTo: int.tryParse(phoneNumber))
            .where('password', isEqualTo: password) // Check password
            .limit(1)
            .get();
        if (querySnapshot.docs.isNotEmpty) {
          var userDoc = querySnapshot.docs.first;
          var userData = userDoc.data() as Map<String, dynamic>;
          box.write('loginUser', userData);
          loginNumberCtrl.clear();
          loginPasswordCtrl.clear(); // Clear password field
          Get.toNamed('/shop');
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
}
