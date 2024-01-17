import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noble_vintage/model/enums/product_type_enum.dart';
import 'package:noble_vintage/model/product_model/get_products_model.dart';

import '../controller/product_controller.dart';
import '../views/product/product_details.dart';

class PopularLocationsList extends StatefulWidget {
  @override
  State<PopularLocationsList> createState() => _PopularLocationsListState();
}

class _PopularLocationsListState extends State<PopularLocationsList> {
  final productController = Get.put(ProductController());

  GetProductsModel? getProductsModel;

  Future<void> getProducts() async {
    getProductsModel = await productController.getProducts();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    if (getProductsModel?.data?.isEmpty ?? true) {
      return productController.loading.value
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Text('No Products are Available'),
            );
    }
    final filter = productController.selectedProductType.value !=
            ProductType.all
        ? getProductsModel!.data!
            .where(
              (i) =>
                  i.categoryId == productController.selectedProductType.value,
            )
            .toList()
        : getProductsModel!.data;
    print(filter!.length);
    return MasonryGridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      itemCount: filter.length,
      itemBuilder: (BuildContext context, int index) {
        final items = filter[index];
        return PopularLocationItem(
          // onTap: () {
          //   Get.to(() => ProductDetails(item: item));
          // },
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetails(),
              ),
            );
          },
          title: items.title!,
          name: items.categoryName ?? '',
          price: items.estimatedAmount!,
          // image: popularLocations[index]['image']!,
          description: items.description!,
          image: 'assets/images/Rolex_watch.png',
          // description: popularLocations[index]['description'] ?? '',
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
  final double price;
  final String description;
  final VoidCallback onTap;
  PopularLocationItem({
    required this.image,
    required this.name,
    required this.title,
    required this.description,
    required this.price,
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
                      widget.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
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
                      widget.price.toString(),
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 5,
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
