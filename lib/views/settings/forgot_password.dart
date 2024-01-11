import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noble_vintage/widgets/profile_default_view.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/profile_textfield.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return ProfileDefaultView(
      headingText: 'Forgot Password',
      builder: (profileSize) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            ProfileTextFields(
              text: 'Email address',
              hintText: 'Enter Email',
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: Get.height * 0.07,
            ),
            Container(
              width: Get.width * 0.3,
              child: RoundedElevatedButton(
                onPressed: () {
                  // Get.to(
                  //       () => LoginScreen(),
                  // );
                },
                borderRadius: 23,
                text: 'Confirm',
              ),
            ),
          ],
        );
      },
      showBackArrow: true,
      showProfileIcon: false,
    );
  }
}
