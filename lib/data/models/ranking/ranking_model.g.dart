// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RankingImpl _$$RankingImplFromJson(Map<String, dynamic> json) =>
    _$RankingImpl(
      homePeople: (json['homePeople'] as List<dynamic>?)
          ?.map((e) => HomePerson.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RankingImplToJson(_$RankingImpl instance) =>
    <String, dynamic>{
      'homePeople': instance.homePeople,
    };

_$HomePersonImpl _$$HomePersonImplFromJson(Map<String, dynamic> json) =>
    _$HomePersonImpl(
      id: (json['id'] as num?)?.toInt(),
      homeId: (json['homeId'] as num?)?.toInt(),
      homePersonHomeId: (json['homePersonHomeId'] as num?)?.toInt(),
      personId: (json['personId'] as num?)?.toInt(),
      homePersonPersonId: (json['homePersonPersonId'] as num?)?.toInt(),
      personName: json['personName'] as String?,
      roleId: (json['roleId'] as num?)?.toInt(),
      homePersonRoleId: (json['homePersonRoleId'] as num?)?.toInt(),
      roleName: json['roleName'] as String?,
      personImage: json['personImage'] as String?,
      points: (json['points'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$HomePersonImplToJson(_$HomePersonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'homeId': instance.homeId,
      'homePersonHomeId': instance.homePersonHomeId,
      'personId': instance.personId,
      'homePersonPersonId': instance.homePersonPersonId,
      'personName': instance.personName,
      'roleId': instance.roleId,
      'homePersonRoleId': instance.homePersonRoleId,
      'roleName': instance.roleName,
      'personImage': instance.personImage,
      'points': instance.points,
    };
