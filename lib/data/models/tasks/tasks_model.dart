import 'package:freezed_annotation/freezed_annotation.dart';

part 'tasks_model.freezed.dart';
part 'tasks_model.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required List<TaskElement> tasks,
  }) = _Task;

  factory Task.fromJson(Map<String, Object?> json) => _$TaskFromJson(json);
}

@freezed
class TaskElement with _$TaskElement {
  const factory TaskElement({
    int? id,
    String? title,
    String? description,
    String? startDate,
    String? endDate,
    int? priorityId,
    int? statusId,
    int? categoryId,
    String? recurrence,
    String? colorPriority,
    String? colorCategory,
    String? iconCategory,
    String? namePriority,
    int? estimatedTime,
    String? comments,
    String? attachments,
    String? geoLocation,
    String? type,
    String? startTime,
    String? endTime,
    int? parentId, // Puede ser nulo si es la tarea principal
    List<TaskElement>? children, // Aquí es donde ocurre la recursividad
    List<Person>? people, // Aquí es donde ocurre la recursividad
  }) = _TaskElement;

  factory TaskElement.fromJson(Map<String, Object?> json) => _$TaskElementFromJson(json);
}

@freezed
class Person with _$Person {
  const factory Person({
    required int id,
    int? roleId,
    int? points,
    int? homePersonTaskId,
    String? name,
    String? description,
    String? image,
    String? roleName,
  }) = _Person;

  factory Person.fromJson(Map<String, Object?> json) => _$PersonFromJson(json);
}
