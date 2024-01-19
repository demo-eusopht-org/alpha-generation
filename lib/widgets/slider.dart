import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noble_vintage/utils/constants.dart';

import '../model/product_model/get_products_model.dart';

class Sliderproduct extends StatelessWidget {
  // List<Map<String, String>>? popularLocations;
  final Data items;
  final ValueSetter<int>? ontap;

  Sliderproduct({this.ontap, required this.items});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constants) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: constants.maxWidth < 800 ? 120 : 200,
            width: Get.width,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              scrollDirection: Axis.horizontal,
              itemCount: items.productImages!.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    if (ontap != null) {
                      ontap!(index);
                    }
                  },
                  child: SliderItem(
                    image:
                        '${Constants.imageUrl}${items.productImages![index].fileName}',
                  ),
                  // child: SliderItem(image: popularLocations![index]['image']!),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 12.0);
              },
            ),
          ),
        ],
      );
    });
  }
}

class SliderItem extends StatelessWidget {
  final String image;

  SliderItem({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.35,
      child: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.fill,
        height: 160,
        width: 160,
        errorWidget: (context, url, error) =>
            Image.asset('assets/images/no_image.png'),
        placeholder: (context, url) => Center(
          child: CircularProgressIndicator(
            color: Constants.backgroundContColor,
          ),
        ),
      ),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10.0),
      //   image: DecorationImage(
      //     image: NetworkImage(image),
      //     fit: BoxFit.cover,
      //   ),
      // ),
    );
  }
}
