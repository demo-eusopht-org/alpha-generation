import 'package:json_annotation/json_annotation.dart';

part 'product_enquiry_model.g.dart';

@JsonSerializable()
class ProductEnquiryModel {
  int? status;
  String? message;
  ProductEnquiryModel({
    this.status,
    this.message,
  });
  factory ProductEnquiryModel.fromJson(Map<String, dynamic> json) =>
      _$ProductEnquiryModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductEnquiryModelToJson(this);
}
