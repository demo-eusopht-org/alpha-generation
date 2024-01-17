import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;
import 'package:image_picker/image_picker.dart';
import 'package:noble_vintage/api/product/product_api.dart';
import 'package:noble_vintage/model/product_model/get_categories_model.dart';
import 'package:noble_vintage/model/product_model/get_products_model.dart'
    hide Data;
import 'package:noble_vintage/services/local_storage_service.dart';
import 'package:noble_vintage/services/locator.dart';
import 'package:noble_vintage/utils/date_time_utils.dart';

import '../api/dio.dart';
import '../model/enums/product_type_enum.dart';
import '../model/product_model/add_product_model.dart';
import '../utils/constants.dart';

class ProductController extends GetxController {
  final _productsApi = ProductApi(
    dio,
    baseUrl: Constants.baseUrl,
  );
  RxBool loading = false.obs;
  RxBool buttonLoading = false.obs;
  RxList<Data> categories = RxList<Data>([]);

  Future<AddProductModel?> addProduct(
    List<XFile> productImages,
    List<PlatformFile> certificates,
    String title,
    String description,
    String serialNumber,
    DateTime purchaseDate,
    double estimatedAmount,
    int rating,
    bool financeWitIt,
    int categoryId,
  ) async {
    final newProductImages = await Future.value(
      [
        for (final productImage in productImages)
          await MultipartFile.fromFile(
            productImage.path,
            filename: '123',
          ),
      ],
    );
    final newProductCertificates = await Future.value(
      [
        for (final productCertificate in certificates)
          await MultipartFile.fromFile(
            productCertificate.path!,
            filename: 'abc',
          ),
      ],
    );
    log('LENGTH: ${newProductCertificates.length} ${newProductImages.length} CAT: $categoryId');
    String? token = await locator<LocalStorageService>().getData('token');
    if (token == null) {
      throw Exception('Unauthorized, Please login');
    }
    final headers = {
      'Authorization': 'Bearer $token',
    };
    final data = FormData.fromMap(
      {
        // 'files': [
        //   ...newProductImages,
        //   ...newProductCertificates,
        // ],
        'product_images': newProductImages,
        'certificates': newProductCertificates,
        'title': title,
        'description': description,
        'serial_number': serialNumber,
        'purchase_date': purchaseDate.getFormattedDate(),
        'estimated_amount': estimatedAmount,
        'rating': rating,
        'finance_with_it': 1,
        'category_id': categoryId,
      },
    );
    final response = await dio.post(
      '${Constants.baseUrl}user/add-product',
      options: Options(
        method: "POST",
        headers: headers,
      ),
      data: data,
    );

    return AddProductModel.fromJson(response.data);
  }

  var selectedProductType = ProductType.all.obs;

  void updateSelectedType(ProductType? newType) {
    selectedProductType.value = newType!;
    update();
  }

  Future<void> getCategories() async {
    loading.value = true;
    final token = await locator<LocalStorageService>().getData('token');
    if (token == null) {
      loading.value = false;
      throw Exception('Unauthorized, please login!');
    }
    final response = await _productsApi.getCategory('Bearer $token');
    categories.value = response.data ?? [];
    loading.value = false;
  }

  Future<GetProductsModel> getProducts() async {
    final token = await locator<LocalStorageService>().getData('token');
    final response = await _productsApi.getProducts('Bearer $token');
    return response;
    print('checkResponse$response');
  }
}
