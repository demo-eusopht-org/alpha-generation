import 'package:json_annotation/json_annotation.dart';

part 'get_brands_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetBrandsModel {
  int? status;
  List<BrandData>? data;

  GetBrandsModel({
    this.status,
    this.data,
  });

  factory GetBrandsModel.fromJson(Map<String, dynamic> json) =>
      _$GetBrandsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetBrandsModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BrandData {
  int? id;
  String? name;
  int? status;
  String? createdAt;
  String? updatedAt;
  BrandData({
    this.id,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory BrandData.fromJson(Map<String, dynamic> json) =>
      _$BrandDataFromJson(json);

  Map<String, dynamic> toJson() => _$BrandDataToJson(this);
}
