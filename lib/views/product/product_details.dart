import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noble_vintage/widgets/default_widget.dart';
import 'package:noble_vintage/widgets/slider.dart';

import '../../utils/constants.dart';
import '../../widgets/icon_text.dart';

class ProductDetails extends StatefulWidget {
  final Map<String, dynamic> item;
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
      blueRatio: 0.3,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Estimated',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Colors.black,
                      ),
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      'Rating',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Colors.black,
                      ),
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
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        child: Column(
          children: [
            topContainer(),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container(
                      //   width: Get.width * 0.01,
                      // ),
                      // Spacer(),
                      Image.asset(
                        popularLocations[selectedImageIndex]['image']
                            .toString(),
                        height: 250,
                        width: Get.width * 0.75,
                        fit: BoxFit.fill,
                      ),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(
                      //     horizontal: 2.5,
                      //   ),
                      //   // child: Column(
                      //   //   children: [
                      //   //     SizedBox(
                      //   //       height: 30,
                      //   //     ),
                      //   //     Image.asset('assets/images/search_icon.png'),
                      //   //     SizedBox(
                      //   //       height: 10,
                      //   //     ),
                      //   //     Image.asset('assets/images/fav_icon.png'),
                      //   //     Text(
                      //   //       '65',
                      //   //       style: GoogleFonts.dmSans(
                      //   //         fontWeight: FontWeight.w400,
                      //   //         fontSize: 17,
                      //   //         color: Colors.white,
                      //   //       ),
                      //   //     ),
                      //   //   ],
                      //   // ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Sliderproduct(
                              popularLocations: popularLocations,
                              ontap: (index) {
                                selectedImageIndex = index;
                                setState(() {});
                              }),
                          // Slider(),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 12, right: 12, top: 10),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Beirutimes - Patek Philippe',
                                    style: GoogleFonts.inter(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'Nautilus 7118R',
                                    style: GoogleFonts.inter(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black,
                                    ),
                                  ),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Purchase Date:1/2/24 ',
                                        style: GoogleFonts.inter(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Image.asset(
                                        'assets/images/certificate.png',
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
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
                                      fontSize: 17,
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
                  )
                ],
              ),
            ),
          ],
        ),
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
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(
                      'assets/images/back_arrow.png',
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10.0,
                    ),
                    child: Container(
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(top: 10, left: 20, right: 30),
                      child: Text(
                        'Product Details',
                        style: GoogleFonts.inter(
                          color: Constants.splashTextColor,
                          fontSize: 30,
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
