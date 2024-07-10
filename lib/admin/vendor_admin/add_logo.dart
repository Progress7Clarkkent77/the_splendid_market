import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_splendid_market/constant/colors.dart';
import 'package:the_splendid_market/controller/login_controller.dart';
import 'package:the_splendid_market/controller/logo_controller.dart';
import 'package:the_splendid_market/model/user/user.dart';
import 'dart:html' as html; // Note the 'as html' part

class AddLogo extends StatefulWidget {
  const AddLogo({super.key});

  @override
  State<AddLogo> createState() => _AddLogoState();
}

class _AddLogoState extends State<AddLogo> {
  @override
  Widget build(BuildContext context) {
    final User? currentUser = Get.find<LoginController>().getCurrentUser();

    // Ensure that the LogoController is instantiated with currentUser
    Get.put(LogoController(currentUser));

    return GetBuilder<LogoController>(builder: (ctrl) {
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
                        'Add Logo',
                        style: TextStyle(
                            fontSize: 20,
                            color: mainColor,
                            fontWeight: FontWeight.bold),
                      ),
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
                      html.FileUploadInputElement uploadInput =
                          html.FileUploadInputElement();
                      uploadInput.accept = 'image/*';
                      uploadInput.click();

                      uploadInput.onChange.listen((e) async {
                        final files = uploadInput.files;
                        if (files != null && files.isNotEmpty) {
                          final file = files[0];
                          String imageUrl = await ctrl.uploadImage2(file);
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
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: mainColor,
                              width: 2,
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
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
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
                          ctrl.addUser2();
                          ctrl.update();
                        },
                        child: const Text(
                          'Add Logo',
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
