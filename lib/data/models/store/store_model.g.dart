// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreImpl _$$StoreImplFromJson(Map<String, dynamic> json) => _$StoreImpl(
      store: (json['store'] as List<dynamic>)
          .map((e) => StoreElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StoreImplToJson(_$StoreImpl instance) =>
    <String, dynamic>{
      'store': instance.store,
    };

_$StoreElementImpl _$$StoreElementImplFromJson(Map<String, dynamic> json) =>
    _$StoreElementImpl(
      id: (json['id'] as num?)?.toInt(),
      warehouse_id: (json['warehouse_id'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
      creator: json['creator'] as bool?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$$StoreElementImplToJson(_$StoreElementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'warehouse_id': instance.warehouse_id,
      'status': instance.status,
      'creator': instance.creator,
      'title': instance.title,
      'description': instance.description,
      'location': instance.location,
    };
