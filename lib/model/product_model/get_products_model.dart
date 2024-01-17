import 'package:json_annotation/json_annotation.dart';

import '../enums/product_type_enum.dart';

part 'get_products_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetProductsModel {
  int? status;
  List<Data>? data;

  GetProductsModel({
    this.status,
    this.data,
  });

  factory GetProductsModel.fromJson(Map<String, dynamic> json) =>
      _$GetProductsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetProductsModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Data {
  int? id;
  @JsonKey(fromJson: _typeFromJson, toJson: _typeToJson)
  ProductType? categoryId;
  String? uuid;
  String? title;
  String? description;
  String? serialNumber;
  DateTime? purchasedDate;
  double? estimatedAmount;
  String? rating;
  @JsonKey(fromJson: _financeFromJson, toJson: _financeToJson)
  bool? financeWithIt;
  String? brand;
  String? model;
  String? defectStore;
  String? fakeScore;
  String? mlStatus;
  String? adminStatus;
  String? adminComment;
  int? status;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;
  String? categoryName;

  Data({
    this.id,
    this.categoryId,
    this.uuid,
    this.title,
    this.description,
    this.serialNumber,
    this.purchasedDate,
    this.estimatedAmount,
    this.rating,
    this.financeWithIt,
    this.brand,
    this.model,
    this.defectStore,
    this.fakeScore,
    this.mlStatus,
    this.adminStatus,
    this.adminComment,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.categoryName,
  });
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
  static bool? _financeFromJson(int? type) {
    if (type == null) {
      return null;
    }
    return type == 1 ? true : false;
  }

  static Type? _financeToJson(bool? FinanceWithIt) {
    if (bool == false) {
      return null;
    }
    return (bool);
  }

  static ProductType? _typeFromJson(int? type) {
    if (type == null) {
      return null;
    }
    return type == 1 ? ProductType.watches : ProductType.leatherProducts;
  }

  static int? _typeToJson(ProductType? productType) {
    if (productType == null) {
      return null;
    }
    return (productType.index) + 1;
  }
}
