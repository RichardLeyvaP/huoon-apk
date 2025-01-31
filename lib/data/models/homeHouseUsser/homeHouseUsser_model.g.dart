// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeHouseUsser_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeHouseUsserImpl _$$HomeHouseUsserImplFromJson(Map<String, dynamic> json) =>
    _$HomeHouseUsserImpl(
      homes: (json['homes'] as List<dynamic>?)
          ?.map((e) => Home.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HomeHouseUsserImplToJson(
        _$HomeHouseUsserImpl instance) =>
    <String, dynamic>{
      'homes': instance.homes,
    };

_$HomeImpl _$$HomeImplFromJson(Map<String, dynamic> json) => _$HomeImpl(
      id: (json['id'] as num?)?.toInt(),
      statusId: (json['statusId'] as num?)?.toInt(),
      homeStatusId: (json['homeStatusId'] as num?)?.toInt(),
      name: json['name'] as String?,
      address: json['address'] as String?,
      homeTypeId: (json['homeTypeId'] as num?)?.toInt(),
      homeHomeTypeId: (json['homeHomeTypeId'] as num?)?.toInt(),
      nameHomeType: json['nameHomeType'] as String?,
      residents: (json['residents'] as num?)?.toInt(),
      geoLocation: json['geoLocation'] as String?,
      homeGeoLocation: json['homeGeoLocation'] as String?,
      timezone: json['timezone'] as String?,
      nameStatus: json['nameStatus'] as String?,
      image: json['image'] as String?,
      people: (json['people'] as List<dynamic>?)
          ?.map((e) => PersonHomeUsser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HomeImplToJson(_$HomeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusId': instance.statusId,
      'homeStatusId': instance.homeStatusId,
      'name': instance.name,
      'address': instance.address,
      'homeTypeId': instance.homeTypeId,
      'homeHomeTypeId': instance.homeHomeTypeId,
      'nameHomeType': instance.nameHomeType,
      'residents': instance.residents,
      'geoLocation': instance.geoLocation,
      'homeGeoLocation': instance.homeGeoLocation,
      'timezone': instance.timezone,
      'nameStatus': instance.nameStatus,
      'image': instance.image,
      'people': instance.people,
    };

_$PersonHomeUsserImpl _$$PersonHomeUsserImplFromJson(
        Map<String, dynamic> json) =>
    _$PersonHomeUsserImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: json['image'] as String?,
      roleId: (json['roleId'] as num?)?.toInt(),
      personRoleId: (json['personRoleId'] as num?)?.toInt(),
      roleName: json['roleName'] as String?,
    );

Map<String, dynamic> _$$PersonHomeUsserImplToJson(
        _$PersonHomeUsserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'roleId': instance.roleId,
      'personRoleId': instance.personRoleId,
      'roleName': instance.roleName,
    };
