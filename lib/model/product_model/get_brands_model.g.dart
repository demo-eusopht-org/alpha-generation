// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_brands_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBrandsModel _$GetBrandsModelFromJson(Map<String, dynamic> json) =>
    GetBrandsModel(
      status: json['status'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BrandData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetBrandsModelToJson(GetBrandsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

BrandData _$BrandDataFromJson(Map<String, dynamic> json) => BrandData(
      id: json['id'] as int?,
      name: json['name'] as String?,
      status: json['status'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$BrandDataToJson(BrandData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
