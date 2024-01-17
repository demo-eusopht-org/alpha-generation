import 'package:dio/dio.dart';
import 'package:noble_vintage/model/product_model/get_categories_model.dart';
import 'package:retrofit/http.dart';

import '../../model/product_model/get_products_model.dart';
import '../../utils/constants.dart';

part 'product_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class ProductApi {
  factory ProductApi(Dio dio, {String baseUrl}) = _ProductApi;

  @GET("user/get-categories")
  Future<GetCategoriesModel> getCategory(@Header('Authorization') String token);

  @GET("user/get-products")
  Future<GetProductsModel> getProducts(@Header('Authorization') String token);
}
