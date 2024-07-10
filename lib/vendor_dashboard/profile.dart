//import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:the_splendid_market/constant/colors.dart';
import 'package:the_splendid_market/controller/login_controller.dart';
import 'package:the_splendid_market/controller/vendor_controller.dart';
import 'package:the_splendid_market/model/user/user.dart' as model;

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  final loginController = Get.find<LoginController>();

  @override
  void initState() {
    super.initState();
    nameController.text = loginController.myUser.value.name ?? "";
    numberController.text = loginController.myUser.value.number.toString();
    emailController.text = loginController.myUser.value.email ?? "";
    businessNameController.text =
        loginController.myUser.value.businessName ?? "";
    businessLocationController.text =
        loginController.myUser.value.businessLocation ?? "";
    accountNameController.text = loginController.myUser.value.accountName ?? "";
    accountNumberController.text =
        loginController.myUser.value.accountNumber ?? "";
  }

  @override
  Widget build(BuildContext context) {
    final model.User? currentUser = loginController.getCurrentUser();

    // Ensure that the VendorController is instantiated with currentUser
    Get.put(VendorController(currentUser));

    return GetBuilder<VendorController>(builder: (ctrl) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 80,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Profile",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: mainColor,
                              fontSize: 20,
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
                        Row(
                          children: [
                            const Text(
                              'Name: ',
                              style: TextStyle(
                                fontSize: 16,
                                color: mainColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 40),
                            Text(
                              nameController.text,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Mobile Number: ',
                              style: TextStyle(
                                fontSize: 16,
                                color: mainColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 40),
                            Text(
                              numberController.text,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
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
                          height: 30,
                        ),
                        Obx(
                          () => loginController.isProfileUploading.value
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : greenButton('Update', () {
                                  if (!formKey.currentState!.validate()) {
                                    return;
                                  }

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
                                    url: loginController.myUser.value.image ??
                                        "",
                                  );
                                }),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      );
    });
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
          style: const TextStyle(
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
                    color: mainColor.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1)
              ],
              borderRadius: BorderRadius.circular(8)),
          child: TextFormField(
            readOnly: readOnly,
            onTap: () => onTap?.call(),
            validator: validator,
            controller: controller,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
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
        ),
      ],
    );
  }

  Widget greenButton(String title, Function onPressed) {
    return MaterialButton(
      minWidth: 100,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: mainColor,
      onPressed: () => onPressed(),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
