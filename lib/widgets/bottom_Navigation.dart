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
  final screens = [HomeScreen(), CategoryList(), AddProduct()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Constants.backgroundContColor,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.manage_accounts), label: ''),
        ],
        currentIndex: selectedPage,
        onTap: (int index) {
          setState(() {
            selectedPage = index;
            print(screens[index]);
          });
          print('Tapped item at index $index');
        },
      ),
      body: screens[selectedPage],
    );
  }
}
