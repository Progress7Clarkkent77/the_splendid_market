import 'package:flutter/material.dart';
import 'package:the_splendid_market/login/login_desktop.dart';
import 'package:the_splendid_market/login/login_mobile.dart';
import 'package:the_splendid_market/login/login_tablet.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            // Mobile layout
            return const LoginMobile();
          } else if (constraints.maxWidth < 1200) {
            // Tablet layout
            return const LoginTablet();
          } else {
            // Desktop layout
            return const LoginDesktop();
          }
        },
      ),
    );
  }
}
