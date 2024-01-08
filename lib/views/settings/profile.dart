import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:noble_vintage/utils/constants.dart';
import 'package:noble_vintage/widgets/custom_button.dart';

import '../../widgets/profile_textfield.dart';

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(
                  'assets/images/profile_background.png',
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 45,
                  child: Text(
                    'Profile',
                    style: GoogleFonts.inter(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // getImage();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: _image != null
                          ? ClipOval(
                              clipBehavior: Clip.antiAlias,
                              child: Image.file(
                                _image!,
                                fit: BoxFit.cover,
                                width: 80,
                                height: 80,
                              ),
                            )
                          : Image.asset(
                              'assets/images/profile_image.png',
                            ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfileTextFields(
                      text: 'Email address',
                      hintText: 'example.@gmail.com',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ProfileTextFields(
                      text: 'Username',
                      hintText: 'Lorem Ipsum',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ProfileTextFields(
                          text: 'Password',
                          hintText: '*************',
                        ),
                        Text(
                          'Reset Password?',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Constants.backgroundContColor,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: Get.height * 0.18,
                    ),
                    Container(
                      width: Get.width * 0.3,
                      child: RoundedElevatedButton(
                        onPressed: () {},
                        borderRadius: 23,
                        text: 'Logout',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
