import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noble_vintage/utils/constants.dart';
import 'package:noble_vintage/views/home/home_screen.dart';

import '../views/product/add_product.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  int selectedPage = 0;
  final screens = [
    HomeScreen(),
    AddProduct(),
    Container(),
  ];
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

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
              icon: Icons.home,
              activeIcon: Icon(
                Icons.home,
                color: Colors.black,
                size: 35,
              ),
            ),
            TabItem(
              icon: Icons.camera_alt,
              activeIcon: Icon(
                Icons.camera_alt,
                color: Colors.black,
                size: 35,
              ),
            ),
            TabItem(
              icon: CupertinoIcons.person,
              activeIcon: Icon(
                CupertinoIcons.person,
                color: Colors.black,
                size: 35,
              ),
            ),
          ],
          onTap: (int index) {
            setState(() {
              print('Tapped item at index $index');
              if (index == 1) {
                Get.bottomSheet(
                  Container(
                    color: Colors.black,
                    height: 200,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Get.back();
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
                                    "assets/images/Google.png",
                                  ),
                                  height: 18.0,
                                  width: 24,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 24, right: 8),
                                  child: Text(
                                    'Sign in with Google',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
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
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Get.back();
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
                                    "assets/images/email_image.png",
                                  ),
                                  height: 18.0,
                                  width: 24,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 24, right: 8),
                                  child: Text(
                                    'Get going with Email',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  isDismissible: false,
                );
              } else {
                selectedPage = index;
                print(screens[index]);
              }
            });
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
