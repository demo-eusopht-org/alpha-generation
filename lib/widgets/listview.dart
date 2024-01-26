import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noble_vintage/model/product_model/get_products_model.dart';
import 'package:noble_vintage/utils/constants.dart';
import 'package:noble_vintage/widgets/custom_button.dart';

import '../controller/product_controller.dart';
import '../views/product/product_details.dart';

class PopularLocationsList extends StatefulWidget {
  final List<Data> items;
  final bool showFilter;
  final VoidCallback onReloadPressed;
  PopularLocationsList({
    required this.items,
    required this.showFilter,
    required this.onReloadPressed,
  });
  @override
  State<PopularLocationsList> createState() => _PopularLocationsListState();
}

class _PopularLocationsListState extends State<PopularLocationsList> {
  final productController = Get.put(ProductController());

  // GetProductsModel? getProductsModel;

  // Future<void> getProducts() async {
  //   getProductsModel = await productController.getProducts();
  //   setState(() {});
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     getProducts();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final filter = _getFilteredProducts();
      print(filter.length);

      if (productController.loading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Constants.backgroundContColor,
          ),
        );
      } else if (productController.errorMessage.value != null) {
        return _buildErrorView(productController.errorMessage.value!);
      } else {
        if (filter.isEmpty) {
          return Center(
            child: Text('No Products are Available'),
          );
        } else {
          return GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.6,
            children: List.generate(filter.length, (index) {
              final items = filter[index];
              return PopularLocationItem(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetails(
                        items: items,
                      ),
                    ),
                  );
                },
                title: items.title!,
                name: items.categoryName ?? '',
                price: items.estimatedAmount!,
                description: items.description!,
                image:
                    '${Constants.imageUrl}${items.productImages?.first.fileName}',
              );
            }),
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          );
        }
      }
    });
  }

  Widget _buildErrorView(String message) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: Get.width * 0.4,
          child: RoundedElevatedButton(
            onPressed: () {
              widget.onReloadPressed();
            },
            text: 'Reload',
          ),
        ),
      ],
    );
  }

  List<Data> _getFilteredProducts() {
    List<Data> products = widget.items;
    log('LENGTH: ${products.length}');
    if (widget.showFilter) {
      return productController.selectedProductType.value?.name == 'All'
          ? products
          : products.where((product) {
              return product.categoryId ==
                  productController.selectedProductType.value?.id;
            }).toList();
    } else {
      return products;
    }
  }
}

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
              CachedNetworkImage(
                imageUrl: widget.image,
                fit: BoxFit.cover,
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
              // Image.network(
              //   widget.image,
              //   fit: BoxFit.fill,
              //   height: 160,
              //   width: 190,
              // ),
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
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
