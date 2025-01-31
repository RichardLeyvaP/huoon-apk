// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'homeHouse_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HomeHouse _$HomeHouseFromJson(Map<String, dynamic> json) {
  return _HomeHouse.fromJson(json);
}

/// @nodoc
mixin _$HomeHouse {
  String? get name => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  int? get homeTypeId => throw _privateConstructorUsedError;
  int? get residents => throw _privateConstructorUsedError;
  String? get geoLocation => throw _privateConstructorUsedError;
  String? get timezone => throw _privateConstructorUsedError;
  int? get statusId => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  List<Person>? get people => throw _privateConstructorUsedError;

  /// Serializes this HomeHouse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HomeHouse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeHouseCopyWith<HomeHouse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeHouseCopyWith<$Res> {
  factory $HomeHouseCopyWith(HomeHouse value, $Res Function(HomeHouse) then) =
      _$HomeHouseCopyWithImpl<$Res, HomeHouse>;
  @useResult
  $Res call(
      {String? name,
      String? address,
      int? homeTypeId,
      int? residents,
      String? geoLocation,
      String? timezone,
      int? statusId,
      String? image,
      List<Person>? people});
}

/// @nodoc
class _$HomeHouseCopyWithImpl<$Res, $Val extends HomeHouse>
    implements $HomeHouseCopyWith<$Res> {
  _$HomeHouseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeHouse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? address = freezed,
    Object? homeTypeId = freezed,
    Object? residents = freezed,
    Object? geoLocation = freezed,
    Object? timezone = freezed,
    Object? statusId = freezed,
    Object? image = freezed,
    Object? people = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      homeTypeId: freezed == homeTypeId
          ? _value.homeTypeId
          : homeTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      residents: freezed == residents
          ? _value.residents
          : residents // ignore: cast_nullable_to_non_nullable
              as int?,
      geoLocation: freezed == geoLocation
          ? _value.geoLocation
          : geoLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      statusId: freezed == statusId
          ? _value.statusId
          : statusId // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      people: freezed == people
          ? _value.people
          : people // ignore: cast_nullable_to_non_nullable
              as List<Person>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeHouseImplCopyWith<$Res>
    implements $HomeHouseCopyWith<$Res> {
  factory _$$HomeHouseImplCopyWith(
          _$HomeHouseImpl value, $Res Function(_$HomeHouseImpl) then) =
      __$$HomeHouseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? address,
      int? homeTypeId,
      int? residents,
      String? geoLocation,
      String? timezone,
      int? statusId,
      String? image,
      List<Person>? people});
}

