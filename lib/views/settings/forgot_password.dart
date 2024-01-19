import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noble_vintage/model/profile_model/forgot_password_model.dart';
import 'package:noble_vintage/views/auth_view/login_screen.dart';
import 'package:noble_vintage/views/settings/profile.dart';
import 'package:noble_vintage/widgets/custom_widgets.dart';
import 'package:noble_vintage/widgets/email_validator.dart';
import 'package:noble_vintage/widgets/profile_default_view.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/profile_textfield.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return ProfileDefaultView(
      headingText: 'Forgot Password',
      builder: (profileSize) {
        return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          Form(
            key: _formKey,
            child: ProfileTextFields(
              validatorCondition: (String? input) =>
                  input!.isValidEmail() ? null : "Invalid Email",
              controller: emailController,
              text: 'Email address',
              hintText: 'Enter Email',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: Get.height * 0.07,
          ),
          Container(
              width: Get.width * 0.3,
              child: Obx(() {
                return RoundedElevatedButton(
                  loading: userController.loading.value,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      userController.loading.value == true;
                      ForgotPasswordModel response =
                          await userController.userForgotPassword(
                        email: emailController.text.trim(),
                      );
                      if (response.status == 200) {
                        userController.loading.value == false;
                        Get.offAll(() => LoginScreen());
                        customToast(response.message);
                      } else {
                        customToast(response.message);
                      }
                    }
                  },
                  borderRadius: 23,
                  text: 'Confirm',
                );
              }))
        ]);
      },
      showBackArrow: true,
      showProfileIcon: false,
    );
  }
}
