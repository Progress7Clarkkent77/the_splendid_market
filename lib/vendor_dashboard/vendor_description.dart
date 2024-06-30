import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_splendid_market/constant/colors.dart';
import 'package:the_splendid_market/controller/purchase_controller.dart';
import 'package:the_splendid_market/model/products/product.dart';

class VendorDescription extends StatelessWidget {
  const VendorDescription({super.key});

  @override
  Widget build(BuildContext context) {
    Product product = Get.arguments['data'];
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
                          Navigator.pushNamed(context, '/vendorshop');
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      product.image ?? '',
                      fit: BoxFit.contain,
                      //Image.asset('assets/images/The Splendid.png', fit: BoxFit.cover),
                      width: double.infinity,
                      height: 200,
                    ),
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
                Text(
                  'Rs: ${product.price ?? ''}',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      );
    });
  }
}
