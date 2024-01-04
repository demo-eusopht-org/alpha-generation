import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noble_vintage/utils/constants.dart';
import 'package:noble_vintage/views/auth_view/signup_screen.dart';
import 'package:noble_vintage/widgets/bottom_Navigation.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        width: 120,
        color: Colors.white,
        height: kBottomNavigationBarHeight,
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.055,
            child: RoundedElevatedButton(
              text: 'Sign up',
              onPressed: () {
                Get.to(
                  () => SignupScreen(),
                );
              },
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/images/Rolex-Watch.png',
              width: MediaQuery.of(context).size.width * 0.34,
            ),
          ),
          SizedBox.fromSize(
            size: MediaQuery.sizeOf(context),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.2,
                    ),
                    Text(
                      'Log in',
                      style: GoogleFonts.inter(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Constants.backgroundContColor,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(20),
                      child: Image.asset(
                        'assets/images/Account.png',
                        height: 50,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      hintText: 'Email Address',
                    ),
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //     contentPadding: EdgeInsets.all(0.0),
                    //     isDense: true,
                    //     hintText: 'Email address',
                    //     hintStyle: GoogleFonts.inter(
                    //       fontSize: 14,
                    //       fontWeight: FontWeight.w500,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 10),
                    CustomTextField(
                      showPasswordHideButton: true,
                      hintText: 'Password',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: RoundedElevatedButton(
                        text: 'Login',
                        onPressed: () {
                          Get.to(
                            () => MainScreen(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
