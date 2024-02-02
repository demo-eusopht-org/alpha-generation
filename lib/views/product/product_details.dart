import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:noble_vintage/utils/constants.dart';
import 'package:noble_vintage/utils/date_time_utils.dart';
import 'package:noble_vintage/views/product/view_selected_file.dart';
import 'package:noble_vintage/widgets/custom_button.dart';
import 'package:noble_vintage/widgets/default_widget.dart';
import 'package:noble_vintage/widgets/enquire_dialog.dart';
import 'package:noble_vintage/widgets/slider.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../controller/product_controller.dart';
import '../../model/product_model/get_products_model.dart';
import '../../widgets/custom_widgets.dart';
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
  final productController = Get.put(ProductController());
  int selectedImageIndex = 0;

  Future<void> getEnquiry() async {
    try {
      productController.buttonLoading.value = true;
      final response = await productController.getUserProductEnquiry(
        productId: widget.items.id!.toInt(),
      );
      if (response.status == 200) {
        EnquireDialog.showConfirmDialog(
          dialogTitle: 'Thanks for showing interest',
          label: 'Ok',
          onConfirm: () => Get.back(),
        );
        customToast(response.message);
        productController.buttonLoading.value = false;
      }
    } on DioException catch (e) {
      productController.buttonLoading.value = false;
      customToast(e.message);
    } catch (e) {
      productController.buttonLoading.value = false;
      customToast(e.toString());
    }
  }

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
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5, top: 8),
                        child: Text(
                          'Selling Price',
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
                        height: Get.height * 0.07,
                        child: Text(
                          'HK\$ ${NumberFormat('#,##0').format(widget.items.estimatedAmount)}',
                          // widget.items.estimatedAmount.toString(),
                          // formatCurrencyPKR(
                          //     widget.items.estimatedAmount!.toDouble()),
                          style: GoogleFonts.inter(
                            fontSize: 14,
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
                  Container(
                      width: Get.width * 0.35,
                      height: Get.height * 0.06,
                      child: Obx(() {
                        return RoundedElevatedButton(
                          loading: productController.buttonLoading.value,
                          onPressed: () {
                            getEnquiry();
                          },
                          text: 'Enquire',
                        );
                      })),
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
                        height: Get.height * 0.07,
                        child: Text(
                          widget.items.rating.toString(),
                          style: GoogleFonts.inter(
                            fontSize: 14,
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
                      InkWell(
                        onTap: () {
                          print('hello - check');
                          Get.to(
                            () => ViewSelectedFile(
                              items: widget.items,
                            ),
                          );
                        },
                        child: CachedNetworkImage(
                          imageUrl:
                              '${Constants.imageUrl}${widget.items.productImages?[selectedImageIndex].fileName}',
                          height: 250,
                          width: Get.width * 0.75,
                          fit: BoxFit.cover,
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
                                        'Brand Name:',
                                        style: GoogleFonts.inter(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        widget.items.title ?? '',
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
                                        'Model Number:',
                                        style: GoogleFonts.inter(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        widget.items.model ?? '',
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
                                        'Purchased Date:',
                                        // '${widget.items.purchaseDate!.getFormattedDate()}',
                                        style: GoogleFonts.inter(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        '${widget.items.purchaseDate!.getFormattedDate()}',
                                        // '${widget.items.purchaseDate!.getFormattedDate()}',
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
                                  if (widget.items.productCertificates !=
                                          null &&
                                      widget.items.productCertificates
                                              ?.isNotEmpty ==
                                          true)
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Download Certificate:',
                                          // '${widget.items.purchaseDate!.getFormattedDate()}',
                                          style: GoogleFonts.inter(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),

                                        InkWell(
                                          onTap: () async {
                                            _downloadFile(context);
                                          },
                                          child: Image.asset(
                                            'assets/images/certificate.png',
                                          ),
                                        ),
                                        // InkWell(
                                        //   onTap: () async {
                                        //     _downloadFile(context);
                                        //   },
                                        //   child: Image.asset(
                                        //     'assets/images/certificate.png',
                                        //   ),
                                        // )
                                      ],
                                    ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // Row(
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     Text(
                                  //       'Status:',
                                  //       style: GoogleFonts.inter(
                                  //         fontSize: 15,
                                  //         fontWeight: FontWeight.w700,
                                  //         color: Colors.black,
                                  //       ),
                                  //     ),
                                  //     widget.items.status == 0
                                  //         ? Text(
                                  //             'Pending From Admin',
                                  //             style: GoogleFonts.inter(
                                  //               fontSize: 15,
                                  //               fontWeight: FontWeight.w400,
                                  //               color: Colors.black,
                                  //             ),
                                  //           )
                                  //         : widget.items.status == 1
                                  //             ? Text(
                                  //                 'Aproved From Admin',
                                  //                 style: GoogleFonts.inter(
                                  //                   fontSize: 15,
                                  //                   fontWeight: FontWeight.w400,
                                  //                   color: Colors.black,
                                  //                 ),
                                  //               )
                                  //             : SizedBox()
                                  //   ],
                                  // ),
                                  // SizedBox(
                                  //   height: 10,
                                  // ),
                                  if (widget.items.description != null &&
                                      widget.items.description != '')
                                    Text(
                                      'Description:',
                                      style: GoogleFonts.inter(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                  Text(
                                    widget.items.description ?? '',
                                    style: GoogleFonts.inter(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
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

  Future<String> _downloadPath() async {
    Directory? appDocumentsDir = await getDownloadsDirectory();
    if (appDocumentsDir != null) {
      String downloadPath = appDocumentsDir.path;
      Directory(downloadPath).createSync(recursive: true);
      return downloadPath;
    } else {
      throw Exception("App documents directory not available");
    }
  }

  void _downloadFile(BuildContext context) async {
    // print('save$savePath');
    try {
      // final status = await Permission.manageExternalStorage.request();
      final media = await Permission.mediaLibrary.request();

      if (media != PermissionStatus.granted) {
        throw Exception('Permission is needed!');
      }
      customToast('File is downloading...');
      final fileName = widget.items.productCertificates!.first.fileName;

      if (fileName == null) {
        throw Exception("File name is needed!");
      }
      String fileUrl = '${Constants.certificateUrl}$fileName';

      final path = Platform.isAndroid
          ? '/storage/emulated/0/Download/Alpha-Generation/images'
          : await _downloadPath();
      String savePath = '${path}/$fileName';
      print('checkPath$fileUrl');
      final response = await Dio().download(fileUrl, savePath);
      // customToast('File downloaded successfully. Path: $savePath');
      if (response.statusCode != 200) {
        throw Exception(response.statusMessage);
      }
      final snackBar = SnackBar(
        content: Text('File downloaded successfully'),
        action: SnackBarAction(
          label: 'Open',
          onPressed: () async {
            try {
              print('New Path:$savePath');
              final result = await OpenFile.open(savePath);
              log('Result: ${result.message}');
            } catch (e) {
              print(e.toString());
            }
          },
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (e) {
      customToast('Failed to download file');
    }
  }
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
