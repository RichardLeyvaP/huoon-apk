// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_categories_status_priority.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskCategoriesStatusPriority _$TaskCategoriesStatusPriorityFromJson(
    Map<String, dynamic> json) {
  return _TaskCategoriesStatusPriority.fromJson(json);
}

/// @nodoc
mixin _$TaskCategoriesStatusPriority {
  List<Category> get categories => throw _privateConstructorUsedError;
  List<Status> get status => throw _privateConstructorUsedError;
  List<Priority> get priorities => throw _privateConstructorUsedError;
  List<Taskperson> get taskperson => throw _privateConstructorUsedError;
  List<String> get taskrecurrences => throw _privateConstructorUsedError;

  /// Serializes this TaskCategoriesStatusPriority to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskCategoriesStatusPriority
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskCategoriesStatusPriorityCopyWith<TaskCategoriesStatusPriority>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCategoriesStatusPriorityCopyWith<$Res> {
  factory $TaskCategoriesStatusPriorityCopyWith(
          TaskCategoriesStatusPriority value,
          $Res Function(TaskCategoriesStatusPriority) then) =
      _$TaskCategoriesStatusPriorityCopyWithImpl<$Res,
          TaskCategoriesStatusPriority>;
  @useResult
  $Res call(
      {List<Category> categories,
      List<Status> status,
      List<Priority> priorities,
      List<Taskperson> taskperson,
      List<String> taskrecurrences});
}

/// @nodoc
class _$TaskCategoriesStatusPriorityCopyWithImpl<$Res,
        $Val extends TaskCategoriesStatusPriority>
    implements $TaskCategoriesStatusPriorityCopyWith<$Res> {
  _$TaskCategoriesStatusPriorityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskCategoriesStatusPriority
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? status = null,
    Object? priorities = null,
    Object? taskperson = null,
    Object? taskrecurrences = null,
  }) {
    return _then(_value.copyWith(
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as List<Status>,
      priorities: null == priorities
          ? _value.priorities
          : priorities // ignore: cast_nullable_to_non_nullable
              as List<Priority>,
      taskperson: null == taskperson
          ? _value.taskperson
          : taskperson // ignore: cast_nullable_to_non_nullable
              as List<Taskperson>,
      taskrecurrences: null == taskrecurrences
          ? _value.taskrecurrences
          : taskrecurrences // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskCategoriesStatusPriorityImplCopyWith<$Res>
    implements $TaskCategoriesStatusPriorityCopyWith<$Res> {
  factory _$$TaskCategoriesStatusPriorityImplCopyWith(
          _$TaskCategoriesStatusPriorityImpl value,
          $Res Function(_$TaskCategoriesStatusPriorityImpl) then) =
      __$$TaskCategoriesStatusPriorityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Category> categories,
      List<Status> status,
      List<Priority> priorities,
      List<Taskperson> taskperson,
      List<String> taskrecurrences});
}

/// @nodoc
class __$$TaskCategoriesStatusPriorityImplCopyWithImpl<$Res>
    extends _$TaskCategoriesStatusPriorityCopyWithImpl<$Res,
        _$TaskCategoriesStatusPriorityImpl>
    implements _$$TaskCategoriesStatusPriorityImplCopyWith<$Res> {
  __$$TaskCategoriesStatusPriorityImplCopyWithImpl(
      _$TaskCategoriesStatusPriorityImpl _value,
      $Res Function(_$TaskCategoriesStatusPriorityImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskCategoriesStatusPriority
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? status = null,
    Object? priorities = null,
    Object? taskperson = null,
    Object? taskrecurrences = null,
  }) {
    return _then(_$TaskCategoriesStatusPriorityImpl(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      status: null == status
          ? _value._status
          : status // ignore: cast_nullable_to_non_nullable
              as List<Status>,
      priorities: null == priorities
          ? _value._priorities
          : priorities // ignore: cast_nullable_to_non_nullable
              as List<Priority>,
      taskperson: null == taskperson
          ? _value._taskperson
          : taskperson // ignore: cast_nullable_to_non_nullable
              as List<Taskperson>,
      taskrecurrences: null == taskrecurrences
          ? _value._taskrecurrences
          : taskrecurrences // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskCategoriesStatusPriorityImpl
    implements _TaskCategoriesStatusPriority {
  const _$TaskCategoriesStatusPriorityImpl(
      {required final List<Category> categories,
      required final List<Status> status,
      required final List<Priority> priorities,
      required final List<Taskperson> taskperson,
      required final List<String> taskrecurrences})
      : _categories = categories,
        _status = status,
        _priorities = priorities,
        _taskperson = taskperson,
        _taskrecurrences = taskrecurrences;

  factory _$TaskCategoriesStatusPriorityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TaskCategoriesStatusPriorityImplFromJson(json);

  final List<Category> _categories;
  @override
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<Status> _status;
  @override
  List<Status> get status {
    if (_status is EqualUnmodifiableListView) return _status;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_status);
  }

  final List<Priority> _priorities;
  @override
  List<Priority> get priorities {
    if (_priorities is EqualUnmodifiableListView) return _priorities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_priorities);
  }

  final List<Taskperson> _taskperson;
  @override
  List<Taskperson> get taskperson {
    if (_taskperson is EqualUnmodifiableListView) return _taskperson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_taskperson);
  }

  final List<String> _taskrecurrences;
  @override
  List<String> get taskrecurrences {
    if (_taskrecurrences is EqualUnmodifiableListView) return _taskrecurrences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_taskrecurrences);
  }

  @override
  String toString() {
    return 'TaskCategoriesStatusPriority(categories: $categories, status: $status, priorities: $priorities, taskperson: $taskperson, taskrecurrences: $taskrecurrences)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskCategoriesStatusPriorityImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._status, _status) &&
            const DeepCollectionEquality()
                .equals(other._priorities, _priorities) &&
            const DeepCollectionEquality()
                .equals(other._taskperson, _taskperson) &&
            const DeepCollectionEquality()
                .equals(other._taskrecurrences, _taskrecurrences));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_status),
      const DeepCollectionEquality().hash(_priorities),
      const DeepCollectionEquality().hash(_taskperson),
      const DeepCollectionEquality().hash(_taskrecurrences));

  /// Create a copy of TaskCategoriesStatusPriority
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskCategoriesStatusPriorityImplCopyWith<
          _$TaskCategoriesStatusPriorityImpl>
      get copyWith => __$$TaskCategoriesStatusPriorityImplCopyWithImpl<
          _$TaskCategoriesStatusPriorityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskCategoriesStatusPriorityImplToJson(
      this,
    );
  }
}

