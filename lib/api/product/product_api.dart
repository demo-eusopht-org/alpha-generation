import 'package:dio/dio.dart';
import 'package:noble_vintage/model/product_model/get_brands_model.dart';
import 'package:noble_vintage/model/product_model/get_categories_model.dart';
import 'package:noble_vintage/model/product_model/product_enquiry_model.dart';
import 'package:retrofit/http.dart';

import '../../model/product_model/get_products_model.dart';
import '../../utils/constants.dart';

part 'product_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class ProductApi {
  factory ProductApi(Dio dio, {String baseUrl}) = _ProductApi;

  @GET("user/get-categories")
  Future<GetCategoriesModel> getCategory();

  @GET("user/get-brands")
  Future<GetBrandsModel> getBrands();

  @GET("user/get-all-products")
  Future<GetProductsModel> getProducts();

  @GET("user/get-user-products")
  Future<GetProductsModel> getUserProducts(
      @Header('Authorization') String token);

  @POST("user/add-enquiry")
  Future<ProductEnquiryModel> productEnquiry(
      @Header('Authorization') String token, @Body() Map<String, dynamic> body);
}
