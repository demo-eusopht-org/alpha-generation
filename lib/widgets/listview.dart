import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../views/product/product_details.dart';

class PopularLocationsList extends StatelessWidget {
  final List<Map<String, String>> popularLocations = [
    {
      'name': '100',
      "title": 'Horizon Glimmer',
      'image': 'assets/images/Rolex_watch.png',
      'description':
          'Exuding timeless elegance, this precision-crafted watch embodies artful refinement for style-conscious individuals valuing substance.'
    },
    {
      'name': '110',
      "title": 'Nebula Essence',
      'image': 'assets/images/Rectangle 7.png',
      'description':
          "Infused with an eternal charm, this meticulously crafted timepiece personifies refined sophistication, tailored for discerning individual."
    },
    {
      'name': '100',
      "title": 'Horizon Glimmer',
      'image': 'assets/images/Rolex_watch.png',
      'description':
          "Infused with an eternal charm, this meticulously crafted timepiece personifies refined sophistication, tailored for discerning individual."
    },
    {
      'name': '110',
      "title": 'Nebula Essence',
      'image': 'assets/images/Rectangle 7.png',
      'description':
          'Exuding timeless elegance, this precision-crafted watch embodies artful refinement for style-conscious individuals valuing substance.'
    },
    {
      'name': '110',
      "title": 'Horizon Glimmer',
      'image': 'assets/images/Rolex_watch.png',
      'description':
          "Infused with an eternal charm, this meticulously crafted timepiece personifies refined sophistication, tailored for discerning individual."
    },
    {
      'name': '100',
      "title": 'Nebula Essence',
      'image': 'assets/images/Rectangle 7.png',
      'description':
          'Exuding timeless elegance, this precision-crafted watch embodies artful refinement for style-conscious individuals valuing substance.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(

      crossAxisCount: 2,
      shrinkWrap: true,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      itemCount: popularLocations.length,
      itemBuilder: (BuildContext context, int index) {
        final item = popularLocations[index];
        return PopularLocationItem(
          // onTap: () {
          //   Get.to(() => ProductDetails(item: item));
          // },
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetails(item: item),
              ),
            );
          },
          name: popularLocations[index]['name']!,
          title: popularLocations[index]['title']!,
          image: popularLocations[index]['image']!,
          description: popularLocations[index]['description'] ?? '',
        );
      },
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
    );

    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   mainAxisSize: MainAxisSize.min,
    //   children: [
    //     Expanded(
    //       child: GridView.builder(
    //         itemCount: popularLocations.length,
    //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //           crossAxisCount: 2,
    //           crossAxisSpacing: 10,
    //           mainAxisSpacing: 10,
    //         ),
    //         padding: EdgeInsets.only(
    //           left: 10,
    //           right: 10,
    //         ),
    //         itemBuilder: (context, index) {
    //           return PopularLocationItem(
    //             onTap: () {
    //               Get.to(() => CategoryList(
    //                     showBackArrow: true,
    //                   ));
    //             },
    //             name: popularLocations[index]['name']!,
    //             title: popularLocations[index]['title']!,
    //             image: popularLocations[index]['image']!,
    //           );
    //         },
    //       ),
    //     ),
    //   ],
    // );
  }
}

//   Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Expanded(
//       child: GridView.builder(
//         itemCount: popularLocations.length,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           childAspectRatio: 1.6,
//           crossAxisCount: 2,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//         ),
//         padding: EdgeInsets.only(
//           left: 10,
//           right: 10,
//         ),
//         itemBuilder: (context, index) {
//           return PopularLocationItem(
//             onTap: () {
//               Get.to(() => CategoryList(
//                     showBackArrow: true,
//                   ));
//             },
//             name: popularLocations[index]['name']!,
//             title: popularLocations[index]['title']!,
//             image: popularLocations[index]['image']!,
//             description: popularLocations[index]['description']!,
//           );
//         },
//       ),
//     ),
//   ],
// );
//   }
// }

class PopularLocationItem extends StatefulWidget {
  final String image;
  final String name;
  final String title;
  final String description;
  final VoidCallback onTap;
  PopularLocationItem({
    required this.image,
    required this.name,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  State<PopularLocationItem> createState() => _PopularLocationItemState();
}

class _PopularLocationItemState extends State<PopularLocationItem> {
  @override
  Widget build(BuildContext context) {
    double ratingStar = 0;
    return InkWell(
      onTap: widget.onTap,
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
          padding: EdgeInsets.zero,
          // clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                widget.image,
                fit: BoxFit.fill,
                height: 160,
                width: 190,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.title,
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.description,
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: RatingBar.builder(
                        itemSize: 15,
                        initialRating: ratingStar,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          setState(() {
                            ratingStar = rating;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
