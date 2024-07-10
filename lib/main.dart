import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:the_splendid_market/admin/vendor_admin/vendor_admin.dart';
import 'package:the_splendid_market/board/board_mobile.dart';
import 'package:the_splendid_market/constant/colors.dart';
import 'package:the_splendid_market/controller/login_controller.dart';
import 'package:the_splendid_market/controller/logo_controller.dart';
import 'package:the_splendid_market/controller/market_controller.dart';
import 'package:the_splendid_market/controller/purchase_controller.dart';
import 'package:the_splendid_market/controller/shop_controller.dart';
import 'package:the_splendid_market/controller/vendor_controller.dart';

import 'package:the_splendid_market/home/home.dart';
import 'package:the_splendid_market/login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:the_splendid_market/market/shop/product_description_page.dart';
import 'package:the_splendid_market/market/shop/shop.dart';
import 'package:the_splendid_market/market/stores/market.dart';
import 'package:the_splendid_market/vendor_dashboard/profile.dart';
import 'package:the_splendid_market/vendor_dashboard/profile_settings.dart';
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
  Get.put(VendorController);
  Get.put(LoginController());
  Get.put(ShopController);
  Get.put(PurchaseController);
  Get.put(MarketController());
  Get.put(LogoController);
  //Get.put(VendorDashboardController());
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
        '/signup': (context) => const Register(),
        '/vendor': (context) => const VendorAdmin(),
        '/addproduct': (context) => const AddProduct(),
        '/shop': (context) => const Shop(),
        '/description': (context) => const ProductDescriptionPage(),
        '/vendordashboard': (context) => const VendorDashboard(),
        '/vendordescription': (context) => const VendorDescription(),
        '/vendorshop': (context) => const VendorShop(),
        '/boardmobile': (context) => const BoardMobile(),
        '/profile': (context) => const Profile(),
        '/profilesettings': (context) => const ProfileSettingScreen(),
        '/market': (context) => const Market(),
        '/page8': (context) => const Page8(),
        '/page3': (context) => const Page3(),
        '/page4': (context) => const Page4(),
      },
    );
  }
}

















// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// import 'package:the_splendid_market/admin/vendor_admin/vendor_admin.dart';
// import 'package:the_splendid_market/board/board_mobile.dart';
// import 'package:the_splendid_market/constant/colors.dart';
// import 'package:the_splendid_market/controller/login_controller.dart';
// import 'package:the_splendid_market/controller/purchase_controller.dart';
// import 'package:the_splendid_market/controller/shop_controller.dart';
// import 'package:the_splendid_market/controller/vendor_controller.dart';

// import 'package:the_splendid_market/home/home.dart';
// import 'package:the_splendid_market/login/login.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:the_splendid_market/market/shop/product_description_page.dart';
// import 'package:the_splendid_market/market/shop/shop.dart';
// import 'package:the_splendid_market/vendor_dashboard/profile.dart';
// import 'package:the_splendid_market/vendor_dashboard/profile_settings.dart';
// import 'package:the_splendid_market/vendor_dashboard/vendor_dashboard.dart';
// import 'package:the_splendid_market/vendor_dashboard/vendor_description.dart';
// import 'package:url_strategy/url_strategy.dart';
// import 'firebase_options.dart';

// void main() async {
//   setPathUrlStrategy();
//   await GetStorage.init();
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

// //? registering my controllers
//   final loginController = Get.put(LoginController());
//   final currentUser = loginController.getCurrentUser();
//   Get.put(VendorController(currentUser));
//   Get.put(ShopController());
//   Get.put(PurchaseController());

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'The Splendid',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
//         useMaterial3: true,
//       ),
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const Home(),
//         '/home': (context) => const Home(),
//         '/login': (context) => const Login(),
//         '/signup': (context) => const Register(),
//         '/productLists': (context) => const VendorAdmin(),
//         '/addproduct': (context) => const AddProduct(),
//         '/shop': (context) => const Shop(),
//         '/description': (context) => const ProductDescriptionPage(),
//         '/vendordashboard': (context) => const VendorDashboard(),
//         '/vendordescription': (context) => const VendorDescription(),
//         '/vendorshop': (context) => const VendorShop(),
//         '/boardmobile': (context) => const BoardMobile(),
//         '/profile': (context) => const Profile(),
//         '/profilesettings': (context) => const ProfileSettingScreen(),
//         '/page8': (context) => const Page8(),
//       },
//     );
//   }
// }

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
