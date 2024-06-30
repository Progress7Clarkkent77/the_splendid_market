import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:the_splendid_market/admin/vendor_admin/vendor_admin.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:the_splendid_market/constant/colors.dart';
import 'package:the_splendid_market/controller/vendor_dashboard_controller.dart';
import 'package:the_splendid_market/widgets/vendor_product_card.dart';
// import 'package:the_splendid_market/widgets/vendor_product_card.dart';

class VendorDashboard extends StatelessWidget {
  const VendorDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VendorDashboardController>(builder: (ctrl) {
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
                    // Circular Image Container
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color:
                              mainColor, // Replace with your desired border color
                          width: 2.0, // Adjust the border width as needed
                        ),
                        image: const DecorationImage(
                          image: AssetImage(
                              'assets/images/boy.png'), // Replace with your image asset path
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: 30,
                    ),
                    const Text(
                      'Vendor Dashboard',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: mainColor, // Replace with your mainColor
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    IconButton(
                      onPressed: () {
                        GetStorage box = GetStorage();
                        box.erase();
                        Get.toNamed('/home');
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: mainColor, // Replace with your mainColor
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 10,
                width: double.infinity,
                color: mainColor,
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    children: <Widget>[
                      _buildGridItem(
                        context,
                        'Shop View',
                        'assets/images/s11.png',
                        const VendorShop(),
                      ),
                      _buildGridItem(
                        context,
                        'Add Products',
                        'assets/images/s12.jpeg',
                        const VendorAdmin(),
                      ),
                      _buildGridItem(
                        context,
                        'Orders',
                        'assets/images/s15.jpeg',
                        const Page3(),
                      ),
                      _buildGridItem(
                        context,
                        'Profile',
                        'assets/images/s14.png',
                        const Page4(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildGridItem(
      BuildContext context, String title, String imagePath, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: mainColor,
            width: 2.0,
          ),
        ),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.asset(
                imagePath,
                height: 130,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: mainColor,
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class VendorShop extends StatelessWidget {
  const VendorShop({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VendorDashboardController>(builder: (ctrl) {
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
                        Navigator.pushNamed(context, '/vendordashboard');
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
              const SizedBox(
                height: 20,
              ),
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
                    return VendorProductCard(
                      name: ctrl.productShowInUi[index].name ?? 'No name',
                      imageUrl: ctrl.productShowInUi[index].image ?? '',
                      //Image.asset('assets/images/The Splendid.png', fit: BoxFit.cover),
                      price: ctrl.productShowInUi[index].price ?? 00,
                      offerTag: '20 % off',
                      onTap: () {
                        Get.toNamed('/vendordescription', arguments: {
                          'data': ctrl.productShowInUi[index],
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

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 3'),
      ),
      body: const Center(
        child: Text('Welcome to Order Page'),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 80,
              width: double.infinity,
              color: Colors.transparent,
              child: const Center(
                child: Text(
                  "My Profile",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: mainColor,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}










// Expanded(
//                 child: GridView.builder(
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     childAspectRatio: 0.8,
//                     crossAxisSpacing: 8,
//                     mainAxisSpacing: 8,
//                   ),
//                   itemCount: ctrl.productShowInUi.length,
//                   itemBuilder: (context, index) {
//                     return VendorProductCard(
//                       name: ctrl.productShowInUi[index].name ?? 'No name',
//                       imageUrl: ctrl.productShowInUi[index].image ?? '',
//                       //Image.asset('assets/images/The Splendid.png', fit: BoxFit.cover),
//                       price: ctrl.productShowInUi[index].price ?? 00,
//                       offerTag: '20 % off',
//                       onTap: () {
//                         Get.toNamed('/vendordescription', arguments: {
//                           'data': ctrl.productShowInUi[index],
//                         });
//                       },
//                     );
//                   },
//                 ),
//               ),