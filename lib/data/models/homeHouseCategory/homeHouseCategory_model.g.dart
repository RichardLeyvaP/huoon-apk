// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeHouseCategory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeHouseCategoryImpl _$$HomeHouseCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$HomeHouseCategoryImpl(
      homestatus: (json['homestatus'] as List<dynamic>?)
          ?.map((e) => Homestatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      homeroles: (json['homeroles'] as List<dynamic>?)
          ?.map((e) => Homerole.fromJson(e as Map<String, dynamic>))
          .toList(),
      hometypes: (json['hometypes'] as List<dynamic>?)
          ?.map((e) => Hometype.fromJson(e as Map<String, dynamic>))
          .toList(),
      homepeople: (json['homepeople'] as List<dynamic>?)
          ?.map((e) => Homeperson.fromJson(e as Map<String, dynamic>))
          .toList(),
      homewarehouses: (json['homewarehouses'] as List<dynamic>?)
          ?.map((e) => Homewarehouse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HomeHouseCategoryImplToJson(
        _$HomeHouseCategoryImpl instance) =>
    <String, dynamic>{
      'homestatus': instance.homestatus,
      'homeroles': instance.homeroles,
      'hometypes': instance.hometypes,
      'homepeople': instance.homepeople,
      'homewarehouses': instance.homewarehouses,
    };

_$HomepersonImpl _$$HomepersonImplFromJson(Map<String, dynamic> json) =>
    _$HomepersonImpl(
      id: (json['id'] as num?)?.toInt(),
      namePerson: json['namePerson'] as String?,
      imagePerson: json['imagePerson'] as String?,
    );

Map<String, dynamic> _$$HomepersonImplToJson(_$HomepersonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'namePerson': instance.namePerson,
      'imagePerson': instance.imagePerson,
    };

_$HomeroleImpl _$$HomeroleImplFromJson(Map<String, dynamic> json) =>
    _$HomeroleImpl(
      id: (json['id'] as num?)?.toInt(),
      nameRol: json['nameRol'] as String?,
      descriptionRol: json['descriptionRol'] as String?,
    );

Map<String, dynamic> _$$HomeroleImplToJson(_$HomeroleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameRol': instance.nameRol,
      'descriptionRol': instance.descriptionRol,
    };

_$HomestatusImpl _$$HomestatusImplFromJson(Map<String, dynamic> json) =>
    _$HomestatusImpl(
      id: (json['id'] as num?)?.toInt(),
      nameStatus: json['nameStatus'] as String?,
      descriptionStatus: json['descriptionStatus'] as String?,
      colorStatus: json['colorStatus'] as String?,
      iconStatus: json['iconStatus'] as String?,
    );

Map<String, dynamic> _$$HomestatusImplToJson(_$HomestatusImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameStatus': instance.nameStatus,
      'descriptionStatus': instance.descriptionStatus,
      'colorStatus': instance.colorStatus,
      'iconStatus': instance.iconStatus,
    };

_$HometypeImpl _$$HometypeImplFromJson(Map<String, dynamic> json) =>
    _$HometypeImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$$HometypeImplToJson(_$HometypeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'icon': instance.icon,
    };

_$HomewarehouseImpl _$$HomewarehouseImplFromJson(Map<String, dynamic> json) =>
    _$HomewarehouseImpl(
      id: (json['id'] as num?)?.toInt(),
      nameWarehouses: json['nameWarehouses'] as String?,
      descriptionWarehouses: json['descriptionWarehouses'] as String?,
      locationWarehouses: json['locationWarehouses'] as String?,
    );

Map<String, dynamic> _$$HomewarehouseImplToJson(_$HomewarehouseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameWarehouses': instance.nameWarehouses,
      'descriptionWarehouses': instance.descriptionWarehouses,
      'locationWarehouses': instance.locationWarehouses,
    };
