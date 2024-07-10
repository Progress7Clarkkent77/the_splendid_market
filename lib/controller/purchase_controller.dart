import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:the_splendid_market/controller/login_controller.dart';
///import 'package:the_splendid_market/model/user/user.dart';

// class PurchaseController extends GetxController {
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   late CollectionReference orderCollection;

//   TextEditingController addressController = TextEditingController();

//   double orderPrice = 0;
//   String itemName = '';
//   String orderAddress = '';

//   @override
//   void onInit() {
//     User? loginUser = Get.find<LoginController>().loginUser;
//     if (loginUser != null) {
//       orderCollection =
//           firestore.collection('users').doc(loginUser.id).collection('orders');
//     }
//     super.onInit();
//   }

//   submitOrder({
//     required double price,
//     required String item,
//     required String description,
//   }) {
//     orderPrice = price;
//     itemName = item;
//     orderAddress = addressController.text;
//     print('$orderPrice $itemName $orderAddress');
//   }

//   Future<void> orderSuccess({required String? transactionId}) async {
//     User? loginUser = Get.find<LoginController>().loginUser;
//     try {
//       if (transactionId != null && loginUser != null) {
//         DocumentReference docRef = await orderCollection.add({
//           'customer': loginUser.name ?? '',
//           'phone': loginUser.number ?? '',
//           'item': itemName,
//           'price': orderPrice,
//           'address': orderAddress,
//           'transactionId': transactionId,
//           'dateTime': DateTime.now().toString(),
//         });
//         print("Order Created Successfully: ${docRef.id}");
//         showOrderSuccessDialog(docRef.id);
//         Get.snackbar('Success', 'Order Created Successfully',
//             colorText: Colors.green);
//       } else {
//         Get.snackbar('Error', 'Please fill all fields', colorText: Colors.red);
//       }
//     } catch (error) {
//       print("Failed to register user: $error");
//       Get.snackbar("Error", 'Failed to Create Order', colorText: Colors.red);
//     }
//   }

//   void showOrderSuccessDialog(String orderId) {
//     Get.defaultDialog(
//       title: "Order Success",
//       content: Text("Your OrderId is $orderId"),
//       confirm: ElevatedButton(
//         onPressed: () {
//           Get.toNamed('/shop');
//         },
//         child: const Text('close'),
//       ),
//     );
//   }
// }

class PurchaseController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference orderCollection;

  TextEditingController addressController = TextEditingController();

  double orderPrice = 0;
  String itemName = '';
  String orderAddress = '';
  String userId = '';

  @override
  void onInit() {
    super.onInit();
  }

  void setUserId(String id) {
    userId = id;
    orderCollection =
        firestore.collection('users').doc(userId).collection('orders');
  }

  submitOrder({
    required double price,
    required String item,
    required String description,
  }) {
    orderPrice = price;
    itemName = item;
    orderAddress = addressController.text;
    print('$orderPrice $itemName $orderAddress');
  }

  Future<void> orderSuccess({required String? transactionId}) async {
    try {
      if (transactionId != null && userId.isNotEmpty) {
        DocumentReference docRef = await orderCollection.add({
          'customer': 'Anonymous', // Change this if you have customer info
          'phone': 'N/A', // Change this if you have customer info
          'item': itemName,
          'price': orderPrice,
          'address': orderAddress,
          'transactionId': transactionId,
          'dateTime': DateTime.now().toString(),
        });
        print("Order Created Successfully: ${docRef.id}");
        showOrderSuccessDialog(docRef.id);
        Get.snackbar('Success', 'Order Created Successfully',
            colorText: Colors.green);
      } else {
        Get.snackbar('Error', 'Please fill all fields', colorText: Colors.red);
      }
    } catch (error) {
      print("Failed to create order: $error");
      Get.snackbar("Error", 'Failed to Create Order', colorText: Colors.red);
    }
  }

  void showOrderSuccessDialog(String orderId) {
    Get.defaultDialog(
      title: "Order Success",
      content: Text("Your OrderId is $orderId"),
      confirm: ElevatedButton(
        onPressed: () {
          Get.toNamed('/shop');
        },
        child: const Text('Close'),
      ),
    );
  }
}
