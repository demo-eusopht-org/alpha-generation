import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noble_vintage/services/local_storage_service.dart';
import 'package:noble_vintage/services/locator.dart';
import 'package:noble_vintage/views/settings/reset_password.dart';
import 'package:noble_vintage/widgets/profile_default_view.dart';

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
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return ProfileDefaultView(
      headingText: 'Profile',
      showBackArrow: false,
      showProfileIcon: true,
      builder: (profileSize) {
        return Column(
          children: [
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
                    Get.to(() => ResetPassword()
                        // Navigator.push(
                        //   context,
                        //   CupertinoPageRoute(
                        //     builder: (context) => ResetPassword(),
                        //   ),
                        );
                  },
                  child: Text(
                    'Change Password?',
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
              height: Get.height * 0.07,
            ),
            Container(
              width: Get.width * 0.3,
              child: RoundedElevatedButton(
                onPressed: () async {
                  await locator<LocalStorageService>().clearAll();
                  Get.offAll(
                    () => LoginScreen(),
                  );
                },
                borderRadius: 23,
                text: 'Logout',
              ),
            ),
          ],
        );
      },
    );

    // return Scaffold(
    //   body: SafeArea(
    //     child: Stack(
    //       children: [
    //         Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
    //           child: SingleChildScrollView(
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //                 SizedBox(
    //                   height: (size.height * 0.25) + (profileSize / 2),
    //                 ),
    //                 ProfileTextFields(
    //                   text: 'Email address',
    //                   hintText: 'Enter Email',
    //                 ),
    //                 SizedBox(
    //                   height: 10,
    //                 ),
    //                 ProfileTextFields(
    //                   text: 'Username',
    //                   hintText: 'Enter Name',
    //                 ),
    //                 SizedBox(
    //                   height: 10,
    //                 ),
    //                 Column(
    //                   crossAxisAlignment: CrossAxisAlignment.end,
    //                   children: [
    //                     ProfileTextFields(
    //                       text: 'Password',
    //                       hintText: 'Enter Password',
    //                       obscureText: true,
    //                     ),
    //                     SizedBox(
    //                       height: 5,
    //                     ),
    //                     GestureDetector(
    //                       onTap: () {
    //                         Get.to(() => ResetPassword());
    //                       },
    //                       child: Text(
    //                         'Reset Password?',
    //                         style: GoogleFonts.inter(
    //                           fontSize: 14,
    //                           fontWeight: FontWeight.w500,
    //                           color: Constants.backgroundContColor,
    //                         ),
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //                 Container(
    //                   height: Get.height * 0.1,
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
    //               ],
    //             ),
    //           ),
    //         ),
    //
    //         // Positioned(
    //         //   top: (size.height * 0.20) / 2,
    //         //   // top: Get.height * 0.065,
    //         //   right: 0,
    //         //   left: 0,
    //         //   child: Text(
    //         //     'Profile',
    //         //     style: GoogleFonts.inter(
    //         //       fontSize: 30,
    //         //       fontWeight: FontWeight.w400,
    //         //       color: Constants.splashTextColor,
    //         //     ),
    //         //     textAlign: TextAlign.center,
    //         //   ),
    //         // ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
