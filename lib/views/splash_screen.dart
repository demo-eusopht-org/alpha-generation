import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noble_vintage/utils/constants.dart';
import 'package:noble_vintage/views/auth_view/login_screen.dart';
import 'package:noble_vintage/views/auth_view/signup_screen.dart';

import '../widgets/splash_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.splashScreenBackgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.03,
            left: 0,
            child: Image.asset(
              'assets/images/Blank-T-Shirt.png',
              width: MediaQuery.of(context).size.width * 0.4,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            right: 0,
            child: Image.asset(
              'assets/images/Leather-Bag.png',
              width: MediaQuery.of(context).size.width * 0.4,
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.0,
            left: 0,
            child: Image.asset(
              'assets/images/White-Cushion.png',
              width: MediaQuery.of(context).size.width * 0.4,
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.04,
            right: 0,
            child: Image.asset(
              'assets/images/Rolex-Watch.png',
              width: MediaQuery.of(context).size.width * 0.4,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: MediaQuery.of(context).size.height * 0.2,
            child: Image.asset(
              'assets/images/Logo_Alpha.png',
              height: 70,
              width: 70,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  'Alpha Generation',
                  style: GoogleFonts.pinyonScript(
                    fontSize: MediaQuery.of(context).size.width * 0.1,
                    color: Constants.splashTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'WATCH & JEWELLERY',
                  style: GoogleFonts.inika(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    color: Constants.splashTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 3,
                        vertical: 5,
                      ),
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: RoundedElevatedButtonSplash(
                        onPressed: () {
                          Get.to(
                            () => LoginScreen(),
                          );
                        },
                        text: 'Login',
                        borderRadius: 30,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: RoundedElevatedButtonSplash(
                        onPressed: () {
                          Get.to(
                            () => SignupScreen(),
                          );
                        },
                        text: 'SignUp',
                        borderRadius: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
