import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:the_splendid_market/model/product_category/product_category.dart';
import 'package:the_splendid_market/model/user/user.dart';
//import 'package:the_splendid_market/model/user/user.dart';

//import '../model/products/product.dart';

// class MarketController extends GetxController {
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   late CollectionReference productCollection;
//   late CollectionReference categoryCollection;

//   List<Product> products = [];
//   List<Product> productShowInUi = [];
//   List<ProductCategory> productsCategories = [];

//   //MarketController(User? currentUser);

//   @override
//   Future<void> onInit() async {
//     productCollection = firestore.collection('users');

//     await fetchProducts();
//     super.onInit();
//   }

//   fetchProducts() async {
//     try {
//       QuerySnapshot productSnapshot = await productCollection.get();
//       final List<Product> retrievedProducts = productSnapshot.docs
//           .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
//           .toList();
//       products.clear();
//       products.assignAll(retrievedProducts);
//       productShowInUi.assignAll(products);
//       // Get.snackbar('Success', 'Products fetched successfully',
//       //     colorText: Colors.green);
//       update();
//     } catch (e) {
//       Get.snackbar('Error', e.toString(), colorText: Colors.red);
//       print(e);
//     } finally {
//       update();
//     }
//   }

//   fetchCategory() async {
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
// }

class MarketController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userCollection;

  List<User> vendors = [];

  @override
  void onInit() {
    userCollection = firestore.collection('users');
    fetchVendors();
    super.onInit();
  }

  Future<void> fetchVendors() async {
    try {
      QuerySnapshot vendorSnapshot = await userCollection.get();
      final List<User> retrievedVendors = vendorSnapshot.docs
          .map((doc) => User.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      vendors.clear();
      vendors.assignAll(retrievedVendors);
      update();
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    } finally {
      update();
    }
  }
}
