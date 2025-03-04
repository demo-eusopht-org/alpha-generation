import 'package:json_annotation/json_annotation.dart';

part 'get_categories_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetCategoriesModel {
  int? status;
  List<Data>? data;

  GetCategoriesModel({
    this.status,
    this.data,
  });

  factory GetCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$GetCategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetCategoriesModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Data {
  int? id;
  String? name;
  int? status;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;
  Data({
    this.id,
    this.name,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
