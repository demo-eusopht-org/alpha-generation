import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/constants.dart';

class ProfileDefaultView extends StatefulWidget {
  final String headingText;
  final bool showBackArrow;
  final bool showProfileIcon;
  final Column Function(double profileSize) builder;
  const ProfileDefaultView({
    super.key,
    required this.headingText,
    required this.builder,
    required this.showBackArrow,
    required this.showProfileIcon,
  });

  @override
  State<ProfileDefaultView> createState() => _ProfileDefaultViewState();
}

class _ProfileDefaultViewState extends State<ProfileDefaultView> {
  File? _image;
  final _picker = ImagePicker();

  Future<void> getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

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
    final profileSize = size.height * 0.13;
    return Scaffold(
      extendBodyBehindAppBar: true,
      // backgroundColor: Constants.backgroundContColor,
      appBar: AppBar(
        elevation: 0.0,
        leading: Visibility(
          visible: widget.showBackArrow,
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                size: 25,
              )
              // Image.asset('assets/images/back_arrow.png'),
              ),
        ),
        backgroundColor: Constants.backgroundContColor,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            // margin: EdgeInsets.only(top: kBottomNavigationBarHeight
            // size.height * 0.065
            // ),
            width: double.infinity,
            color: Constants.backgroundContColor,
            height: (size.height * 0.21) + kBottomNavigationBarHeight,
            child: Text(
              widget.headingText,
              style: GoogleFonts.inter(
                fontSize: 30,
                fontWeight: FontWeight.w400,
                color: Constants.splashTextColor,
              ),
            ),

            //   // Row(
            //   //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   //   crossAxisAlignment: CrossAxisAlignment.start,
            //   //   children: [
            //   //     Expanded(
            //       child: Visibility(
            //         visible: widget.showBackArrow,
            //         child: Container(
            //           padding: EdgeInsets.only(left: 10),
            //           alignment: Alignment.topLeft,
            //           child: InkWell(
            //             onTap: () {
            //               Navigator.pop(context);
            //             },
            //             child: Image.asset('assets/images/back_arrow.png'),
            //           ),
            //         ),
            // //   //       ),
            //   //     ),
            //   //     Text(
            //   //       widget.headingText,
            //   //       style: GoogleFonts.inter(
            //   //         fontSize: 30,
            //   //         fontWeight: FontWeight.w400,
            //   //         color: Constants.splashTextColor,
            //   //       ),
            //   //     ),
            //   //     Expanded(child: SizedBox()),
            //   //   ],
            //   // ),
            //   color: Constants.backgroundContColor,
          ),
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(
                    left: 40,
                    right: 40,
                    top: widget.showProfileIcon ? profileSize / 2 : 10,
                  ),
                  child: SingleChildScrollView(
                    child: widget.builder(profileSize),
                  ),
                ),
                if (widget.showProfileIcon)
                  Positioned(
                    top: -(profileSize / 2),
                    // top: (size.height * 0.20) - (profileSize / 2),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
