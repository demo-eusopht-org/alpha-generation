import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noble_vintage/utils/constants.dart';
import 'package:noble_vintage/utils/date_time_utils.dart';
import 'package:noble_vintage/widgets/default_widget.dart';
import 'package:noble_vintage/widgets/slider.dart';

import '../../model/product_model/get_products_model.dart';
import '../../widgets/icon_text.dart';

class ProductDetails extends StatefulWidget {
  // final Map<String, dynamic> item;
  final Data items;
  ProductDetails({
    required this.items,
    super.key,
    // required this.item
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int selectedImageIndex = 0;
  @override
  Widget build(BuildContext context) {
    print('CheckIten:${widget.items.title}');
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
                        widget.items.estimatedAmount.toString(),
                        style: GoogleFonts.inter(
                          fontSize: 16,
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
                        widget.items.rating.toString(),
                        style: GoogleFonts.inter(
                          fontSize: 16,
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
                      CachedNetworkImage(
                        imageUrl:
                            '${Constants.imageUrl}${widget.items.productImages?[selectedImageIndex].fileName}',
                        height: 250,
                        width: Get.width * 0.75,
                        fit: BoxFit.fill,
                        errorWidget: (context, url, error) => Image.asset(
                          'assets/images/no_image.png',
                          height: 120,
                          width: Get.width * 0.2,
                        ),
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                            color: Constants.backgroundContColor,
                          ),
                        ),
                      ),
                      // Image.network(
                      //   '${Constants.imageUrl}${widget.items.productImages?[selectedImageIndex].fileName}',
                      //   height: 250,
                      //   width: Get.width * 0.75,
                      //   fit: BoxFit.fill,
                      // ),

                      // Image.asset(
                      //   popularLocations[selectedImageIndex]['image']
                      //       .toString(),
                      //   height: 250,
                      //   width: Get.width * 0.75,
                      //   fit: BoxFit.fill,
                      // ),
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
                              items: widget.items,
                              // popularLocations: popularLocations,
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
                                        widget.items.brand ?? 'unknown',
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
                                        widget.items.model ?? 'unknown',
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
                                        'Purchased Date:${widget.items.purchaseDate!.getFormattedDate()}',
                                        style: GoogleFonts.inter(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Image.asset(
                                        'assets/images/certificate.png',
                                      )
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
                                    widget.items.description ?? '',
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

  // void _downloadFile(BuildContext context) async {
  //   final String fileUrl =
  //       '${Constants.certificateUrl}${widget.items.productCertificates!.first.filename}';
  //   if (await canLaunch(fileUrl)) {
  //     await launch(fileUrl);
  //   } else {
  //     showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: Text('Error'),
  //         content: Text('Unable to launch the file URL.'),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.pop(context),
  //             child: Text('OK'),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  // }
  //
  // void _downloadFile(BuildContext context) async {
  //   customToast('File is downloading...');
  //   var status = await Permission.storage.request();
  //   if (status != PermissionStatus.granted) {
  //     customToast('Permission denied to save the file');
  //     return;
  //   }
  //
  //   String fileUrl =
  //       '${Constants.certificateUrl}${widget.items.productCertificates!.first.filename}';
  //   Directory appDocDir = await getApplicationDocumentsDirectory();
  //   String savePath = appDocDir.path;
  //
  //   try {
  //     await Dio().download(fileUrl, savePath);
  //     customToast('File downloaded successfully. Path: $savePath');
  //   } catch (e) {
  //     customToast('Failed to download file');
  //   }
  // }
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
