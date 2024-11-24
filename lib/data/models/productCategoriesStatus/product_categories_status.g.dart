// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_categories_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductCategoriesStatusImpl _$$ProductCategoriesStatusImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductCategoriesStatusImpl(
      productcategories: (json['productcategories'] as List<dynamic>)
          .map((e) => Productcategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      productstatus: (json['productstatus'] as List<dynamic>)
          .map((e) => Productstatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductCategoriesStatusImplToJson(
        _$ProductCategoriesStatusImpl instance) =>
    <String, dynamic>{
      'productcategories': instance.productcategories,
      'productstatus': instance.productstatus,
    };

_$ProductcategoryImpl _$$ProductcategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductcategoryImpl(
      id: (json['id'] as num).toInt(),
      nameCategory: json['nameCategory'] as String,
      descriptionCategory: json['descriptionCategory'] as String,
      iconCategory: json['iconCategory'],
    );

Map<String, dynamic> _$$ProductcategoryImplToJson(
        _$ProductcategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameCategory': instance.nameCategory,
      'descriptionCategory': instance.descriptionCategory,
      'iconCategory': instance.iconCategory,
    };

_$ProductstatusImpl _$$ProductstatusImplFromJson(Map<String, dynamic> json) =>
    _$ProductstatusImpl(
      id: (json['id'] as num).toInt(),
      nameStatus: json['nameStatus'] as String,
      descriptionStatus: json['descriptionStatus'] as String,
      iconCategory: json['iconCategory'],
    );

Map<String, dynamic> _$$ProductstatusImplToJson(_$ProductstatusImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameStatus': instance.nameStatus,
      'descriptionStatus': instance.descriptionStatus,
      'iconCategory': instance.iconCategory,
    };
