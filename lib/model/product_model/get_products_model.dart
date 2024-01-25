import 'package:json_annotation/json_annotation.dart';

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
  int? categoryId;
  String? uuid;
  String? title;
  String? description;
  String? serialNumber;
  DateTime? purchaseDate;
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
  final List<ProductImage>? productImages;
  final List<ProductCertificate>? productCertificates;

  Data({
    this.id,
    this.categoryId,
    this.uuid,
    this.title,
    this.description,
    this.serialNumber,
    this.purchaseDate,
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
    this.productImages,
    this.productCertificates,
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
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductImage {
  int? id;
  int? productId;
  String? fileName;
  int? status;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;
  ProductImage({
    this.id,
    this.productId,
    this.fileName,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });
  factory ProductImage.fromJson(Map<String, dynamic> json) =>
      _$ProductImageFromJson(json);

  Map<String, dynamic> toJson() => _$ProductImageToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductCertificate {
  int? id;
  int? productId;
  String? fileName;
  int? status;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;
  ProductCertificate({
    this.id,
    this.productId,
    this.fileName,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });
  factory ProductCertificate.fromJson(Map<String, dynamic> json) =>
      _$ProductCertificateFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCertificateToJson(this);
}
