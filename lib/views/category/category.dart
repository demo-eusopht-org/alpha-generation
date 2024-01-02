import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:noble_vintage/model/category_model.dart';
import 'package:noble_vintage/views/product/add_product.dart';
import 'package:noble_vintage/views/product/product_details.dart';
import 'package:noble_vintage/widgets/custom_widgets.dart';

import '../../utils/constants.dart';
import '../../widgets/icon_text.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  String selectedType = 'All';
  @override
  Widget build(BuildContext context) {
    double ratingStar = 0;

    return Scaffold(
      body: Column(
        children: [
          topContainer(),
          Container(
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Constants.backgroundContColor,
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
                  0.5,
                  0.5,
                ],
                tileMode: TileMode.decal,
              ),
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                customButton('All'),
                customButton('Shirts'),
                customButton('Bags'),
                customButton('Watches'),
                customButton('Jewellery'),
                customButton('Dresses'),
              ],
            ),
          ),
          Expanded(
            flex: 7,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ListView.builder(
                  itemCount: ItemList.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = ItemList.items[index];
                    final sno = (index + 1).toString();
                    return InkWell(
                      onTap: () {
                        Get.to(() => ProductDetails(item: item));
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  sno,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  item.imageName,
                                  width: 120,
                                  // height: 120,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textWidget(
                                      text: item.name,
                                      color: Colors.black,
                                      fWeight: FontWeight.w700,
                                      fSize: 28.0,
                                    ),
                                    textWidget(
                                      text: '${item.price}',
                                      color: Colors.black,
                                      fWeight: FontWeight.w500,
                                      fSize: 21.0,
                                    ),
                                    RatingBar.builder(
                                      itemSize: 25,
                                      initialRating: ratingStar,
                                      minRating: 0,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 0.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        setState(() {
                                          ratingStar = rating;
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customButton(title) {
    return InkWell(
      onTap: () {
        selectedType = title;
        setState(() {});
      },
      child: Container(
        width: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selectedType == title
              ? Constants.backgroundContColor
              : Colors.white,
          borderRadius: BorderRadius.circular(
            30,
          ),
          boxShadow: kElevationToShadow[2],
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 2.5,
          vertical: 2.5,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: selectedType == title
                ? Colors.white
                : Constants.backgroundContColor,
          ),
        ),
      ),
    );
  }

  Container topContainer() {
    return Container(
      width: double.infinity,
      color: Constants.backgroundContColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    'assets/images/back_arrow.png',
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Icon(Icons.search, color: Colors.grey),
                            SizedBox(width: 4.0),
                            Expanded(
                              child: TextField(
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
                buildUploadIcon(),
              ],
            ),
            Text(
              'Searching Sorting',
              style: TextStyle(
                color: Constants.splashTextColor,
                fontSize: 21,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildUploadIcon() {
    return IconText(
      text: 'Upload',
      icon: Icons.camera_alt,
      onTap: () {
        Get.to(() => AddProduct());
      },
    );
  }

  Widget buildListIcon() {
    return IconText(
      icon: Icons.arrow_back_ios,
      text: '',
      onTap: () {},
    );
  }
}
