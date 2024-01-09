import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/constants.dart';
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
    // return DefaultWidget(
    //   blueRatio: 0.3,
    //   child: Column(
    //     children: [
    //       Container(
    //         width: 100,
    //         height: 100,
    //         decoration: BoxDecoration(
    //           shape: BoxShape.circle,
    //           color: Colors.white,
    //         ),
    //         child: _image != null
    //             ? ClipOval(
    //                 clipBehavior: Clip.antiAlias,
    //                 child: Image.file(
    //                   _image!,
    //                   fit: BoxFit.cover,
    //                   width: 80,
    //                   height: 80,
    //                 ),
    //               )
    //             : Image.asset(
    //                 'assets/images/profile_image.png',
    //               ),
    //       ),
    //       Expanded(
    //         flex: 5,
    //         child: SizedBox(),
    //       ),
    //     ],
    //   ),
    // );
    final size = MediaQuery.sizeOf(context);
    final profileSize = size.height * 0.13;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: (size.height * 0.28)),
                  ProfileTextFields(
                    text: 'Old password',
                    hintText: '*************',
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ProfileTextFields(
                    text: 'New password',
                    hintText: '*************',
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ProfileTextFields(
                    text: 'Confirm password',
                    hintText: '*************',
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: Get.height * 0.1,
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
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: size.height * 0.23,
            color: Constants.backgroundContColor,
          ),
          Positioned(
            top: 65,
            right: 0,
            left: 0,
            child: Text(
              'Reset password',
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.w800,
                color: Constants.splashTextColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            top: 15,
            left: 20,
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Image.asset(
                'assets/images/back_arrow.png',
              ),
            ),
          ),
        ],
      ),
    );
    //   Scaffold(
    //   body: SingleChildScrollView(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.stretch,
    //       children: [
    //         Stack(
    //           alignment: Alignment.bottomCenter,
    //           children: [
    //             Image.asset(
    //               'assets/images/profile_bg.png',
    //               fit: BoxFit.cover,
    //             ),
    //             Positioned(
    //               top: 45,
    //               child: Text(
    //                 'Profile',
    //                 style: GoogleFonts.inter(
    //                   fontSize: 32,
    //                   fontWeight: FontWeight.w800,
    //                   color: Constants.splashTextColor,
    //                 ),
    //               ),
    //             ),
    //             GestureDetector(
    //               onTap: () {
    //                 // getImage();
    //               },
    //               child: Padding(
    //                 padding: const EdgeInsets.only(bottom: 20),
    //                 child: Container(
    //                   width: 100,
    //                   height: 100,
    //                   decoration: BoxDecoration(
    //                     shape: BoxShape.circle,
    //                     color: Colors.white,
    //                   ),
    //                   child: _image != null
    //                       ? ClipOval(
    //                           clipBehavior: Clip.antiAlias,
    //                           child: Image.file(
    //                             _image!,
    //                             fit: BoxFit.cover,
    //                             width: 80,
    //                             height: 80,
    //                           ),
    //                         )
    //                       : Image.asset(
    //                           'assets/images/profile_image.png',
    //                         ),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.all(40.0),
    //           child: SingleChildScrollView(
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: [
    //                 ProfileTextFields(
    //                   text: 'Email address',
    //                   hintText: 'example.@gmail.com',
    //                 ),
    //                 SizedBox(
    //                   height: 10,
    //                 ),
    //                 ProfileTextFields(
    //                   text: 'Username',
    //                   hintText: 'Lorem Ipsum',
    //                 ),
    //                 SizedBox(
    //                   height: 10,
    //                 ),
    //                 Column(
    //                   crossAxisAlignment: CrossAxisAlignment.end,
    //                   children: [
    //                     ProfileTextFields(
    //                       text: 'Password',
    //                       hintText: '*************',
    //                     ),
    //                     Text(
    //                       'Reset Password?',
    //                       style: GoogleFonts.inter(
    //                         fontWeight: FontWeight.w500,
    //                         fontSize: 14,
    //                         color: Constants.backgroundContColor,
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 Container(
    //                   height: Get.height * 0.18,
    //                 ),
    //                 Container(
    //                   width: Get.width * 0.3,
    //                   child: RoundedElevatedButton(
    //                     onPressed: () {
    //                       Get.to(
    //                         () => LoginScreen(),
    //                       );
    //                     },
    //                     borderRadius: 23,
    //                     text: 'Logout',
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   height: 20,
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