abstract class _TaskCategoriesStatusPriority
    implements TaskCategoriesStatusPriority {
  const factory _TaskCategoriesStatusPriority(
          {required final List<Category> categories,
          required final List<Status> status,
          required final List<Priority> priorities,
          required final List<Taskperson> taskperson,
          required final List<String> taskrecurrences}) =
      _$TaskCategoriesStatusPriorityImpl;

  factory _TaskCategoriesStatusPriority.fromJson(Map<String, dynamic> json) =
      _$TaskCategoriesStatusPriorityImpl.fromJson;

  @override
  List<Category> get categories;
  @override
  List<Status> get status;
  @override
  List<Priority> get priorities;
  @override
  List<Taskperson> get taskperson;
  @override
  List<String> get taskrecurrences;

  /// Create a copy of TaskCategoriesStatusPriority
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskCategoriesStatusPriorityImplCopyWith<
          _$TaskCategoriesStatusPriorityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  int get id => throw _privateConstructorUsedError;
  String get nameCategory => throw _privateConstructorUsedError;
  String get descriptionCategory => throw _privateConstructorUsedError;
  String get colorCategory => throw _privateConstructorUsedError;
  String get iconCategory => throw _privateConstructorUsedError;
  int? get parentId => throw _privateConstructorUsedError;
  List<Category> get children => throw _privateConstructorUsedError;

  /// Serializes this Category to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call(
      {int id,
      String nameCategory,
      String descriptionCategory,
      String colorCategory,
      String iconCategory,
      int? parentId,
      List<Category> children});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameCategory = null,
    Object? descriptionCategory = null,
    Object? colorCategory = null,
    Object? iconCategory = null,
    Object? parentId = freezed,
    Object? children = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nameCategory: null == nameCategory
          ? _value.nameCategory
          : nameCategory // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionCategory: null == descriptionCategory
          ? _value.descriptionCategory
          : descriptionCategory // ignore: cast_nullable_to_non_nullable
              as String,
      colorCategory: null == colorCategory
          ? _value.colorCategory
          : colorCategory // ignore: cast_nullable_to_non_nullable
              as String,
      iconCategory: null == iconCategory
          ? _value.iconCategory
          : iconCategory // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      children: null == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryImplCopyWith<$Res>
    implements $CategoryCopyWith<$Res> {
  factory _$$CategoryImplCopyWith(
          _$CategoryImpl value, $Res Function(_$CategoryImpl) then) =
      __$$CategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String nameCategory,
      String descriptionCategory,
      String colorCategory,
      String iconCategory,
      int? parentId,
      List<Category> children});
}

