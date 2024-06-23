import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:html'; // For web-specific file picking
import 'package:the_splendid_market/model/products/product.dart'; // Adjust the import according to your project structure

class VendorController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;

  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController productDescriptionCtrl = TextEditingController();
  TextEditingController productImgCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();

  String category = 'general';
  String brand = 'un branded';
  bool? offer = false;

  List<Product> products = [];

  @override
  Future<void> onInit() async {
    productCollection = firestore.collection('products');
    await fetchProducts();
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

  void addProduct() {
    try {
      DocumentReference doc = productCollection.doc();
      Product product = Product(
        id: doc.id,
        name: productNameCtrl.text,
        category: category,
        description: productDescriptionCtrl.text,
        price: double.tryParse(productPriceCtrl.text),
        brand: brand,
        image: productImgCtrl.text,
        offer: offer,
      );
      final productJson = product.toJson();
      doc.set(productJson);
      Get.snackbar('Success', 'Product added successfully',
          colorText: Colors.green);
      setValueDefault();

      update();
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    } finally {
      update();
    }
  }

  void deleteProduct(String id) async {
    try {
      await productCollection.doc(id).delete();
      fetchProducts();
      Get.snackbar('Success', 'Product deleted successfully',
          colorText: Colors.green);
      setValueDefault();
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    } finally {
      update();
    }
  }

  Future<void> fetchProducts() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<Product> retrievedProducts = productSnapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      products.clear();
      products.assignAll(retrievedProducts);
      Get.snackbar('Success', 'Products fetched successfully',
          colorText: Colors.green);
      update();
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
    productDescriptionCtrl.clear();
    productImgCtrl.clear();

    category = 'general';
    brand = 'un branded';
    offer = false;
    update();
  }
}
