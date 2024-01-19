import 'package:json_annotation/json_annotation.dart';

part 'update_password_model.g.dart';

@JsonSerializable()
class UpdatePasswordModel {
  int? status;
  String? message;
  UpdatePasswordModel({
    this.status,
    this.message,
  });
  factory UpdatePasswordModel.fromJson(Map<String, dynamic> json) =>
      _$UpdatePasswordModelFromJson(json);
  Map<String, dynamic> toJson() => _$UpdatePasswordModelToJson(this);
}