/// @nodoc
class __$$CategoryImplCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$CategoryImpl>
    implements _$$CategoryImplCopyWith<$Res> {
  __$$CategoryImplCopyWithImpl(
      _$CategoryImpl _value, $Res Function(_$CategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameCategory = null,
    Object? descriptionCategory = null,
    Object? colorCategory = null,
    Object? iconCategory = null,
    Object? parentId = freezed,
    Object? children = null,
  }) {
    return _then(_$CategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nameCategory: null == nameCategory
          ? _value.nameCategory
          : nameCategory // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionCategory: null == descriptionCategory
          ? _value.descriptionCategory
          : descriptionCategory // ignore: cast_nullable_to_non_nullable
              as String,
      colorCategory: null == colorCategory
          ? _value.colorCategory
          : colorCategory // ignore: cast_nullable_to_non_nullable
              as String,
      iconCategory: null == iconCategory
          ? _value.iconCategory
          : iconCategory // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      children: null == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryImpl implements _Category {
  const _$CategoryImpl(
      {required this.id,
      required this.nameCategory,
      required this.descriptionCategory,
      required this.colorCategory,
      required this.iconCategory,
      required this.parentId,
      required final List<Category> children})
      : _children = children;

  factory _$CategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryImplFromJson(json);

  @override
  final int id;
  @override
  final String nameCategory;
  @override
  final String descriptionCategory;
  @override
  final String colorCategory;
  @override
  final String iconCategory;
  @override
  final int? parentId;
  final List<Category> _children;
  @override
  List<Category> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @override
  String toString() {
    return 'Category(id: $id, nameCategory: $nameCategory, descriptionCategory: $descriptionCategory, colorCategory: $colorCategory, iconCategory: $iconCategory, parentId: $parentId, children: $children)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nameCategory, nameCategory) ||
                other.nameCategory == nameCategory) &&
            (identical(other.descriptionCategory, descriptionCategory) ||
                other.descriptionCategory == descriptionCategory) &&
            (identical(other.colorCategory, colorCategory) ||
                other.colorCategory == colorCategory) &&
            (identical(other.iconCategory, iconCategory) ||
                other.iconCategory == iconCategory) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      nameCategory,
      descriptionCategory,
      colorCategory,
      iconCategory,
      parentId,
      const DeepCollectionEquality().hash(_children));

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      __$$CategoryImplCopyWithImpl<_$CategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryImplToJson(
      this,
    );
  }
}

abstract class _Category implements Category {
  const factory _Category(
      {required final int id,
      required final String nameCategory,
      required final String descriptionCategory,
      required final String colorCategory,
      required final String iconCategory,
      required final int? parentId,
      required final List<Category> children}) = _$CategoryImpl;

  factory _Category.fromJson(Map<String, dynamic> json) =
      _$CategoryImpl.fromJson;

