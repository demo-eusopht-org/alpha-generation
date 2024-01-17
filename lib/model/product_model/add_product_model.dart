import 'package:json_annotation/json_annotation.dart';

part 'add_product_model.g.dart';

@JsonSerializable()
class AddProductModel {
  int? status;
  String? message;
  AddProductModel({
    this.status,
    this.message,
  });
  factory AddProductModel.fromJson(Map<String, dynamic> json) =>
      _$AddProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddProductModelToJson(this);
}
