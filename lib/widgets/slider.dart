import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sliderproduct extends StatelessWidget {
  List<Map<String, String>> popularLocations;
  final ValueSetter<int>? ontap;

  Sliderproduct({required this.popularLocations, this.ontap});
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
              itemCount: popularLocations.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: () {
                      if (ontap != null) {
                        ontap!(index);
                      }
                    },
                    child:
                        SliderItem(image: popularLocations[index]['image']!));
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: AssetImage(image), // Replace with your image path
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
