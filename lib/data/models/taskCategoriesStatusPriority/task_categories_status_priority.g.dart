// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_categories_status_priority.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskCategoriesStatusPriorityImpl _$$TaskCategoriesStatusPriorityImplFromJson(
        Map<String, dynamic> json) =>
    _$TaskCategoriesStatusPriorityImpl(
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as List<dynamic>)
          .map((e) => Status.fromJson(e as Map<String, dynamic>))
          .toList(),
      priorities: (json['priorities'] as List<dynamic>)
          .map((e) => Priority.fromJson(e as Map<String, dynamic>))
          .toList(),
      taskperson: (json['taskperson'] as List<dynamic>)
          .map((e) => Taskperson.fromJson(e as Map<String, dynamic>))
          .toList(),
      taskrecurrences: (json['taskrecurrences'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$TaskCategoriesStatusPriorityImplToJson(
        _$TaskCategoriesStatusPriorityImpl instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'status': instance.status,
      'priorities': instance.priorities,
      'taskperson': instance.taskperson,
      'taskrecurrences': instance.taskrecurrences,
    };

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: (json['id'] as num).toInt(),
      nameCategory: json['nameCategory'] as String,
      descriptionCategory: json['descriptionCategory'] as String,
      colorCategory: json['colorCategory'] as String,
      iconCategory: json['iconCategory'] as String,
      parentId: (json['parentId'] as num?)?.toInt(),
      children: (json['children'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameCategory': instance.nameCategory,
      'descriptionCategory': instance.descriptionCategory,
      'colorCategory': instance.colorCategory,
      'iconCategory': instance.iconCategory,
      'parentId': instance.parentId,
      'children': instance.children,
    };

_$PriorityImpl _$$PriorityImplFromJson(Map<String, dynamic> json) =>
    _$PriorityImpl(
      id: (json['id'] as num).toInt(),
      namePriority: json['namePriority'] as String,
      descriptionPriority: json['descriptionPriority'] as String,
      colorPriority: json['colorPriority'] as String,
      level: (json['level'] as num).toInt(),
    );

Map<String, dynamic> _$$PriorityImplToJson(_$PriorityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'namePriority': instance.namePriority,
      'descriptionPriority': instance.descriptionPriority,
      'colorPriority': instance.colorPriority,
      'level': instance.level,
    };

_$StatusImpl _$$StatusImplFromJson(Map<String, dynamic> json) => _$StatusImpl(
      id: (json['id'] as num).toInt(),
      nameStatus: json['nameStatus'] as String,
      descriptionStatus: json['descriptionStatus'] as String,
      colorStatus: json['colorStatus'] as String,
      iconStatus: json['iconStatus'],
    );

Map<String, dynamic> _$$StatusImplToJson(_$StatusImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameStatus': instance.nameStatus,
      'descriptionStatus': instance.descriptionStatus,
      'colorStatus': instance.colorStatus,
      'iconStatus': instance.iconStatus,
    };

_$TaskpersonImpl _$$TaskpersonImplFromJson(Map<String, dynamic> json) =>
    _$TaskpersonImpl(
      id: (json['id'] as num).toInt(),
      namePerson: json['namePerson'] as String,
      imagePerson: json['imagePerson'] as String,
      rolId: (json['rolId'] as num).toInt(),
      nameRole: json['nameRole'] as String,
    );

Map<String, dynamic> _$$TaskpersonImplToJson(_$TaskpersonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'namePerson': instance.namePerson,
      'imagePerson': instance.imagePerson,
      'rolId': instance.rolId,
      'nameRole': instance.nameRole,
    };
