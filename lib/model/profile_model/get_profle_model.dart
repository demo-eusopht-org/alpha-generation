import 'package:json_annotation/json_annotation.dart';

part 'get_profle_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetProfileModel {
  int? status;
  Datum? data;

  GetProfileModel({
    this.status,
    this.data,
  });

  factory GetProfileModel.fromJson(Map<String, dynamic> json) =>
      _$GetProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetProfileModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Datum {
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? image;
  String? googleId;
  int? roleId;
  int? status;
  String? createdAt;
  String? updatedAt;
  Datum({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.image,
    this.googleId,
    this.roleId,
    this.status,
    this.createdAt,
    this.updatedAt,
  });
  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
