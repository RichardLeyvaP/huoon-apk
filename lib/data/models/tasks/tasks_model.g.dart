// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => TaskElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'tasks': instance.tasks,
    };

_$TaskElementImpl _$$TaskElementImplFromJson(Map<String, dynamic> json) =>
    _$TaskElementImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      priorityId: (json['priorityId'] as num?)?.toInt(),
      statusId: (json['statusId'] as num?)?.toInt(),
      categoryId: (json['categoryId'] as num?)?.toInt(),
      recurrence: json['recurrence'] as String?,
      colorPriority: json['colorPriority'] as String?,
      colorCategory: json['colorCategory'] as String?,
      iconCategory: json['iconCategory'] as String?,
      namePriority: json['namePriority'] as String?,
      estimatedTime: (json['estimatedTime'] as num?)?.toInt(),
      comments: json['comments'] as String?,
      attachments: json['attachments'] as String?,
      geoLocation: json['geoLocation'] as String?,
      type: json['type'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      parentId: (json['parentId'] as num?)?.toInt(),
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => TaskElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      people: (json['people'] as List<dynamic>?)
          ?.map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TaskElementImplToJson(_$TaskElementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'priorityId': instance.priorityId,
      'statusId': instance.statusId,
      'categoryId': instance.categoryId,
      'recurrence': instance.recurrence,
      'colorPriority': instance.colorPriority,
      'colorCategory': instance.colorCategory,
      'iconCategory': instance.iconCategory,
      'namePriority': instance.namePriority,
      'estimatedTime': instance.estimatedTime,
      'comments': instance.comments,
      'attachments': instance.attachments,
      'geoLocation': instance.geoLocation,
      'type': instance.type,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'parentId': instance.parentId,
      'children': instance.children,
      'people': instance.people,
    };

_$PersonImpl _$$PersonImplFromJson(Map<String, dynamic> json) => _$PersonImpl(
      id: (json['id'] as num).toInt(),
      roleId: (json['roleId'] as num?)?.toInt(),
      points: (json['points'] as num?)?.toInt(),
      homePersonTaskId: (json['homePersonTaskId'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      roleName: json['roleName'] as String?,
    );

Map<String, dynamic> _$$PersonImplToJson(_$PersonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'roleId': instance.roleId,
      'points': instance.points,
      'homePersonTaskId': instance.homePersonTaskId,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'roleName': instance.roleName,
    };