  @override
  int get id;
  @override
  String get nameCategory;
  @override
  String get descriptionCategory;
  @override
  String get colorCategory;
  @override
  String get iconCategory;
  @override
  int? get parentId;
  @override
  List<Category> get children;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Priority _$PriorityFromJson(Map<String, dynamic> json) {
  return _Priority.fromJson(json);
}

/// @nodoc
mixin _$Priority {
  int get id => throw _privateConstructorUsedError;
  String get namePriority => throw _privateConstructorUsedError;
  String get descriptionPriority => throw _privateConstructorUsedError;
  String get colorPriority => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;

  /// Serializes this Priority to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Priority
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PriorityCopyWith<Priority> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriorityCopyWith<$Res> {
  factory $PriorityCopyWith(Priority value, $Res Function(Priority) then) =
      _$PriorityCopyWithImpl<$Res, Priority>;
  @useResult
  $Res call(
      {int id,
      String namePriority,
      String descriptionPriority,
      String colorPriority,
      int level});
}

/// @nodoc
class _$PriorityCopyWithImpl<$Res, $Val extends Priority>
    implements $PriorityCopyWith<$Res> {
  _$PriorityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Priority
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namePriority = null,
    Object? descriptionPriority = null,
    Object? colorPriority = null,
    Object? level = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      namePriority: null == namePriority
          ? _value.namePriority
          : namePriority // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionPriority: null == descriptionPriority
          ? _value.descriptionPriority
          : descriptionPriority // ignore: cast_nullable_to_non_nullable
              as String,
      colorPriority: null == colorPriority
          ? _value.colorPriority
          : colorPriority // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriorityImplCopyWith<$Res>
    implements $PriorityCopyWith<$Res> {
  factory _$$PriorityImplCopyWith(
          _$PriorityImpl value, $Res Function(_$PriorityImpl) then) =
      __$$PriorityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String namePriority,
      String descriptionPriority,
      String colorPriority,
      int level});
}

/// @nodoc
class __$$PriorityImplCopyWithImpl<$Res>
    extends _$PriorityCopyWithImpl<$Res, _$PriorityImpl>
    implements _$$PriorityImplCopyWith<$Res> {
  __$$PriorityImplCopyWithImpl(
      _$PriorityImpl _value, $Res Function(_$PriorityImpl) _then)
      : super(_value, _then);

  /// Create a copy of Priority
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namePriority = null,
    Object? descriptionPriority = null,
    Object? colorPriority = null,
    Object? level = null,
  }) {
    return _then(_$PriorityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      namePriority: null == namePriority
          ? _value.namePriority
          : namePriority // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionPriority: null == descriptionPriority
          ? _value.descriptionPriority
          : descriptionPriority // ignore: cast_nullable_to_non_nullable
              as String,
      colorPriority: null == colorPriority
          ? _value.colorPriority
          : colorPriority // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PriorityImpl implements _Priority {
  const _$PriorityImpl(
      {required this.id,
      required this.namePriority,
      required this.descriptionPriority,
      required this.colorPriority,
      required this.level});

  factory _$PriorityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriorityImplFromJson(json);

  @override
  final int id;
  @override
  final String namePriority;
  @override
  final String descriptionPriority;
  @override
  final String colorPriority;
  @override
  final int level;

  @override
  String toString() {
    return 'Priority(id: $id, namePriority: $namePriority, descriptionPriority: $descriptionPriority, colorPriority: $colorPriority, level: $level)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriorityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.namePriority, namePriority) ||
                other.namePriority == namePriority) &&
            (identical(other.descriptionPriority, descriptionPriority) ||
                other.descriptionPriority == descriptionPriority) &&
            (identical(other.colorPriority, colorPriority) ||
                other.colorPriority == colorPriority) &&
            (identical(other.level, level) || other.level == level));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, namePriority, descriptionPriority, colorPriority, level);

  /// Create a copy of Priority
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PriorityImplCopyWith<_$PriorityImpl> get copyWith =>
      __$$PriorityImplCopyWithImpl<_$PriorityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriorityImplToJson(
      this,
    );
  }
}

abstract class _Priority implements Priority {
  const factory _Priority(
      {required final int id,
      required final String namePriority,
      required final String descriptionPriority,
      required final String colorPriority,
      required final int level}) = _$PriorityImpl;

  factory _Priority.fromJson(Map<String, dynamic> json) =
      _$PriorityImpl.fromJson;

  @override
  int get id;
  @override
  String get namePriority;
  @override
  String get descriptionPriority;
  @override
  String get colorPriority;
  @override
  int get level;

  /// Create a copy of Priority
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PriorityImplCopyWith<_$PriorityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Status _$StatusFromJson(Map<String, dynamic> json) {
  return _Status.fromJson(json);
}

/// @nodoc
mixin _$Status {
  int get id => throw _privateConstructorUsedError;
  String get nameStatus => throw _privateConstructorUsedError;
  String get descriptionStatus => throw _privateConstructorUsedError;
  String get colorStatus => throw _privateConstructorUsedError;
  dynamic get iconStatus => throw _privateConstructorUsedError;

  /// Serializes this Status to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatusCopyWith<Status> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusCopyWith<$Res> {
  factory $StatusCopyWith(Status value, $Res Function(Status) then) =
      _$StatusCopyWithImpl<$Res, Status>;
  @useResult
  $Res call(
      {int id,
      String nameStatus,
      String descriptionStatus,
      String colorStatus,
      dynamic iconStatus});
}

/// @nodoc
class _$StatusCopyWithImpl<$Res, $Val extends Status>
    implements $StatusCopyWith<$Res> {
  _$StatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameStatus = null,
    Object? descriptionStatus = null,
    Object? colorStatus = null,
    Object? iconStatus = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nameStatus: null == nameStatus
          ? _value.nameStatus
          : nameStatus // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionStatus: null == descriptionStatus
          ? _value.descriptionStatus
          : descriptionStatus // ignore: cast_nullable_to_non_nullable
              as String,
      colorStatus: null == colorStatus
          ? _value.colorStatus
          : colorStatus // ignore: cast_nullable_to_non_nullable
              as String,
      iconStatus: freezed == iconStatus
          ? _value.iconStatus
          : iconStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatusImplCopyWith<$Res> implements $StatusCopyWith<$Res> {
  factory _$$StatusImplCopyWith(
          _$StatusImpl value, $Res Function(_$StatusImpl) then) =
      __$$StatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String nameStatus,
      String descriptionStatus,
      String colorStatus,
      dynamic iconStatus});
}

