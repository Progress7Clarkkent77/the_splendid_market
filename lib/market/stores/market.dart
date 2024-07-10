import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:the_splendid_market/constant/colors.dart';
import 'package:the_splendid_market/controller/market_controller.dart';

import 'package:the_splendid_market/widgets/market_card.dart';

class Market extends StatelessWidget {
  const Market({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MarketController());

    return GetBuilder<MarketController>(builder: (ctrl) {
      return RefreshIndicator(
          onRefresh: () async {
            await ctrl.fetchVendors();
          },
          child: Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'The Splendid Market',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: mainColor,
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/boardmobile');
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
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: ctrl.vendors.length,
                    itemBuilder: (context, index) {
                      return MarketCard(
                        businessName:
                            ctrl.vendors[index].businessName ?? 'No name',
                        imageAsset:
                            'assets/images/shop.png', // updated parameter name
                        onTap: () {
                          Get.toNamed('/shop', arguments: {
                            'userId': ctrl.vendors[index].id,
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
