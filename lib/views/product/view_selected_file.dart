import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../../model/product_model/get_products_model.dart';
import '../../utils/constants.dart';
import '../../widgets/slider.dart';

class ViewSelectedFile extends StatefulWidget {
  final Data items;
  const ViewSelectedFile({Key? key, required this.items}) : super(key: key);

  @override
  State<ViewSelectedFile> createState() => _ViewSelectedFileState();
}

class _ViewSelectedFileState extends State<ViewSelectedFile> {
  int selectedImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PhotoView(
                imageProvider: CachedNetworkImageProvider(
                  '${Constants.imageUrl}${widget.items.productImages![selectedImageIndex].fileName}',
                ),
                minScale: PhotoViewComputedScale.contained * 0.8,
                maxScale: PhotoViewComputedScale.covered * 2,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Sliderproduct(
                items: widget.items,
                ontap: (index) {
                  selectedImageIndex = index;
                  setState(() {});
                }),
          ],
        ),
      ),
    );
  }
}
