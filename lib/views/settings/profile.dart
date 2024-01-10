import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:noble_vintage/views/settings/reset_password.dart';

import '../../utils/constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/profile_textfield.dart';
import '../auth_view/login_screen.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                  SizedBox(
                    height: (size.height * 0.25) + (profileSize / 2),
                  ),
                  ProfileTextFields(
                    text: 'Email address',
                    hintText: 'Enter Email',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ProfileTextFields(
                    text: 'Username',
                    hintText: 'Enter Name',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ProfileTextFields(
                        text: 'Password',
                        hintText: 'Enter Password',
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => ResetPassword());
                        },
                        child: Text(
                          'Reset Password?',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Constants.backgroundContColor,
                          ),
                        ),
                      )
                    ],
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
                      text: 'Logout',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: size.height * 0.20,
            color: Constants.backgroundContColor,
          ),
          Positioned(
            top: (size.height * 0.20) - (profileSize / 2),
            left: 0,
            right: 0,
            child: Container(
              width: profileSize,
              height: profileSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: kElevationToShadow[2],
              ),
              padding: EdgeInsets.all(10.0),
              child: _image != null
                  ? ClipOval(
                      clipBehavior: Clip.antiAlias,
                      child: Image.file(
                        _image!,
                        // fit: BoxFit.cover,
                        // width: profileSize - 20,
                        // height: profileSize - 20,
                      ),
                    )
                  : Image.asset(
                      'assets/images/profile_image.png',
                    ),
            ),
          ),
          Positioned(
            top: Get.height * 0.05,
            right: 0,
            left: 0,
            child: Text(
              'Profile',
              style: GoogleFonts.inter(
                fontSize: 30,
                fontWeight: FontWeight.w400,
                color: Constants.splashTextColor,
              ),
              textAlign: TextAlign.center,
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
