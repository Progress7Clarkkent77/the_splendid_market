import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BargainController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late DocumentReference productDocRef;

  var displayedPrice = 0.0.obs;
  var lastPrice = 0.0.obs;
  var bargainResponse = ''.obs;

  TextEditingController priceController = TextEditingController();

  void setProductDocRef(String userId, String productId) {
    productDocRef = firestore
        .collection('users')
        .doc(userId)
        .collection('products')
        .doc(productId);
  }

  Future<void> fetchPrices() async {
    try {
      DocumentSnapshot productSnapshot = await productDocRef.get();
      displayedPrice.value = productSnapshot['price'];
      lastPrice.value = productSnapshot['last price'];
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch prices', colorText: Colors.red);
    }
  }

  void bargain() {
    double inputPrice = double.tryParse(priceController.text) ?? 0.0;

    if (inputPrice >= displayedPrice.value) {
      bargainResponse.value = "We have an accord, proceed to add to cart";
      displayedPrice.value = inputPrice;
    } else {
      double difference = displayedPrice.value - lastPrice.value;
      double reductionStep = difference / 4;
      double newPrice = displayedPrice.value;
      bool accordReached = false;

      for (int i = 0; i < 4; i++) {
        newPrice -= reductionStep;
        if (inputPrice >= newPrice) {
          accordReached = true;
          bargainResponse.value =
              "Great! The price has been updated to ${newPrice.toStringAsFixed(2)}. You can proceed to checkout now.";
          displayedPrice.value = newPrice;
          break;
        } else if (i < 3) {
          // Only show this response for the first three reductions
          bargainResponse.value =
              "Hmm, the price or number inputted is quite a bit lower. How about we meet at ${newPrice.toStringAsFixed(2)}?";
        }
      }

      if (!accordReached) {
        bargainResponse.value =
            "Your offer is too low; we can't have an accord.";
      }
    }
  }

  void accord() {
    double inputPrice = double.tryParse(priceController.text) ?? 0.0;
    if (inputPrice < lastPrice.value) {
      bargainResponse.value = "Your offer is too low; we can't have an accord.";
    } else {
      bargainResponse.value = "We have an accord. Proceed to add to cart";
      displayedPrice.value = inputPrice;
    }
  }
}
