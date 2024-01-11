import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noble_vintage/utils/constants.dart';
import 'package:noble_vintage/widgets/default_widget.dart';
import 'package:noble_vintage/widgets/slider.dart';

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
      showBackIcon: true,
      heading: 'Product Details',
      blueRatio: 0.3,
      bottomBar: ColoredBox(
        color: Colors.white,
        child: Column(
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
                      padding: const EdgeInsets.only(left: 5, top: 8),
                      child: Text(
                        'Estimated',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Constants.backgroundContColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          // topLeft: Radius.circular(5),
                        ),
                      ),
                      alignment: Alignment.center,
                      width: Get.width * 0.27,
                      height: Get.height * 0.08,
                      child: Text(
                        '300',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // Stack(
                    //   alignment: Alignment.center,
                    //   children: [
                    //     Image.asset(
                    //       'assets/images/estimated_box.png',
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.only(right: 10),
                    //       child: Text(
                    //         '300',
                    //         style: GoogleFonts.inter(
                    //           fontSize: 25,
                    //           fontWeight: FontWeight.w500,
                    //           color: Colors.white,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 5),
                      child: Text(
                        'Rating',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Constants.backgroundContColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          // topLeft: Radius.circular(5),
                        ),
                      ),
                      alignment: Alignment.center,
                      width: Get.width * 0.27,
                      height: Get.height * 0.08,
                      child: Text(
                        '5',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // Stack(
                    //   alignment: Alignment.center,
                    //   children: [
                    //     Image.asset(
                    //       'assets/images/new_estimated_box.png',
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.only(left: 12),
                    //       child: Text(
                    //         '5',
                    //         style: GoogleFonts.inter(
                    //           fontSize: 25,
                    //           fontWeight: FontWeight.w500,
                    //           color: Colors.white,
                    //         ),
                    //       ),
                    //     )
                    //   ],
                    // ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Brand Name',
                                        style: GoogleFonts.inter(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Rolex',
                                        style: GoogleFonts.inter(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Model Number',
                                        style: GoogleFonts.inter(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'A-1234',
                                        style: GoogleFonts.inter(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Purchase Date:1/2/24 ',
                                        style: GoogleFonts.inter(
                                          fontSize: 15,
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

  // Widget topContainer() {
  //   return Container(
  //     width: double.infinity,
  //     color: Constants.backgroundContColor,
  //     padding: const EdgeInsets.symmetric(horizontal: 15.0),
  //     alignment: Alignment.topCenter,
  //     margin: EdgeInsets.only(left: 20, right: 20),
  //     child:
  //   );
  // }
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
