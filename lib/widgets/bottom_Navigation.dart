import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:noble_vintage/utils/constants.dart';
import 'package:noble_vintage/views/home/home_screen.dart';

import '../views/product/add_product.dart';
import '../views/settings/profile.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  // final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  int selectedPage = 0;
  final screens = [HomeScreen(), AddProduct(), Profile()];
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  // void _handleSignIn() async {
  //   try {
  //     await _googleSignIn.signIn();
  //   } catch (error) {
  //     print('Error signing in: $error');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ConvexAppBar(
          top: -20,
          controller: _tabController,
          height: 50,
          backgroundColor: Constants.backgroundContColor,
          items: [
            TabItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.black,
                size: 35,
              ),
            ),
            TabItem(
              icon: Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.camera_alt,
                color: Colors.black,
                size: 35,
              ),
            ),
            TabItem(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.person,
                color: Colors.black,
                size: 35,
              ),
            ),
          ],
          onTap: (int index) async {
            print('Tapped item at index $index');
            if (index == 1) {
              final shouldChange = await Get.bottomSheet<bool>(
                Container(
                  color: Colors.black,
                  height: 200,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: Get.width * 0.72,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Constants.backgroundContColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            // _handleSignIn();
                            Get.back<bool>(
                              result: false,
                            );
                            selectedPage = index;
                            _tabController.index = selectedPage;
                            setState(() {});
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage(
                                    "assets/images/Google.png",
                                  ),
                                  height: 18.0,
                                  width: 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Text(
                                    'Continue with Google',
                                    style: GoogleFonts.inter(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     Get.back();
                      //     selectedPage = index;
                      //     _tabController.index = selectedPage;
                      //     setState(() {});
                      //   },
                      //   child: Text('Sign In with Google'),
                      // ),
                      Container(
                        width: Get.width * 0.72,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Constants.backgroundContColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Get.back<bool>(
                              result: false,
                            );
                            selectedPage = index;
                            _tabController.index = selectedPage;
                            setState(() {});
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Image(
                                  image: AssetImage(
                                    "assets/images/email.png",
                                  ),
                                  height: 18.0,
                                  width: 24,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 12),
                                  child: Text(
                                    'Continue with Email',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
              if (shouldChange ?? true) {
                _tabController.index = 0;
              }
            } else {
              selectedPage = index;
              print(screens[index]);
            }
            setState(() {});
          },
          initialActiveIndex: selectedPage,
          style: TabStyle.reactCircle,
        ),
      ),
      body: screens[selectedPage],
    );
  }
}
// Padding(
//   padding: const EdgeInsets.only(left: 10, right: 10),
//   child: Container(
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.only(
//           bottomRight: Radius.circular(20),
//           bottomLeft: Radius.circular(20)),
//       color: Constants.backgroundContColor,
//     ),
//     child: Padding(
//       padding: const EdgeInsets.only(left: 10, right: 10),
//       child: BottomNavigationBar(
//         backgroundColor: Constants.backgroundContColor,
//         selectedItemColor: Colors.black,
//         unselectedItemColor: Colors.white,
//         selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
//         unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
//         type: BottomNavigationBarType.fixed,
//         items: [
//           BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.home,
//               ),
//               label: ''),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.shopping_cart), label: ''),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.manage_accounts), label: ''),
//         ],
//         currentIndex: selectedPage,
//         onTap: (int index) {
//           setState(() {
//             selectedPage = index;
//             print(screens[index]);
//           });
//           print('Tapped item at index $index');
//         },
//       ),
//     ),
//   ),
// ),
// body: screens[selectedPage],
