import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:noble_vintage/utils/constants.dart';
import 'package:noble_vintage/views/home/home_screen.dart';

import '../views/category/category.dart';
import '../views/product/add_product.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedPage = 0;
  final screens = [
    HomeScreen(),
    CategoryList(),
    AddProduct(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ConvexAppBar(
          top: -20,
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
              icon: Icons.shopping_cart,
              activeIcon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
                size: 35,
              ),
            ),
            TabItem(
              icon: Icons.manage_accounts,
              activeIcon: Icon(
                Icons.manage_accounts,
                color: Colors.black,
                size: 35,
              ),
            ),
          ],
          onTap: (int index) {
            setState(() {
              selectedPage = index;
              print(screens[index]);
            });
            print('Tapped item at index $index');
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
