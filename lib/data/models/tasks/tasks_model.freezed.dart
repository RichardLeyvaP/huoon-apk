// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  List<TaskElement> get tasks => throw _privateConstructorUsedError;

  /// Serializes this Task to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call({List<TaskElement> tasks});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
  }) {
    return _then(_value.copyWith(
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskElement>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
          _$TaskImpl value, $Res Function(_$TaskImpl) then) =
      __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TaskElement> tasks});
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
  }) {
    return _then(_$TaskImpl(
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskElement>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskImpl implements _Task {
  const _$TaskImpl({required final List<TaskElement> tasks}) : _tasks = tasks;

  factory _$TaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskImplFromJson(json);

  final List<TaskElement> _tasks;
  @override
  List<TaskElement> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'Task(tasks: $tasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tasks));

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskImplToJson(
      this,
    );
  }
}

abstract class _Task implements Task {
  const factory _Task({required final List<TaskElement> tasks}) = _$TaskImpl;

  factory _Task.fromJson(Map<String, dynamic> json) = _$TaskImpl.fromJson;

  @override
  List<TaskElement> get tasks;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TaskElement _$TaskElementFromJson(Map<String, dynamic> json) {
  return _TaskElement.fromJson(json);
}

/// @nodoc
mixin _$TaskElement {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get startDate => throw _privateConstructorUsedError;
  String? get endDate => throw _privateConstructorUsedError;
  int? get priorityId => throw _privateConstructorUsedError;
  int? get statusId => throw _privateConstructorUsedError;
  int? get categoryId => throw _privateConstructorUsedError;
  String? get recurrence => throw _privateConstructorUsedError;
  String? get colorPriority => throw _privateConstructorUsedError;
  String? get colorCategory => throw _privateConstructorUsedError;
  String? get iconCategory => throw _privateConstructorUsedError;
  String? get namePriority => throw _privateConstructorUsedError;
  int? get estimatedTime => throw _privateConstructorUsedError;
  String? get comments => throw _privateConstructorUsedError;
  String? get attachments => throw _privateConstructorUsedError;
  String? get geoLocation => throw _privateConstructorUsedError;
  int? get parentId =>
      throw _privateConstructorUsedError; // Puede ser nulo si es la tarea principal
  List<TaskElement>? get children =>
      throw _privateConstructorUsedError; // Aquí es donde ocurre la recursividad
  List<Person>? get people => throw _privateConstructorUsedError;

  /// Serializes this TaskElement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskElement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskElementCopyWith<TaskElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskElementCopyWith<$Res> {
  factory $TaskElementCopyWith(
          TaskElement value, $Res Function(TaskElement) then) =
      _$TaskElementCopyWithImpl<$Res, TaskElement>;
  @useResult
  $Res call(
      {int? id,
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
      int? parentId,
      List<TaskElement>? children,
      List<Person>? people});
}

/// @nodoc
class _$TaskElementCopyWithImpl<$Res, $Val extends TaskElement>
    implements $TaskElementCopyWith<$Res> {
  _$TaskElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskElement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? priorityId = freezed,
    Object? statusId = freezed,
    Object? categoryId = freezed,
    Object? recurrence = freezed,
    Object? colorPriority = freezed,
    Object? colorCategory = freezed,
    Object? iconCategory = freezed,
    Object? namePriority = freezed,
    Object? estimatedTime = freezed,
    Object? comments = freezed,
    Object? attachments = freezed,
    Object? geoLocation = freezed,
    Object? parentId = freezed,
    Object? children = freezed,
    Object? people = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      priorityId: freezed == priorityId
          ? _value.priorityId
          : priorityId // ignore: cast_nullable_to_non_nullable
              as int?,
      statusId: freezed == statusId
          ? _value.statusId
          : statusId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      recurrence: freezed == recurrence
          ? _value.recurrence
          : recurrence // ignore: cast_nullable_to_non_nullable
              as String?,
      colorPriority: freezed == colorPriority
          ? _value.colorPriority
          : colorPriority // ignore: cast_nullable_to_non_nullable
              as String?,
      colorCategory: freezed == colorCategory
          ? _value.colorCategory
          : colorCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      iconCategory: freezed == iconCategory
          ? _value.iconCategory
          : iconCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      namePriority: freezed == namePriority
          ? _value.namePriority
          : namePriority // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedTime: freezed == estimatedTime
          ? _value.estimatedTime
          : estimatedTime // ignore: cast_nullable_to_non_nullable
              as int?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: freezed == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as String?,
      geoLocation: freezed == geoLocation
          ? _value.geoLocation
          : geoLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      children: freezed == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<TaskElement>?,
      people: freezed == people
          ? _value.people
          : people // ignore: cast_nullable_to_non_nullable
              as List<Person>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskElementImplCopyWith<$Res>
    implements $TaskElementCopyWith<$Res> {
  factory _$$TaskElementImplCopyWith(
          _$TaskElementImpl value, $Res Function(_$TaskElementImpl) then) =
      __$$TaskElementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
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
      int? parentId,
      List<TaskElement>? children,
      List<Person>? people});
}

/// @nodoc
class __$$TaskElementImplCopyWithImpl<$Res>
    extends _$TaskElementCopyWithImpl<$Res, _$TaskElementImpl>
    implements _$$TaskElementImplCopyWith<$Res> {
  __$$TaskElementImplCopyWithImpl(
      _$TaskElementImpl _value, $Res Function(_$TaskElementImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskElement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? priorityId = freezed,
    Object? statusId = freezed,
    Object? categoryId = freezed,
    Object? recurrence = freezed,
    Object? colorPriority = freezed,
    Object? colorCategory = freezed,
    Object? iconCategory = freezed,
    Object? namePriority = freezed,
    Object? estimatedTime = freezed,
    Object? comments = freezed,
    Object? attachments = freezed,
    Object? geoLocation = freezed,
    Object? parentId = freezed,
    Object? children = freezed,
    Object? people = freezed,
  }) {
    return _then(_$TaskElementImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      priorityId: freezed == priorityId
          ? _value.priorityId
          : priorityId // ignore: cast_nullable_to_non_nullable
              as int?,
      statusId: freezed == statusId
          ? _value.statusId
          : statusId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      recurrence: freezed == recurrence
          ? _value.recurrence
          : recurrence // ignore: cast_nullable_to_non_nullable
              as String?,
      colorPriority: freezed == colorPriority
          ? _value.colorPriority
          : colorPriority // ignore: cast_nullable_to_non_nullable
              as String?,
      colorCategory: freezed == colorCategory
          ? _value.colorCategory
          : colorCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      iconCategory: freezed == iconCategory
          ? _value.iconCategory
          : iconCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      namePriority: freezed == namePriority
          ? _value.namePriority
          : namePriority // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedTime: freezed == estimatedTime
          ? _value.estimatedTime
          : estimatedTime // ignore: cast_nullable_to_non_nullable
              as int?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: freezed == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as String?,
      geoLocation: freezed == geoLocation
          ? _value.geoLocation
          : geoLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      children: freezed == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<TaskElement>?,
      people: freezed == people
          ? _value._people
          : people // ignore: cast_nullable_to_non_nullable
              as List<Person>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskElementImpl implements _TaskElement {
  const _$TaskElementImpl(
      {this.id,
      this.title,
      this.description,
      this.startDate,
      this.endDate,
      this.priorityId,
      this.statusId,
      this.categoryId,
      this.recurrence,
      this.colorPriority,
      this.colorCategory,
      this.iconCategory,
      this.namePriority,
      this.estimatedTime,
      this.comments,
      this.attachments,
      this.geoLocation,
      this.parentId,
      final List<TaskElement>? children,
      final List<Person>? people})
      : _children = children,
        _people = people;

  factory _$TaskElementImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskElementImplFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? startDate;
  @override
  final String? endDate;
  @override
  final int? priorityId;
  @override
  final int? statusId;
  @override
  final int? categoryId;
  @override
  final String? recurrence;
  @override
  final String? colorPriority;
  @override
  final String? colorCategory;
  @override
  final String? iconCategory;
  @override
  final String? namePriority;
  @override
  final int? estimatedTime;
  @override
  final String? comments;
  @override
  final String? attachments;
  @override
  final String? geoLocation;
  @override
  final int? parentId;
// Puede ser nulo si es la tarea principal
  final List<TaskElement>? _children;
// Puede ser nulo si es la tarea principal
  @override
  List<TaskElement>? get children {
    final value = _children;
    if (value == null) return null;
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// Aquí es donde ocurre la recursividad
  final List<Person>? _people;
// Aquí es donde ocurre la recursividad
  @override
  List<Person>? get people {
    final value = _people;
    if (value == null) return null;
    if (_people is EqualUnmodifiableListView) return _people;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TaskElement(id: $id, title: $title, description: $description, startDate: $startDate, endDate: $endDate, priorityId: $priorityId, statusId: $statusId, categoryId: $categoryId, recurrence: $recurrence, colorPriority: $colorPriority, colorCategory: $colorCategory, iconCategory: $iconCategory, namePriority: $namePriority, estimatedTime: $estimatedTime, comments: $comments, attachments: $attachments, geoLocation: $geoLocation, parentId: $parentId, children: $children, people: $people)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskElementImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.priorityId, priorityId) ||
                other.priorityId == priorityId) &&
            (identical(other.statusId, statusId) ||
                other.statusId == statusId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.recurrence, recurrence) ||
                other.recurrence == recurrence) &&
            (identical(other.colorPriority, colorPriority) ||
                other.colorPriority == colorPriority) &&
            (identical(other.colorCategory, colorCategory) ||
                other.colorCategory == colorCategory) &&
            (identical(other.iconCategory, iconCategory) ||
                other.iconCategory == iconCategory) &&
            (identical(other.namePriority, namePriority) ||
                other.namePriority == namePriority) &&
            (identical(other.estimatedTime, estimatedTime) ||
                other.estimatedTime == estimatedTime) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.attachments, attachments) ||
                other.attachments == attachments) &&
            (identical(other.geoLocation, geoLocation) ||
                other.geoLocation == geoLocation) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            const DeepCollectionEquality().equals(other._people, _people));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        description,
        startDate,
        endDate,
        priorityId,
        statusId,
        categoryId,
        recurrence,
        colorPriority,
        colorCategory,
        iconCategory,
        namePriority,
        estimatedTime,
        comments,
        attachments,
        geoLocation,
        parentId,
        const DeepCollectionEquality().hash(_children),
        const DeepCollectionEquality().hash(_people)
      ]);

  /// Create a copy of TaskElement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskElementImplCopyWith<_$TaskElementImpl> get copyWith =>
      __$$TaskElementImplCopyWithImpl<_$TaskElementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskElementImplToJson(
      this,
    );
  }
}

