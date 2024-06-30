import 'package:flutter/material.dart';
import 'package:the_splendid_market/constant/colors.dart';

class MobileHome extends StatelessWidget {
  const MobileHome({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          'assets/images/The Splendid.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    const Text(
                      'The Splendid Market',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/boardmobile');
                      },
                      child: const Text(
                        'Explore',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: mainColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: mainColor,
                width: double.infinity,
                height: 10,
              ),
              Container(
                color: Colors.transparent,
                height: 300,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/s1.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                color: Colors.transparent,
                width: double.infinity,
                height: 150,
                child: const Column(
                  children: [
                    Text(
                      'Bring your business',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Online for free',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        'Welcome to The Splendid Market, the e-commerce platform\n that empowers all business owners. Our sophisticated\n marketplace makes it easy for vendors to register, create,\n and manage their online shops effortlessly.\n Elevate your business with us today!',
                        style: TextStyle(
                          fontSize: 11,
                          //fontWeight: FontWeight.bold,
                          color: mainColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: mainColor,
                width: double.infinity,
                height: 10,
              ),
              Container(
                color: Colors.transparent,
                height: 300,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/s3.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                color: Colors.transparent,
                height: 110,
                width: double.infinity,
                child: const Column(
                  children: [
                    Text(
                      'Buy and sell effortlessly',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                    ),
                    Text(
                      'in our vibrant online community',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Whether you are a vendor looking to showcase\n your products or a buyer searching for unique items,\n our platform has everything you need.',
                      style: TextStyle(
                        fontSize: 11,
                        //fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                color: mainColor,
                width: double.infinity,
                height: 10,
              ),
              Container(
                color: Colors.transparent,
                height: 300,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/s2.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                color: Colors.transparent,
                width: double.infinity,
                height: 100,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Create a Free Online Shop & Domain',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Set up your personal online shop for free\n and\n receive a unique website domain at no cost.',
                      style: TextStyle(
                        fontSize: 11,
                        //fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                color: mainColor,
                width: double.infinity,
                height: 10,
              ),
              Container(
                color: Colors.black,
                height: 190,
                width: double.infinity,
                child: Column(
                  children: [
                    const Text(
                      'The Splendid Market',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Privacy & policy',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Contact us',
                            style: TextStyle(
                              fontSize: 15,
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
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Terms & conditions',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 243, 236, 236),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 30,
                            height: 30,
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
                        const SizedBox(width: 15),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 27,
                            height: 28,
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
                        const SizedBox(width: 15),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 30,
                            height: 30,
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
                        const SizedBox(width: 15),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 30,
                            height: 30,
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
                  ],
                ),
              ),
              Container(
                color: mainColor,
                width: double.infinity,
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
