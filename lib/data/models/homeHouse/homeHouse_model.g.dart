// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeHouse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeHouseImpl _$$HomeHouseImplFromJson(Map<String, dynamic> json) =>
    _$HomeHouseImpl(
      name: json['name'] as String?,
      address: json['address'] as String?,
      homeTypeId: (json['homeTypeId'] as num?)?.toInt(),
      residents: (json['residents'] as num?)?.toInt(),
      geoLocation: json['geoLocation'] as String?,
      timezone: json['timezone'] as String?,
      statusId: (json['statusId'] as num?)?.toInt(),
      image: json['image'] as String?,
      people: (json['people'] as List<dynamic>?)
          ?.map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HomeHouseImplToJson(_$HomeHouseImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'homeTypeId': instance.homeTypeId,
      'residents': instance.residents,
      'geoLocation': instance.geoLocation,
      'timezone': instance.timezone,
      'statusId': instance.statusId,
      'image': instance.image,
      'people': instance.people,
    };

_$PersonImpl _$$PersonImplFromJson(Map<String, dynamic> json) => _$PersonImpl(
      personId: (json['personId'] as num?)?.toInt(),
      roleId: (json['roleId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PersonImplToJson(_$PersonImpl instance) =>
    <String, dynamic>{
      'personId': instance.personId,
      'roleId': instance.roleId,
    };
