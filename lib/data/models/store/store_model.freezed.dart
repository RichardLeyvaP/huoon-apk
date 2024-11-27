// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Store _$StoreFromJson(Map<String, dynamic> json) {
  return _Store.fromJson(json);
}

/// @nodoc
mixin _$Store {
  List<StoreElement> get store => throw _privateConstructorUsedError;

  /// Serializes this Store to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Store
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoreCopyWith<Store> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreCopyWith<$Res> {
  factory $StoreCopyWith(Store value, $Res Function(Store) then) =
      _$StoreCopyWithImpl<$Res, Store>;
  @useResult
  $Res call({List<StoreElement> store});
}

/// @nodoc
class _$StoreCopyWithImpl<$Res, $Val extends Store>
    implements $StoreCopyWith<$Res> {
  _$StoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Store
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? store = null,
  }) {
    return _then(_value.copyWith(
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as List<StoreElement>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoreImplCopyWith<$Res> implements $StoreCopyWith<$Res> {
  factory _$$StoreImplCopyWith(
          _$StoreImpl value, $Res Function(_$StoreImpl) then) =
      __$$StoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<StoreElement> store});
}

/// @nodoc
class __$$StoreImplCopyWithImpl<$Res>
    extends _$StoreCopyWithImpl<$Res, _$StoreImpl>
    implements _$$StoreImplCopyWith<$Res> {
  __$$StoreImplCopyWithImpl(
      _$StoreImpl _value, $Res Function(_$StoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of Store
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? store = null,
  }) {
    return _then(_$StoreImpl(
      store: null == store
          ? _value._store
          : store // ignore: cast_nullable_to_non_nullable
              as List<StoreElement>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreImpl implements _Store {
  const _$StoreImpl({required final List<StoreElement> store}) : _store = store;

  factory _$StoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreImplFromJson(json);

  final List<StoreElement> _store;
  @override
  List<StoreElement> get store {
    if (_store is EqualUnmodifiableListView) return _store;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_store);
  }

  @override
  String toString() {
    return 'Store(store: $store)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreImpl &&
            const DeepCollectionEquality().equals(other._store, _store));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_store));

  /// Create a copy of Store
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreImplCopyWith<_$StoreImpl> get copyWith =>
      __$$StoreImplCopyWithImpl<_$StoreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreImplToJson(
      this,
    );
  }
}

abstract class _Store implements Store {
  const factory _Store({required final List<StoreElement> store}) = _$StoreImpl;

  factory _Store.fromJson(Map<String, dynamic> json) = _$StoreImpl.fromJson;

  @override
  List<StoreElement> get store;

  /// Create a copy of Store
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoreImplCopyWith<_$StoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StoreElement _$StoreElementFromJson(Map<String, dynamic> json) {
  return _StoreElement.fromJson(json);
}

/// @nodoc
mixin _$StoreElement {
  int? get id => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;

  /// Serializes this StoreElement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StoreElement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoreElementCopyWith<StoreElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreElementCopyWith<$Res> {
  factory $StoreElementCopyWith(
          StoreElement value, $Res Function(StoreElement) then) =
      _$StoreElementCopyWithImpl<$Res, StoreElement>;
  @useResult
  $Res call(
      {int? id,
      int? status,
      String? title,
      String? description,
      String? location});
}

/// @nodoc
class _$StoreElementCopyWithImpl<$Res, $Val extends StoreElement>
    implements $StoreElementCopyWith<$Res> {
  _$StoreElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoreElement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoreElementImplCopyWith<$Res>
    implements $StoreElementCopyWith<$Res> {
  factory _$$StoreElementImplCopyWith(
          _$StoreElementImpl value, $Res Function(_$StoreElementImpl) then) =
      __$$StoreElementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? status,
      String? title,
      String? description,
      String? location});
}

/// @nodoc
class __$$StoreElementImplCopyWithImpl<$Res>
    extends _$StoreElementCopyWithImpl<$Res, _$StoreElementImpl>
    implements _$$StoreElementImplCopyWith<$Res> {
  __$$StoreElementImplCopyWithImpl(
      _$StoreElementImpl _value, $Res Function(_$StoreElementImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoreElement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? location = freezed,
  }) {
    return _then(_$StoreElementImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreElementImpl implements _StoreElement {
  const _$StoreElementImpl(
      {this.id, this.status, this.title, this.description, this.location});

  factory _$StoreElementImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreElementImplFromJson(json);

  @override
  final int? id;
  @override
  final int? status;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? location;

  @override
  String toString() {
    return 'StoreElement(id: $id, status: $status, title: $title, description: $description, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreElementImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, status, title, description, location);

  /// Create a copy of StoreElement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreElementImplCopyWith<_$StoreElementImpl> get copyWith =>
      __$$StoreElementImplCopyWithImpl<_$StoreElementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreElementImplToJson(
      this,
    );
  }
}

abstract class _StoreElement implements StoreElement {
  const factory _StoreElement(
      {final int? id,
      final int? status,
      final String? title,
      final String? description,
      final String? location}) = _$StoreElementImpl;

  factory _StoreElement.fromJson(Map<String, dynamic> json) =
      _$StoreElementImpl.fromJson;

  @override
  int? get id;
  @override
  int? get status;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get location;

  /// Create a copy of StoreElement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoreElementImplCopyWith<_$StoreElementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