abstract class _TaskElement implements TaskElement {
  const factory _TaskElement(
      {final int? id,
      final String? title,
      final String? description,
      final String? startDate,
      final String? endDate,
      final int? priorityId,
      final int? statusId,
      final int? categoryId,
      final String? recurrence,
      final String? colorPriority,
      final String? colorCategory,
      final String? iconCategory,
      final String? namePriority,
      final int? estimatedTime,
      final String? comments,
      final String? attachments,
      final String? geoLocation,
      final int? parentId,
      final List<TaskElement>? children,
      final List<Person>? people}) = _$TaskElementImpl;

  factory _TaskElement.fromJson(Map<String, dynamic> json) =
      _$TaskElementImpl.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get startDate;
  @override
  String? get endDate;
  @override
  int? get priorityId;
  @override
  int? get statusId;
  @override
  int? get categoryId;
  @override
  String? get recurrence;
  @override
  String? get colorPriority;
  @override
  String? get colorCategory;
  @override
  String? get iconCategory;
  @override
  String? get namePriority;
  @override
  int? get estimatedTime;
  @override
  String? get comments;
  @override
  String? get attachments;
  @override
  String? get geoLocation;
  @override
  int? get parentId; // Puede ser nulo si es la tarea principal
  @override
  List<TaskElement>? get children; // Aquí es donde ocurre la recursividad
  @override
  List<Person>? get people;

