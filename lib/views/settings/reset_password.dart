import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:noble_vintage/widgets/profile_default_view.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/profile_textfield.dart';
import '../auth_view/login_screen.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  File? _image;

  Future<void> getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return ProfileDefaultView(
      headingText: 'Change Password',
      showProfileIcon: false,
      builder: (profileSize) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            ProfileTextFields(
              text: 'Old password',
              hintText: 'Enter old password',
              obscureText: true,
            ),
            SizedBox(
              height: 10,
            ),
            ProfileTextFields(
              text: 'New password',
              hintText: 'Enter new password',
              obscureText: true,
            ),
            SizedBox(
              height: 10,
            ),
            ProfileTextFields(
              text: 'Confirm password',
              hintText: 'Enter new password again',
              obscureText: true,
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
                  Get.to(
                    () => LoginScreen(),
                  );
                },
                borderRadius: 23,
                text: 'Confirm',
              ),
            ),
          ],
        );
      },
      showBackArrow: true,
    );
  }
}
