import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noble_vintage/utils/constants.dart';
import 'package:noble_vintage/widgets/bottom_Navigation.dart';
import 'package:noble_vintage/widgets/custom_button.dart';

import '../../widgets/custom_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top-left image
          Positioned(
            top: 33,
            left: 0,
            child: Image.asset(
              'assets/images/Blank-T-Shirt.png',
              width: MediaQuery.of(context).size.width * 0.4,
            ),
          ),

          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/images/Leather-Bag.png',
              width: MediaQuery.of(context).size.width * 0.4,
            ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Sign Up',
                        style: GoogleFonts.inter(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'assets/images/Ellipse 1.png',
                            height: 80,
                          ),
                          Image.asset(
                            'assets/images/Account.png',
                            height: 50,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      CustomTextField(
                        hintText: 'Email address',
                      ),
                      SizedBox(height: 10),
                      CustomTextField(
                        hintText: 'Username',
                      ),
                      SizedBox(height: 10),
                      CustomTextField(
                        showPasswordHideButton: true,
                        hintText: 'Password',
                      ),
                      SizedBox(height: 10),
                      CustomTextField(
                        showPasswordHideButton: true,
                        hintText: 'Repeat Password',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: RoundedElevatedButton(
                          text: 'Sign up',
                          onPressed: () {
                            Get.to(
                              () => MainScreen(),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: Get.height * 0.15,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Constants.backgroundContColor,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(
                              image: AssetImage(
                                "assets/images/Google.png",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 24, right: 8),
                              child: Text(
                                'Sign in with Google',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(
                            () => MainScreen(),
                          );
                        },
                        child: Text(
                          'Sign up later',
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Constants.backgroundContColor,
                          ),
                        ),
                      ),
                      Container(
                        height: Get.height * 0.04,
                      ),
                      Text(
                        'Terms Of Services',
                        style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
