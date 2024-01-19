// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePasswordModel _$UpdatePasswordModelFromJson(Map<String, dynamic> json) =>
    UpdatePasswordModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$UpdatePasswordModelToJson(
        UpdatePasswordModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
