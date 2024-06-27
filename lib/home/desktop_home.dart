import 'package:flutter/material.dart';
import 'package:the_splendid_market/constant/colors.dart';

class DesktopHome extends StatelessWidget {
  const DesktopHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: double.infinity,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        'assets/images/The Splendid.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      'The Splendid Market',
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: mainColor,
                width: double.infinity,
                height: 20,
              ),
              Container(
                color: Colors.transparent,
                width: double.infinity,
                height: 550, // Adjust height as needed
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 550,
                        color: Colors.transparent,
                        child: Image.asset(
                          'assets/images/s1.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 550,
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Bring your business Online for free',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.024,
                                fontWeight: FontWeight.bold,
                                color: mainColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Center(
                              child: Text(
                                'Welcome to The Splendid Market, the e-commerce platform\n that empowers all business owners. Our sophisticated\n marketplace makes it easy for vendors to register, create,\n and manage their online shops effortlessly.\n Elevate your business with us today!',
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.018,
                                  // fontWeight: FontWeight.bold,
                                  color: mainColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            ElevatedButton(
                              onPressed: () {
                                //Navigator.pushNamed(context, '/vendor');
                              },
                              child: const Text(
                                'Explore',
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: mainColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: mainColor,
                width: double.infinity,
                height: 20,
              ),
              Container(
                color: Colors.transparent,
                width: double.infinity,
                height: 550, // Adjust height as needed
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 550,
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Buy and sell effortlessly in our vibrant online community',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.024,
                                fontWeight: FontWeight.bold,
                                color: mainColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Center(
                              child: Text(
                                'Whether you are a vendor looking to showcase\n your products or a buyer searching for unique items,\n our platform has everything you need.',
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.018,
                                  // fontWeight: FontWeight.bold,
                                  color: mainColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 550,
                        color: Colors.transparent,
                        child: Image.asset(
                          'assets/images/s3.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: mainColor,
                width: double.infinity,
                height: 20,
              ),
              Container(
                color: Colors.transparent,
                width: double.infinity,
                height: 550, // Adjust height as needed
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 550,
                        color: Colors.transparent,
                        child: Image.asset(
                          'assets/images/s2.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 550,
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Create a Free Online Shop & Domain',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.024,
                                fontWeight: FontWeight.bold,
                                color: mainColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Center(
                              child: Text(
                                'Set up your personal online shop for free and receive a unique website domain at no cost.',
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.018,
                                  // fontWeight: FontWeight.bold,
                                  color: mainColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: mainColor,
                width: double.infinity,
                height: 20,
              ),
              Container(
                color: Colors.black,
                height: MediaQuery.of(context).size.height *
                    0.16, // Adjust height as needed
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.transparent,
                        child: const Center(
                          child: Text(
                            'The Splendid Market',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.03,
                                height:
                                    MediaQuery.of(context).size.width * 0.03,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(
                                  'assets/images/whatsapp.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.02),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.03,
                                height:
                                    MediaQuery.of(context).size.width * 0.03,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(
                                  'assets/images/twitter.jpeg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.02),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.03,
                                height:
                                    MediaQuery.of(context).size.width * 0.03,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(
                                  'assets/images/Telegram.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.02),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.03,
                                height:
                                    MediaQuery.of(context).size.width * 0.03,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(
                                  'assets/images/facebook.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.transparent,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Privacy & policy',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Contact us',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'About us',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Terms & conditions',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
