import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:the_splendid_market/model/user/user.dart';
//import 'package:the_splendid_market/controller/login_controller.dart';

class LogoController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference usersCollection;

  var productImgUrl = ''.obs;

  String category = 'general';
  String brand = 'unbranded';
  bool? offer = false;

  List<User> users = [];

  User? currentUser;

  LogoController(this.currentUser);

  @override
  Future<void> onInit() async {
    if (currentUser != null) {
      usersCollection = firestore.collection('users');
      await fetchUsers();
    }
    super.onInit();
  }

  Future<String> uploadImage2(File imageFile) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageReference =
          FirebaseStorage.instance.ref().child('uploads/$fileName');
      UploadTask uploadTask = storageReference.putBlob(imageFile);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadURL = await taskSnapshot.ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print("Error uploading image: $e");
      return "";
    }
  }

  Future<void> addUser2() async {
    if (productImgUrl.value.isEmpty) {
      Get.snackbar('Error', 'Please fill all the fields',
          colorText: Colors.red);
      return;
    }
    try {
      if (currentUser != null) {
        DocumentReference doc = usersCollection.doc(currentUser!.id);
        User user = User(
          id: doc.id,
          image: productImgUrl.value,
        );
        final userJson = user.toJson();
        await doc.set(userJson);
        Get.snackbar('Success', 'Image added successfully',
            colorText: Colors.green);
        setValueDefault();
        update();
      } else {
        Get.snackbar('Error', 'User not logged in', colorText: Colors.red);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    } finally {
      update();
    }
  }

  void deleteUser(String id) async {
    try {
      if (currentUser != null) {
        await usersCollection.doc(currentUser!.id).delete();
        fetchUsers();
        Get.snackbar(
          'Success',
          'User deleted successfully',
          colorText: Colors.green,
        );
        setValueDefault();
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        colorText: Colors.red,
      );
      print(e);
    } finally {
      update();
    }
  }

  Future<void> fetchUsers() async {
    try {
      if (currentUser != null) {
        DocumentSnapshot userSnapshot =
            await usersCollection.doc(currentUser!.id).get();
        if (userSnapshot.exists) {
          User retrievedUser =
              User.fromJson(userSnapshot.data() as Map<String, dynamic>);
          users.clear();
          users.add(retrievedUser);
          update();
        } else {
          Get.snackbar('Error', 'User not found', colorText: Colors.red);
        }
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    } finally {
      update();
    }
  }

  void setValueDefault() {
    productImgUrl.value = '';

    category = 'general';
    brand = 'unbranded';
    offer = false;
    update();
  }
}
