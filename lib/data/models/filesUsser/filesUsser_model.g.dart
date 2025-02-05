// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filesUsser_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FilesModelImpl _$$FilesModelImplFromJson(Map<String, dynamic> json) =>
    _$FilesModelImpl(
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => FileElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FilesModelImplToJson(_$FilesModelImpl instance) =>
    <String, dynamic>{
      'files': instance.files,
    };

_$FileElementImpl _$$FileElementImplFromJson(Map<String, dynamic> json) =>
    _$FileElementImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      archive: json['archive'] as String?,
      type: json['type'] as String?,
      size: (json['size'] as num?)?.toInt(),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      description: json['description'] as String?,
      filePersonId: (json['filePersonId'] as num?)?.toInt(),
      personId: (json['personId'] as num?)?.toInt(),
      homeId: (json['homeId'] as num?)?.toInt(),
      fileHomeId: (json['fileHomeId'] as num?)?.toInt(),
      personal: (json['personal'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$FileElementImplToJson(_$FileElementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'archive': instance.archive,
      'type': instance.type,
      'size': instance.size,
      'date': instance.date?.toIso8601String(),
      'description': instance.description,
      'filePersonId': instance.filePersonId,
      'personId': instance.personId,
      'homeId': instance.homeId,
      'fileHomeId': instance.fileHomeId,
      'personal': instance.personal,
    };
