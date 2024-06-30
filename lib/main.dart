import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:the_splendid_market/admin/vendor_admin/vendor_admin.dart';
import 'package:the_splendid_market/board/board_mobile.dart';
import 'package:the_splendid_market/constant/colors.dart';
import 'package:the_splendid_market/controller/login_controller.dart';
import 'package:the_splendid_market/controller/purchase_controller.dart';
import 'package:the_splendid_market/controller/shop_controller.dart';
import 'package:the_splendid_market/controller/vendor_controller.dart';
import 'package:the_splendid_market/controller/vendor_dashboard_controller.dart';
import 'package:the_splendid_market/home/home.dart';
import 'package:the_splendid_market/login/client_login.dart';
import 'package:the_splendid_market/login/client_register.dart';
import 'package:the_splendid_market/login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:the_splendid_market/market/shop/product_description_page.dart';
import 'package:the_splendid_market/market/shop/shop.dart';
import 'package:the_splendid_market/vendor_dashboard/vendor_dashboard.dart';
import 'package:the_splendid_market/vendor_dashboard/vendor_description.dart';
import 'package:url_strategy/url_strategy.dart';
import 'firebase_options.dart';

void main() async {
  setPathUrlStrategy();
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

//? registering my controller
  Get.put(VendorController());
  Get.put(LoginController());
  Get.put(ShopController());
  Get.put(PurchaseController());
  Get.put(VendorDashboardController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'The Splendid',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/home': (context) => const Home(),
        '/login': (context) => const Login(),
        '/vendor': (context) => const VendorAdmin(),
        '/addproduct': (context) => const AddProduct(),
        '/clientlogin': (context) => const ClientLogin(),
        '/clientregister': (context) => const ClientRegister(),
        '/shop': (context) => const Shop(),
        '/description': (context) => const ProductDescriptionPage(),
        '/vendordashboard': (context) => const VendorDashboard(),
        '/vendordescription': (context) => const VendorDescription(),
        '/vendorshop': (context) => const VendorShop(),
        '/boardmobile': (context) => const BoardMobile(),
        '/ellysePerry': (context) => EllysePerryPage(),
        '/emmaGrace': (context) => EmmaGracePage(),
        '/sophiaSmith1': (context) => SophiaSmithPage(),
        '/sophiaJohnson': (context) => SophiaJohnsonPage(),
      },
    );
  }
}

// class SettingsPage extends StatelessWidget {
//   const SettingsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Settings Page')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text('Welcome to the Settings Page'),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/homepage');
//               },
//               child: const Text('Go to Home Page'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
