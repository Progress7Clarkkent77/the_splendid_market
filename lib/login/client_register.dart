import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_splendid_market/constant/colors.dart';
import 'package:the_splendid_market/controller/login_controller.dart';
import 'package:the_splendid_market/widgets/otp_text_field.dart';

class ClientRegister extends StatelessWidget {
  const ClientRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (ctrl) {
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(20.0),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Create Your Account !!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: mainColor,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.phone,
                controller: ctrl.registerNameCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.phone_android),
                  labelText: 'Your Name',
                  hintText: 'Enter your Name',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.phone,
                controller: ctrl.registerNumberCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.phone_android),
                  labelText: 'Mobile Number',
                  hintText: 'Enter your Mobile Number',
                ),
              ),
              const SizedBox(height: 20),
              OtpTextField(
                otpController: ctrl.otpController,
                visible: ctrl.otpFieldShown,
                onComplete: (otp) {
                  ctrl.otpEnter = int.tryParse(otp ?? '0000');
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (ctrl.otpFieldShown) {
                    ctrl.addUser();
                  } else {
                    ctrl.sendOtp();
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: mainColor,
                ),
                child: Text(ctrl.otpFieldShown ? 'Register' : 'Send OTP'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/clientlogin');
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      );
    });
  }
}
