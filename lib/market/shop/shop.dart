import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get_storage/get_storage.dart';
import 'package:the_splendid_market/constant/colors.dart';
//import 'package:the_splendid_market/controller/login_controller.dart';
//import 'package:the_splendid_market/controller/shop_controller.dart';
import 'package:the_splendid_market/controller/shop_controller1.dart';
//import 'package:the_splendid_market/model/user/user.dart';
import 'package:the_splendid_market/widgets/product_card.dart';

class Shop extends StatelessWidget {
  const Shop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final String userId = Get.arguments['userId'] ?? '';

    // Ensure that the ShopController is instantiated with userId
    Get.put(ShopController1(userId));

    return GetBuilder<ShopController1>(builder: (ctrl) {
      return RefreshIndicator(
        onRefresh: () async {
          ctrl.fetchProducts();
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
                      'Footware Store',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/market');
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
              //
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: ctrl.productShowInUi.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      name: ctrl.productShowInUi[index].name ?? 'No name',
                      imageUrl: ctrl.productShowInUi[index].image ?? '',
                      //Image.asset('assets/images/The Splendid.png', fit: BoxFit.cover),
                      price: ctrl.productShowInUi[index].price ?? 00,
                      offerTag: '20 % off',
                      onTap: () {
                        Get.toNamed('/description', arguments: {
                          'data': ctrl.productShowInUi[index],
                          'userId': userId,
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

//SizedBox(
//   height: 50,
//   child: ListView.builder(
//     scrollDirection: Axis.horizontal,
//     itemCount: ctrl.productsCategories.length,
//     itemBuilder: (context, index) {
//       return InkWell(
//         onTap: () {
//           ctrl.filterByCategory(
//               ctrl.productsCategories[index].name ?? '');
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(6),
//           child: Chip(
//             label: Text(
//               ctrl.productsCategories[index].name ?? '',
//             ),
//           ),
//         ),
//       );
//     },
//   ),
// ),
