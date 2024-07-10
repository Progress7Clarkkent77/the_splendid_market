import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_splendid_market/constant/colors.dart';
import 'package:the_splendid_market/controller/bargain_controller.dart';
import 'package:the_splendid_market/controller/purchase_controller.dart';
//import 'package:the_splendid_market/controller/vendor_controller.dart';
import 'package:the_splendid_market/model/products/product.dart';

class ProductDescriptionPage extends StatelessWidget {
  const ProductDescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    Product product = Get.arguments['data'];
    String userId = Get.arguments['userId'];

    final PurchaseController purchaseController = Get.put(PurchaseController());
    final BargainController bargainController = Get.put(BargainController());

    purchaseController.setUserId(userId);
    bargainController.setProductDocRef(userId, product.id!);
    bargainController.fetchPrices();

    return GetBuilder<PurchaseController>(builder: (ctrl) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Product Details',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: mainColor,
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          Get.back(result: {'userId': userId});
                        },
                        child: const Text(
                          'Back',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: mainColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    product.image ?? '',
                    fit: BoxFit.contain,
                    width: double.infinity,
                    height: 200,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  product.name ?? '',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  product.description ?? '',
                  style: const TextStyle(fontSize: 16, height: 1.5),
                ),
                const SizedBox(height: 20),
                Obx(() => Text(
                      'Rs: ${bargainController.displayedPrice.value}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                      ),
                    )),
                const SizedBox(height: 20),
                Container(
                  height: 190,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: mainColor, // Set the border color
                      width: 2.0, // Set the border width
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: 400,
                        color: mainColor,
                        child: const Center(
                          child: Text(
                            "The Bargaining Table",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Obx(() => Container(
                            height: 80,
                            width: 400,
                            color: Colors.green,
                            child: Center(
                              child: Text(
                                bargainController.bargainResponse.value,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextField(
                              controller: bargainController.priceController,
                              maxLines: 1,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                labelText: 'Enter your bargaining price',
                                labelStyle: const TextStyle(
                                  fontSize:
                                      10.0, // Adjust the font size as needed
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              backgroundColor: mainColor,
                            ),
                            onPressed: bargainController.bargain,
                            child: const Text(
                              'Bargain',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              backgroundColor: Colors.green,
                            ),
                            onPressed: bargainController.accord,
                            child: const Text(
                              'Accord',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: mainColor,
                    ),
                    child: const Text(
                      'Buy Now',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      ctrl.submitOrder(
                        price: bargainController.displayedPrice.value,
                        item: product.name ?? '',
                        description: product.description ?? '',
                      );
                      bargainController.displayedPrice.value =
                          product.price ?? 0;
                      bargainController.bargainResponse.value = '';
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
