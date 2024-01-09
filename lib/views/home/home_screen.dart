import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noble_vintage/utils/constants.dart';
import 'package:noble_vintage/views/product/add_product.dart';
import 'package:noble_vintage/widgets/default_widget.dart';
import 'package:noble_vintage/widgets/listview.dart';

import '../../model/enums/product_type_enum.dart';
import '../../widgets/icon_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductType selectedProductType = ProductType.all;
  bool isKeyboardOpen = false;
  final searchFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    searchFocus.addListener(() {
      isKeyboardOpen = searchFocus.hasFocus;
      log('OPEN: $isKeyboardOpen');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultWidget(
      blueRatio: isKeyboardOpen ? 0.5 : 0.3,
      child: Column(
        // mainAxisSize: MainAxisSize.max,
        children: [
          topContainer(),
          Expanded(
            child: PopularLocationsList(),
          ),
        ],
      ),
    );
  }

  Container topContainer() {
    return Container(
      width: double.infinity,
      color: Constants.backgroundContColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          // vertical: 5.0,
          horizontal: 10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 40,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 40.0,
                ),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(
                      0.8,
                    ),
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        Expanded(
                          child: TextField(
                            focusNode: searchFocus,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            PopupMenuButton<ProductType>(
              padding: EdgeInsets.zero,
              icon: Image.asset(
                'assets/images/filter_icon.png',
                height: 50,
                width: 50,
              ),
              onSelected: (newType) {
                selectedProductType = newType;
                setState(() {});
              },
              itemBuilder: (context) {
                return ProductType.values.map((type) {
                  return PopupMenuItem<ProductType>(
                    value: type,
                    child: Row(
                      children: [
                        IgnorePointer(
                          child: Radio<ProductType>(
                            value: type,
                            groupValue: selectedProductType,
                            onChanged: (newType) {},
                          ),
                        ),
                        Text(type.getLabel()),
                      ],
                    ),
                  );
                }).toList();
              },
            )
            // Icon(Icons.add)
            // InkWell(
            //   onTap: (){},
            //   child: Image.asset(
            //     'assets/images/filter_icon.png',
            //     height: 50,
            //     width: 50,
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  Widget buildUploadIcon() {
    return IconText(
      text: '',
      icon: Icons.camera_alt,
      onTap: () {
        Get.to(
          () => AddProduct(),
        );
        log('Camera tapped!');
      },
    );
  }

  Widget buildListIcon() {
    return IconText(
      icon: Icons.menu,
      text: '',
      onTap: () {
        // Get.to(
        //   CategoryList(),
        // );
        // showMenu<int>(
        //   context: context,
        //   position: RelativeRect.fromLTRB(0, 0, 100, 0),
        //   items: [
        //     PopupMenuItem(
        //       value: 1,
        //       child: InkWell(
        //         onTap: () {
        //           showDialog(
        //             context: context,
        //             builder: (BuildContext context) {
        //               return AlertDialog(
        //                 title: Text('Logout'),
        //                 content: Text('Are you sure you want to log out?'),
        //                 actions: [
        //                   TextButton(
        //                     onPressed: () {
        //                       Get.to(LoginScreen());
        //                     },
        //                     child: Text('Logout'),
        //                   ),
        //                   TextButton(
        //                     onPressed: () {
        //                       Navigator.pop(context);
        //                     },
        //                     child: Text('Cancel'),
        //                   ),
        //                 ],
        //               );
        //             },
        //           );
        //         },
        //         child: Row(
        //           children: [
        //             Icon(Icons.logout),
        //             SizedBox(width: 10),
        //             Text("Logout")
        //           ],
        //         ),
        //       ),
        //     ),
        //   ],
        //   elevation: 2,
        // );
      },
    );
  }
}
