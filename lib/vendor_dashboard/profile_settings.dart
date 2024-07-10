import 'dart:io';

//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:the_splendid_market/constant/colors.dart';
import 'package:the_splendid_market/controller/login_controller.dart';
//import 'package:the_splendid_market/model/user/user.dart';
import 'package:the_splendid_market/widgets/text_&_intro_widget.dart';
//import 'package:the_splendid_market/widgets/text_and_intro_widget.dart';
//import 'package:path/path.dart' as Path;

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({super.key});

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController businessLocationController = TextEditingController();
  TextEditingController accountNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  getImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      selectedImage = File(image.path);
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.4,
              child: Stack(
                children: [
                  greenIntroWidgetWithoutLogos(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: () {
                        getImage(ImageSource.camera);
                      },
                      child: selectedImage == null
                          ? Container(
                              width: 120,
                              height: 120,
                              margin: const EdgeInsets.only(bottom: 20),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffD6D6D6)),
                              child: const Center(
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : Container(
                              width: 120,
                              height: 120,
                              margin: const EdgeInsets.only(bottom: 20),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: FileImage(selectedImage!),
                                      fit: BoxFit.fill),
                                  shape: BoxShape.circle,
                                  color: const Color(0xffD6D6D6)),
                            ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    textFieldWidget(
                      'Name',
                      Icons.person_outlined,
                      nameController,
                      (String? input) {
                        if (input!.isEmpty) {
                          return 'Name is required!';
                        }

                        if (input.length < 5) {
                          return 'Please enter a valid name!';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    textFieldWidget(
                      'Phone Number',
                      Icons.phone_outlined,
                      numberController,
                      (String? input) {
                        if (input!.isEmpty) {
                          return 'Phone Number is required!';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    textFieldWidget(
                      'Email',
                      Icons.email_outlined,
                      emailController,
                      (String? input) {
                        if (input!.isEmpty) {
                          return 'Email is required!';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    textFieldWidget(
                      'Account Name',
                      Icons.account_box_outlined,
                      accountNameController,
                      (String? input) {
                        if (input!.isEmpty) {
                          return 'Account Name is required!';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    textFieldWidget(
                      'Account Number',
                      Icons.account_balance_outlined,
                      accountNumberController,
                      (String? input) {
                        if (input!.isEmpty) {
                          return 'Account Number is required!';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    textFieldWidget(
                      'Business Name',
                      Icons.business_outlined,
                      businessNameController,
                      (String? input) {
                        if (input!.isEmpty) {
                          return 'Business Name is required!';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    textFieldWidget(
                      'Business Location',
                      Icons.location_on_outlined,
                      businessLocationController,
                      (String? input) {
                        if (input!.isEmpty) {
                          return 'Business Location is required!';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Obx(
                      () => loginController.isProfileUploading
                              .value // Replace this with your actual condition

                          // ignore: dead_code
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : greenButton('Submit', () {
                              if (!formKey.currentState!.validate()) {
                                return;
                              }

                              if (selectedImage == null) {
                                Get.snackbar(
                                    'Warning', 'Please add your image');
                                return;
                              }

                              //Add your logic to store user info here
                              // storeUserInfo(selectedImage!, nameController.text, ...);

                              loginController.isProfileUploading(true);
                              loginController.storeUserInfo(
                                selectedImage,
                                // nameController.text,
                                // numberController.text,
                                emailController.text,
                                businessNameController.text,
                                businessLocationController.text,
                                accountNameController.text,
                                accountNumberController.text,
                                url: loginController.myUser.value.image ?? "",
                              );
                            }),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget textFieldWidget(
    String title,
    IconData iconData,
    TextEditingController controller,
    String? Function(String?) validator, {
    Function? onTap,
    bool readOnly = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: mainColor,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          width: Get.width,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: mainColor.withOpacity(0.6),
                    spreadRadius: 1,
                    blurRadius: 1)
              ],
              borderRadius: BorderRadius.circular(8)),
          child: TextFormField(
            readOnly: readOnly,
            onTap: () => onTap?.call(),
            validator: validator,
            controller: controller,
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xffA7A7A7)),
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(
                  iconData,
                  color: mainColor,
                ),
              ),
              border: InputBorder.none,
            ),
          ),
        )
      ],
    );
  }

  Widget greenButton(String title, Function onPressed) {
    return MaterialButton(
      minWidth: Get.width,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: mainColor,
      onPressed: () => onPressed(),
      child: Text(
        title,
        style: GoogleFonts.poppins(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
