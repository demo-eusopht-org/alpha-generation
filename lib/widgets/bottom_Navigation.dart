import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:noble_vintage/utils/constants.dart';
import 'package:noble_vintage/views/auth_view/login_screen.dart';
import 'package:noble_vintage/views/home/home_screen.dart';
import 'package:noble_vintage/views/product/user_product.dart';

import '../services/local_storage_service.dart';
import '../services/locator.dart';
import '../views/product/add_product.dart';
import '../views/settings/profile.dart';
import 'custom_widgets.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  int selectedPage = 0;
  final screens = [
    HomeScreen(),
    AddProduct(),
    UserProduct(),
    Profile(),
  ];

  String _getFirstName(String fullName) {
    if (fullName.isEmpty) {
      return '';
    }

    List<String> nameParts = fullName.split(' ');
    return nameParts.isNotEmpty ? nameParts[0] : '';
  }

  String _getLastName(String fullName) {
    if (fullName.isEmpty) {
      return '';
    }

    List<String> nameParts = fullName.split(' ');
    return nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';
  }

  Future<void> googleLogin(int index) async {
    try {
      await _googleSignIn.signIn();
      final userLogin = await userController.userLoginWithGoogle(
        firstname: _getFirstName(_googleSignIn.currentUser?.displayName ?? ''),
        lastname: _getLastName(_googleSignIn.currentUser?.displayName ?? ''),
        email: _googleSignIn.currentUser?.email ?? '',
        googleId: _googleSignIn.currentUser?.id ?? '',
      );

      if (userLogin.status == 200 && userLogin.token != null) {
        await locator<LocalStorageService>().saveData(
          'token',
          userLogin.token!,
        );
        customToast(userLogin.message);
        Get.back<bool>(
          result: false,
        );
        selectedPage = index;
        _tabController.index = index;
        setState(() {});
      } else {
        throw Exception(userLogin.message ?? 'Invalid email!');
      }
    } on DioException catch (e) {
      customToast(e.response?.data['message'] ?? e.message);
    } catch (e) {
      customToast(e.toString());
    }
  }

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
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
              Icons.shopping_cart,
              color: Colors.white,
            ),
            activeIcon: Icon(
              Icons.shopping_cart,
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
          print('userLogin${_googleSignIn.currentUser?.photoUrl}');
          final token = await locator<LocalStorageService>().getData('token');
          if (index == 1 &&
              _googleSignIn.currentUser == null &&
              token == null) {
            final shouldChange = await Get.bottomSheet<bool>(
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                color: Constants.backgroundContColor,
                height: 130,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: Get.width * 0.72,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Constants.backgroundContColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () async {
                          await googleLogin(1);
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
                                  ' Continue with Google',
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
                    Container(
                      width: Get.width * 0.72,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Constants.backgroundContColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Get.to(() => LoginScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(
                                  "assets/images/email.png",
                                ),
                                height: 18.0,
                                width: 24,
                                color: Colors.black,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10, right: 12),
                                child: Text(
                                  'Continue with Email',
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
                  ],
                ),
              ),
            );

            if (shouldChange ?? true) {
              _tabController.index = selectedPage;
            }
          } else if (index == 2 &&
              _googleSignIn.currentUser == null &&
              token == null) {
            final shouldChange = await Get.bottomSheet<bool>(
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                color: Constants.backgroundContColor,
                height: 130,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: Get.width * 0.72,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Constants.backgroundContColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () async {
                          await googleLogin(2);
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
                    Container(
                      width: Get.width * 0.72,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Constants.backgroundContColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Get.to(() => LoginScreen());
                          // Get.back<bool>(
                          //   result: false,
                          // );
                          // selectedPage = index;
                          // _tabController.index = selectedPage;
                          // setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(
                                  "assets/images/email.png",
                                ),
                                height: 18.0,
                                width: 24,
                                color: Colors.black,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10, right: 12),
                                child: Text(
                                  'Continue with Email',
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
                  ],
                ),
              ),
            );

            if (shouldChange ?? true) {
              _tabController.index = selectedPage;
            }
          } else if (index == 3 &&
              _googleSignIn.currentUser == null &&
              token == null) {
            final shouldChange = await Get.bottomSheet<bool>(
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                color: Constants.backgroundContColor,
                height: 130,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: Get.width * 0.72,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Constants.backgroundContColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () async {
                          await googleLogin(3);
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
                          backgroundColor: Colors.white,
                          foregroundColor: Constants.backgroundContColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Get.to(() => LoginScreen());
                          // Get.back<bool>(
                          //   result: false,
                          // );
                          // selectedPage = index;
                          // _tabController.index = selectedPage;
                          // setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(
                                  "assets/images/email.png",
                                ),
                                height: 18.0,
                                width: 24,
                                color: Colors.black,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10, right: 12),
                                child: Text(
                                  'Continue with Email',
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
                  ],
                ),
              ),
            );

            if (shouldChange ?? true) {
              _tabController.index = selectedPage;
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
