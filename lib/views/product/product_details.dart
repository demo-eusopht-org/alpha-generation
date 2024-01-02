import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noble_vintage/model/category_model.dart';
import 'package:noble_vintage/widgets/default_widget.dart';
import 'package:noble_vintage/widgets/slider.dart';

import '../../utils/constants.dart';
import '../../widgets/icon_text.dart';

class ProductDetails extends StatefulWidget {
  final CategoryItem item;
  const ProductDetails({super.key, required this.item});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  List<Map<String, String>> popularLocations = [
    {'image': 'assets/images/product_banner.png'},
    {'image': 'assets/images/slider1.png'},
    {'image': 'assets/images/slider1.png'},
    {'image': 'assets/images/slider1.png'},
  ];
  int selectedImageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultWidget(
      blueRatio: 0.4,
      bottomBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Estimated',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/images/estimated_box.png',
                      ),
                      Text(
                        '300',
                        style: GoogleFonts.inter(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    'Rating',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/images/rating_box.png',
                      ),
                      Text(
                        '5',
                        style: GoogleFonts.inter(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      child: Column(
        children: [
          topContainer(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      popularLocations[selectedImageIndex]['image'].toString(),
                      height: 250,
                      width: 300,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Sliderproduct(
                      popularLocations: popularLocations,
                      ontap: (index) {
                        selectedImageIndex = index;
                        setState(() {});
                      }),
                  // Slider(),
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Beirutimes - Patek Philippe',
                          ),
                          Text(
                            'Nautilus 7118R',
                          ),
                          Text(
                            'Description:',
                            style: GoogleFonts.inter(
                              fontSize: 26,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'The Patek Philippe Nautilus 7118R: A radiant fusion of rose gold elegance and timeless sophistication. Its diamond-adorned bezel and sunburst brown dial exude luxury, while its precision movement reflects horological mastery at its finest.',
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          // Row(
                          //   mainAxisAlignment:
                          //       MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Column(
                          //       children: [
                          //         Text('Estimated'),
                          //         Image.asset(
                          //           'assets/images/estimated_box.png',
                          //         )
                          //       ],
                          //     ),
                          //     Column(
                          //       children: [
                          //         Text('Rating'),
                          //         Image.asset(
                          //           'assets/images/rating_box.png',
                          //         )
                          //       ],
                          //     ),
                          //   ],
                          // )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListIcon() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconText(
        icon: Icons.arrow_back_ios,
        text: '',
        onTap: () {
          Get.back();
        },
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset('assets/images/back_arrow.png')),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                      child: Text(
                        'PRODUCT DETAILS',
                        style: TextStyle(
                          color: Constants.splashTextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PopularLocationItem extends StatelessWidget {
  final String image;
  PopularLocationItem({
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: (MediaQuery.sizeOf(context).width / 4) - 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
