// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCategoriesModel _$GetCategoriesModelFromJson(Map<String, dynamic> json) =>
    GetCategoriesModel(
      status: json['status'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCategoriesModelToJson(GetCategoriesModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: Data._typeFromJson(json['id'] as int?),
      name: json['name'] as String?,
      status: json['status'] as int?,
      createdBy: json['created_by'] as int?,
      updatedBy: json['updated_by'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': Data._typeToJson(instance.id),
      'name': instance.name,
      'status': instance.status,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
