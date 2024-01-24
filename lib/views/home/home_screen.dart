import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noble_vintage/utils/constants.dart';
import 'package:noble_vintage/widgets/default_widget.dart';
import 'package:noble_vintage/widgets/listview.dart';

import '../../controller/product_controller.dart';
import '../../model/enums/product_type_enum.dart';
import '../../model/product_model/get_products_model.dart';
import '../../widgets/icon_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final productController = Get.put(ProductController());

  ProductType? selectedProductType;
  List<Data> productList = [];
  TextEditingController _searchController = TextEditingController();
  // ProductType selectedProductType = ProductType.all;
  bool isKeyboardOpen = false;

  final searchFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      productController.loading.value = true;
      await productController.getCategories();
      await productController.getProducts();
      productController.loading.value = false;
    });
    searchFocus.addListener(() {
      isKeyboardOpen = searchFocus.hasFocus;
      log('OPEN: $isKeyboardOpen');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultWidget(
      showBackIcon: false,
      blueRatio: isKeyboardOpen ? 0.5 : 0.3,
      child: Column(
        // mainAxisSize: MainAxisSize.max,
        children: [
          topContainer(),
          Expanded(
            child: PopularLocationsList(
              items: productController.searchProducts,
              showFilter: true,
              onReloadPressed: () async {
                productController.loading.value = true;
                // await getCategories();
                await productController.getProducts();
                productController.loading.value = false;
              },
            ),
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
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 20,
                  bottom: 20,
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
                            controller: _searchController,
                            focusNode: searchFocus,
                            onChanged: (string) {
                              if (string.isEmpty) {
                                productController.searchProducts.value = [];
                              }
                              final products = productController.products;
                              productController.searchProducts.value =
                                  products.value?.data?.where(
                                        (i) {
                                          return i.title!
                                              .toLowerCase()
                                              .contains(
                                                string.toLowerCase(),
                                              );
                                        },
                                      ).toList() ??
                                      [];
                            },
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
            Obx(() {
              if (productController.categories.isEmpty) {
                return SizedBox.shrink();
              }
              return PopupMenuButton<ProductType?>(
                padding: EdgeInsets.zero,
                icon: Image.asset(
                  'assets/images/filter_icon.png',
                  height: 50,
                  width: 50,
                  color: Colors.white,
                ),
                onSelected: (newType) {
                  productController.updateSelectedType(newType);
                  // selectedProductType = newType!;
                  setState(() {});
                },
                itemBuilder: (context) {
                  return [
                    ...productController.categories.map((category) {
                      return _buildFilterItem(type: category.id);
                    }).toList(),
                    _buildFilterItem(
                      type: ProductType.all,
                    ),
                  ];
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  PopupMenuItem<ProductType> _buildFilterItem({
    required ProductType? type,
  }) {
    return PopupMenuItem<ProductType>(
      value: type,
      child: Row(
        children: [
          IgnorePointer(
            child: Radio<ProductType?>(
              focusColor: Constants.backgroundContColor,
              activeColor: Constants.backgroundContColor,
              value: type,
              groupValue: productController.selectedProductType.value,
              onChanged: (newType) {
                productController.updateSelectedType(newType);
                // selectedProductType = newType;
                // TODO: Do this using Getx;
                setState(() {});
              },
            ),
          ),
          Text(
            type?.getLabel() ?? '',
            style: GoogleFonts.inter(),
          ),
        ],
      ),
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
