// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProductsModel _$GetProductsModelFromJson(Map<String, dynamic> json) =>
    GetProductsModel(
      status: json['status'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetProductsModelToJson(GetProductsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int?,
      categoryId: Data._typeFromJson(json['category_id'] as int?),
      uuid: json['uuid'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      serialNumber: json['serial_number'] as String?,
      purchaseDate: json['purchase_date'] == null
          ? null
          : DateTime.parse(json['purchase_date'] as String),
      estimatedAmount: (json['estimated_amount'] as num?)?.toDouble(),
      rating: json['rating'] as String?,
      financeWithIt: Data._financeFromJson(json['finance_with_it'] as int?),
      brand: json['brand'] as String?,
      model: json['model'] as String?,
      defectStore: json['defect_store'] as String?,
      fakeScore: json['fake_score'] as String?,
      mlStatus: json['ml_status'] as String?,
      adminStatus: json['admin_status'] as String?,
      adminComment: json['admin_comment'] as String?,
      status: json['status'] as int?,
      createdBy: json['created_by'] as int?,
      updatedBy: json['updated_by'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      categoryName: json['category_name'] as String?,
      productImages: (json['product_images'] as List<dynamic>?)
          ?.map((e) => ProductImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      productCertificates: (json['product_certificates'] as List<dynamic>?)
          ?.map((e) => ProductCertificate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'category_id': Data._typeToJson(instance.categoryId),
      'uuid': instance.uuid,
      'title': instance.title,
      'description': instance.description,
      'serial_number': instance.serialNumber,
      'purchase_date': instance.purchaseDate?.toIso8601String(),
      'estimated_amount': instance.estimatedAmount,
      'rating': instance.rating,
      'finance_with_it': Data._financeToJson(instance.financeWithIt),
      'brand': instance.brand,
      'model': instance.model,
      'defect_store': instance.defectStore,
      'fake_score': instance.fakeScore,
      'ml_status': instance.mlStatus,
      'admin_status': instance.adminStatus,
      'admin_comment': instance.adminComment,
      'status': instance.status,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'category_name': instance.categoryName,
      'product_images': instance.productImages,
      'product_certificates': instance.productCertificates,
    };

ProductImage _$ProductImageFromJson(Map<String, dynamic> json) => ProductImage(
      id: json['id'] as int?,
      productId: json['product_id'] as int?,
      fileName: json['file_name'] as String?,
      status: json['status'] as int?,
      createdBy: json['created_by'] as int?,
      updatedBy: json['updated_by'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$ProductImageToJson(ProductImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'file_name': instance.fileName,
      'status': instance.status,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

ProductCertificate _$ProductCertificateFromJson(Map<String, dynamic> json) =>
    ProductCertificate(
      id: json['id'] as int?,
      productId: json['product_id'] as int?,
      filename: json['filename'] as String?,
      status: json['status'] as int?,
      createdBy: json['created_by'] as int?,
      updatedBy: json['updated_by'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$ProductCertificateToJson(ProductCertificate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'filename': instance.filename,
      'status': instance.status,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
