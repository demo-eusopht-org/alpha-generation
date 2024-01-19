// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:noble_vintage/utils/constants.dart';
//
// class TermsOfServiceScreen extends StatefulWidget {
//   @override
//   State<TermsOfServiceScreen> createState() => _TermsOfServiceScreenState();
// }
//
// class _TermsOfServiceScreenState extends State<TermsOfServiceScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   backgroundColor: Constants.backgroundContColor,
//       //   title: Text(
//       //     'Terms of Service',
//       //     style: GoogleFonts.inter(
//       //       color: Constants.splashTextColor,
//       //     ),
//       //   ),
//       //   leading: InkWell(
//       //     onTap: () {
//       //       Get.back();
//       //     },
//       //     child: Icon(
//       //       Icons.arrow_back_ios,
//       //       color: Colors.white,
//       //     ),
//       //   ),
//       //   centerTitle: true,
//       // ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Text(
//             //   'Welcome to Our App',
//             //   style: TextStyle(
//             //     fontSize: 24,
//             //     fontWeight: FontWeight.bold,
//             //   ),
//             // ),
//             SizedBox(height: 16),
//             Text(
//               'Please read these terms carefully before using our app.',
//               style: TextStyle(
//                 fontSize: 16,
//               ),
//             ),
//             SizedBox(height: 16),
//             Text(
//               '1. Acceptance of Terms',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'By using our app, you agree to be bound by these terms.',
//               style: TextStyle(
//                 fontSize: 16,
//               ),
//             ),
//             SizedBox(height: 16),
//             Text(
//               '2. User Conduct',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'You agree to use the app in accordance with all applicable laws and regulations.',
//               style: TextStyle(
//                 fontSize: 16,
//               ),
//             ),
//
//             SizedBox(height: 16),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:noble_vintage/widgets/profile_default_view.dart';

class TermsOfServiceScreen extends StatefulWidget {
  const TermsOfServiceScreen({super.key});

  @override
  State<TermsOfServiceScreen> createState() => _TermsOfServiceScreenState();
}

class _TermsOfServiceScreenState extends State<TermsOfServiceScreen> {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return ProfileDefaultView(
      headingText: 'Terms Of Service',
      builder: (profileSize) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            Text(
              'Please read these terms carefully before using our app.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '1. Acceptance of Terms',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'By using our app, you agree to be bound by these terms.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '2. User Conduct',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'You agree to use the app in accordance with all applicable laws and regulations.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
          ],
        );
      },
      showBackArrow: true,
      showProfileIcon: false,
    );
  }
}
