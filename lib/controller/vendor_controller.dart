import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
//import 'package:the_splendid_market/controller/login_controller.dart';
import 'dart:html';
import 'package:the_splendid_market/model/products/product.dart';
import 'package:the_splendid_market/model/user/user.dart';

class VendorController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;

  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController productDescriptionCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();
  TextEditingController productLastPriceCtrl = TextEditingController();

  var productImgUrl = ''.obs;

  String category = 'general';
  String brand = 'unbranded';
  bool? offer = false;

  List<Product> products = [];

  User? currentUser;

  VendorController(this.currentUser);

  @override
  Future<void> onInit() async {
    if (currentUser != null) {
      productCollection = firestore
          .collection('users')
          .doc(currentUser!.id)
          .collection('products');
      await fetchProducts();
    }
    super.onInit();
  }

  Future<String> uploadImage(File imageFile) async {
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

  Future<void> addProduct() async {
    if (productNameCtrl.text.isEmpty ||
        productDescriptionCtrl.text.isEmpty ||
        productPriceCtrl.text.isEmpty ||
        productLastPriceCtrl.text.isEmpty ||
        productImgUrl.value.isEmpty) {
      Get.snackbar('Error', 'Please fill all the fields',
          colorText: Colors.red);
      return;
    }
    try {
      if (currentUser != null) {
        DocumentReference doc = productCollection.doc();
        Product product = Product(
          id: doc.id,
          name: productNameCtrl.text,
          description: productDescriptionCtrl.text,
          price: double.tryParse(productPriceCtrl.text),
          lastPrice: double.tryParse(productLastPriceCtrl.text),
          image: productImgUrl.value,
        );
        final productJson = product.toJson();
        await doc.set(productJson);
        Get.snackbar('Success', 'Product added successfully',
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

  void deleteProduct(String id) async {
    try {
      if (currentUser != null) {
        await productCollection.doc(id).delete();
        fetchProducts();
        Get.snackbar(
          'Success',
          'Product deleted successfully',
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

  Future<void> fetchProducts() async {
    try {
      if (currentUser != null) {
        QuerySnapshot productSnapshot = await productCollection.get();
        final List<Product> retrievedProducts = productSnapshot.docs
            .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
            .toList();
        products.clear();
        products.assignAll(retrievedProducts);
        update();
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    } finally {
      update();
    }
  }

  Future<void> fetchLatestProducts() async {
    // Fetch the latest products from the server or database
    // Update the products list
    products = await ProductService.getLatestProducts();
    update(); // Notify the UI to update
  }

  void setValueDefault() {
    productNameCtrl.clear();
    productPriceCtrl.clear();
    productLastPriceCtrl.clear();
    productDescriptionCtrl.clear();
    productImgUrl.value = '';

    category = 'general';
    brand = 'unbranded';
    offer = false;
    update();
  }
}