  /// Create a copy of TaskElement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskElementImplCopyWith<_$TaskElementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Person _$PersonFromJson(Map<String, dynamic> json) {
  return _Person.fromJson(json);
}

/// @nodoc
mixin _$Person {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  /// Serializes this Person to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Person
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonCopyWith<Person> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonCopyWith<$Res> {
  factory $PersonCopyWith(Person value, $Res Function(Person) then) =
      _$PersonCopyWithImpl<$Res, Person>;
  @useResult
  $Res call({int id, String name, String image});
}

/// @nodoc
class _$PersonCopyWithImpl<$Res, $Val extends Person>
    implements $PersonCopyWith<$Res> {
  _$PersonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Person
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonImplCopyWith<$Res> implements $PersonCopyWith<$Res> {
  factory _$$PersonImplCopyWith(
          _$PersonImpl value, $Res Function(_$PersonImpl) then) =
      __$$PersonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String image});
}

/// @nodoc
class __$$PersonImplCopyWithImpl<$Res>
    extends _$PersonCopyWithImpl<$Res, _$PersonImpl>
    implements _$$PersonImplCopyWith<$Res> {
  __$$PersonImplCopyWithImpl(
      _$PersonImpl _value, $Res Function(_$PersonImpl) _then)
      : super(_value, _then);

  /// Create a copy of Person
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
  }) {
    return _then(_$PersonImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonImpl implements _Person {
  const _$PersonImpl(
      {required this.id, required this.name, required this.image});

  factory _$PersonImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String image;

  @override
  String toString() {
    return 'Person(id: $id, name: $name, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, image);

  /// Create a copy of Person
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonImplCopyWith<_$PersonImpl> get copyWith =>
      __$$PersonImplCopyWithImpl<_$PersonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonImplToJson(
      this,
    );
  }
}

abstract class _Person implements Person {
  const factory _Person(
      {required final int id,
      required final String name,
      required final String image}) = _$PersonImpl;

  factory _Person.fromJson(Map<String, dynamic> json) = _$PersonImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get image;

  /// Create a copy of Person
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonImplCopyWith<_$PersonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