/// @nodoc
class __$$StatusImplCopyWithImpl<$Res>
    extends _$StatusCopyWithImpl<$Res, _$StatusImpl>
    implements _$$StatusImplCopyWith<$Res> {
  __$$StatusImplCopyWithImpl(
      _$StatusImpl _value, $Res Function(_$StatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameStatus = null,
    Object? descriptionStatus = null,
    Object? colorStatus = null,
    Object? iconStatus = freezed,
  }) {
    return _then(_$StatusImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nameStatus: null == nameStatus
          ? _value.nameStatus
          : nameStatus // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionStatus: null == descriptionStatus
          ? _value.descriptionStatus
          : descriptionStatus // ignore: cast_nullable_to_non_nullable
              as String,
      colorStatus: null == colorStatus
          ? _value.colorStatus
          : colorStatus // ignore: cast_nullable_to_non_nullable
              as String,
      iconStatus: freezed == iconStatus
          ? _value.iconStatus
          : iconStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatusImpl implements _Status {
  const _$StatusImpl(
      {required this.id,
      required this.nameStatus,
      required this.descriptionStatus,
      required this.colorStatus,
      required this.iconStatus});

  factory _$StatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatusImplFromJson(json);

  @override
  final int id;
  @override
  final String nameStatus;
  @override
  final String descriptionStatus;
  @override
  final String colorStatus;
  @override
  final dynamic iconStatus;

  @override
  String toString() {
    return 'Status(id: $id, nameStatus: $nameStatus, descriptionStatus: $descriptionStatus, colorStatus: $colorStatus, iconStatus: $iconStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nameStatus, nameStatus) ||
                other.nameStatus == nameStatus) &&
            (identical(other.descriptionStatus, descriptionStatus) ||
                other.descriptionStatus == descriptionStatus) &&
            (identical(other.colorStatus, colorStatus) ||
                other.colorStatus == colorStatus) &&
            const DeepCollectionEquality()
                .equals(other.iconStatus, iconStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      nameStatus,
      descriptionStatus,
      colorStatus,
      const DeepCollectionEquality().hash(iconStatus));

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusImplCopyWith<_$StatusImpl> get copyWith =>
      __$$StatusImplCopyWithImpl<_$StatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatusImplToJson(
      this,
    );
  }
}

abstract class _Status implements Status {
  const factory _Status(
      {required final int id,
      required final String nameStatus,
      required final String descriptionStatus,
      required final String colorStatus,
      required final dynamic iconStatus}) = _$StatusImpl;

  factory _Status.fromJson(Map<String, dynamic> json) = _$StatusImpl.fromJson;

  @override
  int get id;
  @override
  String get nameStatus;
  @override
  String get descriptionStatus;
  @override
  String get colorStatus;
  @override
  dynamic get iconStatus;

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusImplCopyWith<_$StatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Taskperson _$TaskpersonFromJson(Map<String, dynamic> json) {
  return _Taskperson.fromJson(json);
}

/// @nodoc
mixin _$Taskperson {
  int get id => throw _privateConstructorUsedError;
  String get namePerson => throw _privateConstructorUsedError;
  String get imagePerson => throw _privateConstructorUsedError;
  int get rolId => throw _privateConstructorUsedError;
  String get nameRole => throw _privateConstructorUsedError;

  /// Serializes this Taskperson to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Taskperson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskpersonCopyWith<Taskperson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskpersonCopyWith<$Res> {
  factory $TaskpersonCopyWith(
          Taskperson value, $Res Function(Taskperson) then) =
      _$TaskpersonCopyWithImpl<$Res, Taskperson>;
  @useResult
  $Res call(
      {int id,
      String namePerson,
      String imagePerson,
      int rolId,
      String nameRole});
}

/// @nodoc
class _$TaskpersonCopyWithImpl<$Res, $Val extends Taskperson>
    implements $TaskpersonCopyWith<$Res> {
  _$TaskpersonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Taskperson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namePerson = null,
    Object? imagePerson = null,
    Object? rolId = null,
    Object? nameRole = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      namePerson: null == namePerson
          ? _value.namePerson
          : namePerson // ignore: cast_nullable_to_non_nullable
              as String,
      imagePerson: null == imagePerson
          ? _value.imagePerson
          : imagePerson // ignore: cast_nullable_to_non_nullable
              as String,
      rolId: null == rolId
          ? _value.rolId
          : rolId // ignore: cast_nullable_to_non_nullable
              as int,
      nameRole: null == nameRole
          ? _value.nameRole
          : nameRole // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskpersonImplCopyWith<$Res>
    implements $TaskpersonCopyWith<$Res> {
  factory _$$TaskpersonImplCopyWith(
          _$TaskpersonImpl value, $Res Function(_$TaskpersonImpl) then) =
      __$$TaskpersonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String namePerson,
      String imagePerson,
      int rolId,
      String nameRole});
}

/// @nodoc
class __$$TaskpersonImplCopyWithImpl<$Res>
    extends _$TaskpersonCopyWithImpl<$Res, _$TaskpersonImpl>
    implements _$$TaskpersonImplCopyWith<$Res> {
  __$$TaskpersonImplCopyWithImpl(
      _$TaskpersonImpl _value, $Res Function(_$TaskpersonImpl) _then)
      : super(_value, _then);

  /// Create a copy of Taskperson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namePerson = null,
    Object? imagePerson = null,
    Object? rolId = null,
    Object? nameRole = null,
  }) {
    return _then(_$TaskpersonImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      namePerson: null == namePerson
          ? _value.namePerson
          : namePerson // ignore: cast_nullable_to_non_nullable
              as String,
      imagePerson: null == imagePerson
          ? _value.imagePerson
          : imagePerson // ignore: cast_nullable_to_non_nullable
              as String,
      rolId: null == rolId
          ? _value.rolId
          : rolId // ignore: cast_nullable_to_non_nullable
              as int,
      nameRole: null == nameRole
          ? _value.nameRole
          : nameRole // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskpersonImpl implements _Taskperson {
  const _$TaskpersonImpl(
      {required this.id,
      required this.namePerson,
      required this.imagePerson,
      required this.rolId,
      required this.nameRole});

  factory _$TaskpersonImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskpersonImplFromJson(json);

  @override
  final int id;
  @override
  final String namePerson;
  @override
  final String imagePerson;
  @override
  final int rolId;
  @override
  final String nameRole;

  @override
  String toString() {
    return 'Taskperson(id: $id, namePerson: $namePerson, imagePerson: $imagePerson, rolId: $rolId, nameRole: $nameRole)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskpersonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.namePerson, namePerson) ||
                other.namePerson == namePerson) &&
            (identical(other.imagePerson, imagePerson) ||
                other.imagePerson == imagePerson) &&
            (identical(other.rolId, rolId) || other.rolId == rolId) &&
            (identical(other.nameRole, nameRole) ||
                other.nameRole == nameRole));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, namePerson, imagePerson, rolId, nameRole);

  /// Create a copy of Taskperson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskpersonImplCopyWith<_$TaskpersonImpl> get copyWith =>
      __$$TaskpersonImplCopyWithImpl<_$TaskpersonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskpersonImplToJson(
      this,
    );
  }
}

abstract class _Taskperson implements Taskperson {
  const factory _Taskperson(
      {required final int id,
      required final String namePerson,
      required final String imagePerson,
      required final int rolId,
      required final String nameRole}) = _$TaskpersonImpl;

  factory _Taskperson.fromJson(Map<String, dynamic> json) =
      _$TaskpersonImpl.fromJson;

  @override
  int get id;
  @override
  String get namePerson;
  @override
  String get imagePerson;
  @override
  int get rolId;
  @override
  String get nameRole;

  /// Create a copy of Taskperson
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskpersonImplCopyWith<_$TaskpersonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
