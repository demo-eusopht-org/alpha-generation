import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  int? status;
  String? message;
  String? token;
  String? role;
  LoginModel({this.status, this.message, this.token});
  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class User {
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

  User(
      {this.id,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.image,
      this.googleId,
      this.roleId,
      this.status,
      this.createdAt,
      this.updatedAt});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