/// @nodoc
class __$$HomeHouseImplCopyWithImpl<$Res>
    extends _$HomeHouseCopyWithImpl<$Res, _$HomeHouseImpl>
    implements _$$HomeHouseImplCopyWith<$Res> {
  __$$HomeHouseImplCopyWithImpl(
      _$HomeHouseImpl _value, $Res Function(_$HomeHouseImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeHouse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? address = freezed,
    Object? homeTypeId = freezed,
    Object? residents = freezed,
    Object? geoLocation = freezed,
    Object? timezone = freezed,
    Object? statusId = freezed,
    Object? image = freezed,
    Object? people = freezed,
  }) {
    return _then(_$HomeHouseImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      homeTypeId: freezed == homeTypeId
          ? _value.homeTypeId
          : homeTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      residents: freezed == residents
          ? _value.residents
          : residents // ignore: cast_nullable_to_non_nullable
              as int?,
      geoLocation: freezed == geoLocation
          ? _value.geoLocation
          : geoLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      statusId: freezed == statusId
          ? _value.statusId
          : statusId // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      people: freezed == people
          ? _value._people
          : people // ignore: cast_nullable_to_non_nullable
              as List<Person>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeHouseImpl implements _HomeHouse {
  const _$HomeHouseImpl(
      {this.name,
      this.address,
      this.homeTypeId,
      this.residents,
      this.geoLocation,
      this.timezone,
      this.statusId,
      this.image,
      final List<Person>? people})
      : _people = people;

  factory _$HomeHouseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeHouseImplFromJson(json);

  @override
  final String? name;
  @override
  final String? address;
  @override
  final int? homeTypeId;
  @override
  final int? residents;
  @override
  final String? geoLocation;
  @override
  final String? timezone;
  @override
  final int? statusId;
  @override
  final String? image;
  final List<Person>? _people;
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
    return 'HomeHouse(name: $name, address: $address, homeTypeId: $homeTypeId, residents: $residents, geoLocation: $geoLocation, timezone: $timezone, statusId: $statusId, image: $image, people: $people)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeHouseImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.homeTypeId, homeTypeId) ||
                other.homeTypeId == homeTypeId) &&
            (identical(other.residents, residents) ||
                other.residents == residents) &&
            (identical(other.geoLocation, geoLocation) ||
                other.geoLocation == geoLocation) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.statusId, statusId) ||
                other.statusId == statusId) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._people, _people));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      address,
      homeTypeId,
      residents,
      geoLocation,
      timezone,
      statusId,
      image,
      const DeepCollectionEquality().hash(_people));

  /// Create a copy of HomeHouse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeHouseImplCopyWith<_$HomeHouseImpl> get copyWith =>
      __$$HomeHouseImplCopyWithImpl<_$HomeHouseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeHouseImplToJson(
      this,
    );
  }
}

abstract class _HomeHouse implements HomeHouse {
  const factory _HomeHouse(
      {final String? name,
      final String? address,
      final int? homeTypeId,
      final int? residents,
      final String? geoLocation,
      final String? timezone,
      final int? statusId,
      final String? image,
      final List<Person>? people}) = _$HomeHouseImpl;

  factory _HomeHouse.fromJson(Map<String, dynamic> json) =
      _$HomeHouseImpl.fromJson;

  @override
  String? get name;
  @override
  String? get address;
  @override
  int? get homeTypeId;
  @override
  int? get residents;
  @override
  String? get geoLocation;
  @override
  String? get timezone;
  @override
  int? get statusId;
  @override
  String? get image;
  @override
  List<Person>? get people;

  /// Create a copy of HomeHouse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeHouseImplCopyWith<_$HomeHouseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Person _$PersonFromJson(Map<String, dynamic> json) {
  return _Person.fromJson(json);
}

/// @nodoc
mixin _$Person {
  int? get personId => throw _privateConstructorUsedError;
  int? get roleId => throw _privateConstructorUsedError;

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
  $Res call({int? personId, int? roleId});
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
    Object? personId = freezed,
    Object? roleId = freezed,
  }) {
    return _then(_value.copyWith(
      personId: freezed == personId
          ? _value.personId
          : personId // ignore: cast_nullable_to_non_nullable
              as int?,
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int?,
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
  $Res call({int? personId, int? roleId});
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
    Object? personId = freezed,
    Object? roleId = freezed,
  }) {
    return _then(_$PersonImpl(
      personId: freezed == personId
          ? _value.personId
          : personId // ignore: cast_nullable_to_non_nullable
              as int?,
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonImpl implements _Person {
  const _$PersonImpl({this.personId, this.roleId});

  factory _$PersonImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonImplFromJson(json);

  @override
  final int? personId;
  @override
  final int? roleId;

  @override
  String toString() {
    return 'Person(personId: $personId, roleId: $roleId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonImpl &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.roleId, roleId) || other.roleId == roleId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, personId, roleId);

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
  const factory _Person({final int? personId, final int? roleId}) =
      _$PersonImpl;

  factory _Person.fromJson(Map<String, dynamic> json) = _$PersonImpl.fromJson;

  @override
  int? get personId;
  @override
  int? get roleId;

  /// Create a copy of Person
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonImplCopyWith<_$PersonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
