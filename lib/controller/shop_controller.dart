import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:the_splendid_market/model/product_category/product_category.dart';
import 'package:the_splendid_market/model/user/user.dart';

import '../model/products/product.dart';

class ShopController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;

  List<Product> products = [];
  List<Product> productShowInUi = [];

  User? currentUser;

  ShopController(this.currentUser);

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

  Future<void> fetchProducts() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<Product> retrievedProducts = productSnapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      products.clear();
      products.assignAll(retrievedProducts);
      productShowInUi.assignAll(products);
      update();
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    } finally {
      update();
    }
  }
}







//categoryCollection = firestore.collection('category');
    //await fetchCategory();




// fetchCategory() async {
//     try {
//       QuerySnapshot categorySnapshot = await categoryCollection.get();
//       final List<ProductCategory> retrievedCategories = categorySnapshot.docs
//           .map((doc) =>
//               ProductCategory.fromJson(doc.data() as Map<String, dynamic>))
//           .toList();
//       productsCategories.clear();
//       productsCategories.assignAll(retrievedCategories);
//       //Get.snackbar('Success', 'Category fetched successfully',
//       //colorText: Colors.green);
//       update();
//     } catch (e) {
//       Get.snackbar('Error', e.toString(), colorText: Colors.red);
//       print(e);
//     } finally {
//       update();
//     }
//   }

//   filterByCategory(String category) {
//     productShowInUi.clear();
//     productShowInUi =
//         products.where((product) => product.category == category).toList();
//     update();
//   }