import 'package:flutter/material.dart';
import 'package:the_splendid_market/home/desktop_home.dart';
import 'package:the_splendid_market/home/mobile_home.dart';
import 'package:the_splendid_market/home/tablet_home.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            // Mobile layout
            return const MobileHome();
          } else if (constraints.maxWidth < 1200) {
            // Tablet layout
            return const TabletHome();
          } else {
            // Desktop layout
            return const DesktopHome();
          }
        },
      ),
    );
  }
}
