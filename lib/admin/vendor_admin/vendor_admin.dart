//import 'package:dropdown_button2/dropdown_button2.dart';
//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:the_splendid_market/constant/colors.dart';
import 'package:the_splendid_market/controller/vendor_controller.dart';
//import 'package:the_splendid_market/widgets/drop_down_btn.dart';
import 'dart:html';

class VendorAdmin extends StatefulWidget {
  const VendorAdmin({super.key});

  @override
  State<VendorAdmin> createState() => _VendorAdminState();
}

Future<void> _refresh(VendorController ctrl) {
  return ctrl.fetchLatestProducts();
}

class _VendorAdminState extends State<VendorAdmin> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VendorController>(
      builder: (ctrl) {
        return Scaffold(
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Products Lists',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: mainColor),
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () =>
                      _refresh(ctrl), // Pass the controller to _refresh
                  child: ListView.builder(
                    itemCount: ctrl.products.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(ctrl.products[index].name ?? ''),
                        subtitle:
                            Text((ctrl.products[index].price ?? 0).toString()),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            ctrl.deleteProduct(ctrl.products[index].id ?? '');
                            ctrl.update(); // Update the UI after deletion
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed('/addproduct');
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VendorController>(builder: (ctrl) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Colors.transparent,
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Add New Product',
                        style: TextStyle(
                            fontSize: 20,
                            color: mainColor,
                            fontWeight: FontWeight.bold),
                      ),
                      //const Spacer(),
                      const SizedBox(width: 60),
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
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () async {
                      FileUploadInputElement uploadInput =
                          FileUploadInputElement();
                      uploadInput.accept = 'image/*';
                      uploadInput.click();

                      uploadInput.onChange.listen((e) async {
                        final files = uploadInput.files;
                        if (files != null && files.isNotEmpty) {
                          final file = files[0];
                          String imageUrl = await ctrl.uploadImage(file);
                          if (imageUrl.isNotEmpty) {
                            ctrl.productImgUrl.value = imageUrl;
                            Get.snackbar(
                                'Success', 'Image selected successfully',
                                colorText: Colors.green);
                          } else {
                            Get.snackbar('Error', 'Something went wrong',
                                colorText: Colors.red);
                          }
                        }
                      });
                    },
                    child: Obx(() => Container(
                          width: 100, // Adjust width as needed
                          height: 100, // Adjust height as needed
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: mainColor, // Add border color if needed
                              width: 2, // Add border width if needed
                            ),
                          ),
                          child: Center(
                            child: ctrl.productImgUrl.value.isEmpty
                                ? const Icon(
                                    Icons.add_a_photo,
                                    size: 60,
                                    color: mainColor,
                                  )
                                : ClipRect(
                                    child: Image.network(
                                      ctrl.productImgUrl.value,

                                      fit: BoxFit.cover,
                                      width: 100, // Adjust image width
                                      height: 100, // Adjust image height
                                    ),
                                  ),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: ctrl.productNameCtrl,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        label: const Text('Product Name'),
                        hintText: 'Enter Your Product Name'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: ctrl.productDescriptionCtrl,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        label: const Text('Product Description'),
                        hintText: 'Enter Your Product Description'),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: ctrl.productPriceCtrl,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        label: const Text('Product Price'),
                        hintText: 'Enter Your Product Price'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: ctrl.productLastPriceCtrl,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        label: const Text('Last Price'),
                        hintText: 'Enter Your Product Price'),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: mainColor,
                            foregroundColor: Colors.white),
                        onPressed: () {
                          ctrl.addProduct();
                          ctrl.update();
                        },
                        child: const Text(
                          'Add Product',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}













// Row(
//                     children: [
//                       DropDownBtn(
//                         items: const [
//                           'Boots',
//                           'Shoe',
//                           'Beach Shoes',
//                           'High heels',
//                         ],
//                         selectedItemText: ctrl.category,
//                         onSelected: (selectedValue) {
//                           ctrl.category = selectedValue ?? 'general';
//                           ctrl.update();
//                         },
//                       ),
//                     ],
//                   ),