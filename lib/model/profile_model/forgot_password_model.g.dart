// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgotPasswordModel _$ForgotPasswordModelFromJson(Map<String, dynamic> json) =>
    ForgotPasswordModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ForgotPasswordModelToJson(
        ForgotPasswordModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
