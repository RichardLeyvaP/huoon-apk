// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'products': instance.products,
    };

_$ProductElementImpl _$$ProductElementImplFromJson(Map<String, dynamic> json) =>
    _$ProductElementImpl(
      id: (json['id'] as num?)?.toInt(),
      homeId: (json['homeId'] as num?)?.toInt(),
      warehouseId: (json['warehouseId'] as num?)?.toInt(),
      productId: (json['productId'] as num?)?.toInt(),
      homeName: json['homeName'] as String?,
      warehouseName: json['warehouseName'] as String?,
      productName: json['productName'] as String?,
      categoryId: (json['categoryId'] as num?)?.toInt(),
      count: (json['count'] as num?)?.toInt(),
      nameCategory: json['nameCategory'] as String?,
      statusId: (json['statusId'] as num?)?.toInt(),
      nameStatus: json['nameStatus'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      unitPrice: json['unitPrice'] as String?,
      totalPrice: json['totalPrice'] as String?,
      purchaseDate: json['purchaseDate'] as String?,
      expirationDate: json['expirationDate'] == null
          ? null
          : DateTime.parse(json['expirationDate'] as String),
      purchasePlace: json['purchasePlace'] as String?,
      brand: json['brand'] as String?,
      additionalNotes: json['additionalNotes'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$ProductElementImplToJson(
        _$ProductElementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'homeId': instance.homeId,
      'warehouseId': instance.warehouseId,
      'productId': instance.productId,
      'homeName': instance.homeName,
      'warehouseName': instance.warehouseName,
      'productName': instance.productName,
      'categoryId': instance.categoryId,
      'count': instance.count,
      'nameCategory': instance.nameCategory,
      'statusId': instance.statusId,
      'nameStatus': instance.nameStatus,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'totalPrice': instance.totalPrice,
      'purchaseDate': instance.purchaseDate,
      'expirationDate': instance.expirationDate?.toIso8601String(),
      'purchasePlace': instance.purchasePlace,
      'brand': instance.brand,
      'additionalNotes': instance.additionalNotes,
      'image': instance.image,
    };
