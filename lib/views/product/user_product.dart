import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noble_vintage/utils/constants.dart';
import 'package:noble_vintage/widgets/default_widget.dart';
import 'package:noble_vintage/widgets/listview.dart';

import '../../controller/product_controller.dart';
import '../../model/enums/product_type_enum.dart';
import '../../widgets/icon_text.dart';

class UserProduct extends StatefulWidget {
  const UserProduct({super.key});

  @override
  State<UserProduct> createState() => _UserProductState();
}

class _UserProductState extends State<UserProduct> {
  final productController = Get.put(ProductController());

  ProductType? selectedProductType;

  final searchFocus = FocusNode();

  Future<void> getUserProducts() async {
    final data = await productController.getUserProducts();
    productController.myProducts.value = data.data ?? [];
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getUserProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultWidget(
      showBackIcon: false,
      blueRatio: 0.3,
      child: Column(
        // mainAxisSize: MainAxisSize.max,
        children: [
          topContainer(),
          Expanded(
            child: PopularLocationsList(
              items: productController.myProducts,
              showFilter: false,
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 20,
                  bottom: 20,
                ),
                child: Text(
                  'My Products',
                  style: GoogleFonts.inter(
                    color: Constants.splashTextColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
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
