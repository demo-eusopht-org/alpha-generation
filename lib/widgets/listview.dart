import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noble_vintage/views/category/category.dart';

class PopularLocationsList extends StatelessWidget {
  final List<Map<String, String>> popularLocations = [
    {
      'name': '300',
      "title": 'Rolex',
      'image': 'assets/images/Rolex_watch.png',
      // 'description':
      //     'Exuding timeless elegance, this precision-crafted watch embodies artful refinement for style-conscious individuals valuing substance.'
    },
    {'name': '300', "title": 'Rolex', 'image': 'assets/images/Rolex_watch.png'},
    {'name': '35', "title": 'Rolex', 'image': 'assets/images/tshirt.png'},
    {'name': '30', "title": 'Polo', 'image': 'assets/images/polotshirt.png'},
    {'name': '100', "title": 'Guccie', 'image': 'assets/images/Guccie.png'},
    {'name': '100', "title": 'Guccie', 'image': 'assets/images/Guccie.png'},
    {'name': '300', "title": 'Rolex', 'image': 'assets/images/Rolex_watch.png'},
    {'name': '300', "title": 'Rolex', 'image': 'assets/images/Rolex_watch.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: GridView.builder(
            itemCount: popularLocations.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            itemBuilder: (context, index) {
              return PopularLocationItem(
                onTap: () {
                  Get.to(() => CategoryList(
                        showBackArrow: true,
                      ));
                },
                name: popularLocations[index]['name']!,
                title: popularLocations[index]['title']!,
                image: popularLocations[index]['image']!,
              );
            },
          ),
        ),
      ],
    );
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

class PopularLocationItem extends StatelessWidget {
  final String image;
  final String name;
  final String title;
  final VoidCallback onTap;
  PopularLocationItem(
      {required this.image,
      required this.name,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // width: (MediaQuery.sizeOf(context).width / 4) - 15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.heptaSlab(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
