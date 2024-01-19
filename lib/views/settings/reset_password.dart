import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:noble_vintage/widgets/custom_widgets.dart';
import 'package:noble_vintage/widgets/profile_default_view.dart';

import '../../controller/user_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/profile_textfield.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final userController = Get.put(UserController());
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> changePassword() async {
    if (_formKey.currentState!.validate()) {
      userController.loading.value == true;
      final oldPassword = oldPasswordController.text;
      final newPassword = newPasswordController.text;
      final confirmPassword = confirmPasswordController.text;
      if (newPassword != confirmPassword) {
        customToast('Passowrd dont Match');
        return;
      }
      final response = await userController.userUpdatePassword(
        currentPassword: oldPassword,
        newPassword: newPassword,
      );
      if (response != null) {
        userController.loading.value == false;
        customToast(
          response.message ?? 'Password changed successfully!',
        );
        Get.back();
      }
    }
  }

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
    return Form(
      key: _formKey,
      child: ProfileDefaultView(
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
                validatorCondition: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter old password';
                  }
                  return null;
                },
                controller: oldPasswordController,
                text: 'Old password',
                hintText: 'Enter old password',
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              ProfileTextFields(
                validatorCondition: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your new password';
                  }
                  return null;
                },
                controller: newPasswordController,
                text: 'New password',
                hintText: 'Enter new password',
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              ProfileTextFields(
                validatorCondition: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your confirm password';
                  }
                  return null;
                },
                controller: confirmPasswordController,
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
                child: Obx(() {
                  return RoundedElevatedButton(
                    loading: userController.loading.value,
                    onPressed: () {
                      changePassword();
                    },
                    borderRadius: 23,
                    text: 'Confirm',
                  );
                }),
              ),
            ],
          );
        },
        showBackArrow: true,
      ),
    );
  }
}
