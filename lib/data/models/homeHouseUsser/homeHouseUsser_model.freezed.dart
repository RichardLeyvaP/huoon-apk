// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'homeHouseUsser_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HomeHouseUsser _$HomeHouseUsserFromJson(Map<String, dynamic> json) {
  return _HomeHouseUsser.fromJson(json);
}

/// @nodoc
mixin _$HomeHouseUsser {
  List<Home>? get homes => throw _privateConstructorUsedError;

  /// Serializes this HomeHouseUsser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HomeHouseUsser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeHouseUsserCopyWith<HomeHouseUsser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeHouseUsserCopyWith<$Res> {
  factory $HomeHouseUsserCopyWith(
          HomeHouseUsser value, $Res Function(HomeHouseUsser) then) =
      _$HomeHouseUsserCopyWithImpl<$Res, HomeHouseUsser>;
  @useResult
  $Res call({List<Home>? homes});
}

/// @nodoc
class _$HomeHouseUsserCopyWithImpl<$Res, $Val extends HomeHouseUsser>
    implements $HomeHouseUsserCopyWith<$Res> {
  _$HomeHouseUsserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeHouseUsser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? homes = freezed,
  }) {
    return _then(_value.copyWith(
      homes: freezed == homes
          ? _value.homes
          : homes // ignore: cast_nullable_to_non_nullable
              as List<Home>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeHouseUsserImplCopyWith<$Res>
    implements $HomeHouseUsserCopyWith<$Res> {
  factory _$$HomeHouseUsserImplCopyWith(_$HomeHouseUsserImpl value,
          $Res Function(_$HomeHouseUsserImpl) then) =
      __$$HomeHouseUsserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Home>? homes});
}

/// @nodoc
class __$$HomeHouseUsserImplCopyWithImpl<$Res>
    extends _$HomeHouseUsserCopyWithImpl<$Res, _$HomeHouseUsserImpl>
    implements _$$HomeHouseUsserImplCopyWith<$Res> {
  __$$HomeHouseUsserImplCopyWithImpl(
      _$HomeHouseUsserImpl _value, $Res Function(_$HomeHouseUsserImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeHouseUsser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? homes = freezed,
  }) {
    return _then(_$HomeHouseUsserImpl(
      homes: freezed == homes
          ? _value._homes
          : homes // ignore: cast_nullable_to_non_nullable
              as List<Home>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeHouseUsserImpl implements _HomeHouseUsser {
  const _$HomeHouseUsserImpl({final List<Home>? homes}) : _homes = homes;

  factory _$HomeHouseUsserImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeHouseUsserImplFromJson(json);

  final List<Home>? _homes;
  @override
  List<Home>? get homes {
    final value = _homes;
    if (value == null) return null;
    if (_homes is EqualUnmodifiableListView) return _homes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HomeHouseUsser(homes: $homes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeHouseUsserImpl &&
            const DeepCollectionEquality().equals(other._homes, _homes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_homes));

  /// Create a copy of HomeHouseUsser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeHouseUsserImplCopyWith<_$HomeHouseUsserImpl> get copyWith =>
      __$$HomeHouseUsserImplCopyWithImpl<_$HomeHouseUsserImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeHouseUsserImplToJson(
      this,
    );
  }
}

abstract class _HomeHouseUsser implements HomeHouseUsser {
  const factory _HomeHouseUsser({final List<Home>? homes}) =
      _$HomeHouseUsserImpl;

  factory _HomeHouseUsser.fromJson(Map<String, dynamic> json) =
      _$HomeHouseUsserImpl.fromJson;

  @override
  List<Home>? get homes;

  /// Create a copy of HomeHouseUsser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeHouseUsserImplCopyWith<_$HomeHouseUsserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Home _$HomeFromJson(Map<String, dynamic> json) {
  return _Home.fromJson(json);
}

/// @nodoc
mixin _$Home {
  int? get id => throw _privateConstructorUsedError;
  int? get statusId => throw _privateConstructorUsedError;
  int? get homeStatusId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  int? get homeTypeId => throw _privateConstructorUsedError;
  int? get homeHomeTypeId => throw _privateConstructorUsedError;
  String? get nameHomeType => throw _privateConstructorUsedError;
  int? get residents => throw _privateConstructorUsedError;
  String? get geoLocation => throw _privateConstructorUsedError;
  String? get homeGeoLocation => throw _privateConstructorUsedError;
  String? get timezone => throw _privateConstructorUsedError;
  String? get nameStatus => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  List<PersonHomeUsser>? get people => throw _privateConstructorUsedError;

  /// Serializes this Home to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Home
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeCopyWith<Home> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeCopyWith<$Res> {
  factory $HomeCopyWith(Home value, $Res Function(Home) then) =
      _$HomeCopyWithImpl<$Res, Home>;
  @useResult
  $Res call(
      {int? id,
      int? statusId,
      int? homeStatusId,
      String? name,
      String? address,
      int? homeTypeId,
      int? homeHomeTypeId,
      String? nameHomeType,
      int? residents,
      String? geoLocation,
      String? homeGeoLocation,
      String? timezone,
      String? nameStatus,
      String? image,
      List<PersonHomeUsser>? people});
}

/// @nodoc
class _$HomeCopyWithImpl<$Res, $Val extends Home>
    implements $HomeCopyWith<$Res> {
  _$HomeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Home
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? statusId = freezed,
    Object? homeStatusId = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? homeTypeId = freezed,
    Object? homeHomeTypeId = freezed,
    Object? nameHomeType = freezed,
    Object? residents = freezed,
    Object? geoLocation = freezed,
    Object? homeGeoLocation = freezed,
    Object? timezone = freezed,
    Object? nameStatus = freezed,
    Object? image = freezed,
    Object? people = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      statusId: freezed == statusId
          ? _value.statusId
          : statusId // ignore: cast_nullable_to_non_nullable
              as int?,
      homeStatusId: freezed == homeStatusId
          ? _value.homeStatusId
          : homeStatusId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      homeHomeTypeId: freezed == homeHomeTypeId
          ? _value.homeHomeTypeId
          : homeHomeTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      nameHomeType: freezed == nameHomeType
          ? _value.nameHomeType
          : nameHomeType // ignore: cast_nullable_to_non_nullable
              as String?,
      residents: freezed == residents
          ? _value.residents
          : residents // ignore: cast_nullable_to_non_nullable
              as int?,
      geoLocation: freezed == geoLocation
          ? _value.geoLocation
          : geoLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      homeGeoLocation: freezed == homeGeoLocation
          ? _value.homeGeoLocation
          : homeGeoLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      nameStatus: freezed == nameStatus
          ? _value.nameStatus
          : nameStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      people: freezed == people
          ? _value.people
          : people // ignore: cast_nullable_to_non_nullable
              as List<PersonHomeUsser>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeImplCopyWith<$Res> implements $HomeCopyWith<$Res> {
  factory _$$HomeImplCopyWith(
          _$HomeImpl value, $Res Function(_$HomeImpl) then) =
      __$$HomeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? statusId,
      int? homeStatusId,
      String? name,
      String? address,
      int? homeTypeId,
      int? homeHomeTypeId,
      String? nameHomeType,
      int? residents,
      String? geoLocation,
      String? homeGeoLocation,
      String? timezone,
      String? nameStatus,
      String? image,
      List<PersonHomeUsser>? people});
}

/// @nodoc
class __$$HomeImplCopyWithImpl<$Res>
    extends _$HomeCopyWithImpl<$Res, _$HomeImpl>
    implements _$$HomeImplCopyWith<$Res> {
  __$$HomeImplCopyWithImpl(_$HomeImpl _value, $Res Function(_$HomeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Home
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? statusId = freezed,
    Object? homeStatusId = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? homeTypeId = freezed,
    Object? homeHomeTypeId = freezed,
    Object? nameHomeType = freezed,
    Object? residents = freezed,
    Object? geoLocation = freezed,
    Object? homeGeoLocation = freezed,
    Object? timezone = freezed,
    Object? nameStatus = freezed,
    Object? image = freezed,
    Object? people = freezed,
  }) {
    return _then(_$HomeImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      statusId: freezed == statusId
          ? _value.statusId
          : statusId // ignore: cast_nullable_to_non_nullable
              as int?,
      homeStatusId: freezed == homeStatusId
          ? _value.homeStatusId
          : homeStatusId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      homeHomeTypeId: freezed == homeHomeTypeId
          ? _value.homeHomeTypeId
          : homeHomeTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      nameHomeType: freezed == nameHomeType
          ? _value.nameHomeType
          : nameHomeType // ignore: cast_nullable_to_non_nullable
              as String?,
      residents: freezed == residents
          ? _value.residents
          : residents // ignore: cast_nullable_to_non_nullable
              as int?,
      geoLocation: freezed == geoLocation
          ? _value.geoLocation
          : geoLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      homeGeoLocation: freezed == homeGeoLocation
          ? _value.homeGeoLocation
          : homeGeoLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      nameStatus: freezed == nameStatus
          ? _value.nameStatus
          : nameStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      people: freezed == people
          ? _value._people
          : people // ignore: cast_nullable_to_non_nullable
              as List<PersonHomeUsser>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeImpl implements _Home {
  const _$HomeImpl(
      {this.id,
      this.statusId,
      this.homeStatusId,
      this.name,
      this.address,
      this.homeTypeId,
      this.homeHomeTypeId,
      this.nameHomeType,
      this.residents,
      this.geoLocation,
      this.homeGeoLocation,
      this.timezone,
      this.nameStatus,
      this.image,
      final List<PersonHomeUsser>? people})
      : _people = people;

  factory _$HomeImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeImplFromJson(json);

  @override
  final int? id;
  @override
  final int? statusId;
  @override
  final int? homeStatusId;
  @override
  final String? name;
  @override
  final String? address;
  @override
  final int? homeTypeId;
  @override
  final int? homeHomeTypeId;
  @override
  final String? nameHomeType;
  @override
  final int? residents;
  @override
  final String? geoLocation;
  @override
  final String? homeGeoLocation;
  @override
  final String? timezone;
  @override
  final String? nameStatus;
  @override
  final String? image;
  final List<PersonHomeUsser>? _people;
  @override
  List<PersonHomeUsser>? get people {
    final value = _people;
    if (value == null) return null;
    if (_people is EqualUnmodifiableListView) return _people;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Home(id: $id, statusId: $statusId, homeStatusId: $homeStatusId, name: $name, address: $address, homeTypeId: $homeTypeId, homeHomeTypeId: $homeHomeTypeId, nameHomeType: $nameHomeType, residents: $residents, geoLocation: $geoLocation, homeGeoLocation: $homeGeoLocation, timezone: $timezone, nameStatus: $nameStatus, image: $image, people: $people)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.statusId, statusId) ||
                other.statusId == statusId) &&
            (identical(other.homeStatusId, homeStatusId) ||
                other.homeStatusId == homeStatusId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.homeTypeId, homeTypeId) ||
                other.homeTypeId == homeTypeId) &&
            (identical(other.homeHomeTypeId, homeHomeTypeId) ||
                other.homeHomeTypeId == homeHomeTypeId) &&
            (identical(other.nameHomeType, nameHomeType) ||
                other.nameHomeType == nameHomeType) &&
            (identical(other.residents, residents) ||
                other.residents == residents) &&
            (identical(other.geoLocation, geoLocation) ||
                other.geoLocation == geoLocation) &&
            (identical(other.homeGeoLocation, homeGeoLocation) ||
                other.homeGeoLocation == homeGeoLocation) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.nameStatus, nameStatus) ||
                other.nameStatus == nameStatus) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._people, _people));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      statusId,
      homeStatusId,
      name,
      address,
      homeTypeId,
      homeHomeTypeId,
      nameHomeType,
      residents,
      geoLocation,
      homeGeoLocation,
      timezone,
      nameStatus,
      image,
      const DeepCollectionEquality().hash(_people));

  /// Create a copy of Home
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeImplCopyWith<_$HomeImpl> get copyWith =>
      __$$HomeImplCopyWithImpl<_$HomeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeImplToJson(
      this,
    );
  }
}

abstract class _Home implements Home {
  const factory _Home(
      {final int? id,
      final int? statusId,
      final int? homeStatusId,
      final String? name,
      final String? address,
      final int? homeTypeId,
      final int? homeHomeTypeId,
      final String? nameHomeType,
      final int? residents,
      final String? geoLocation,
      final String? homeGeoLocation,
      final String? timezone,
      final String? nameStatus,
      final String? image,
      final List<PersonHomeUsser>? people}) = _$HomeImpl;

  factory _Home.fromJson(Map<String, dynamic> json) = _$HomeImpl.fromJson;

  @override
  int? get id;
  @override
  int? get statusId;
  @override
  int? get homeStatusId;
  @override
  String? get name;
  @override
  String? get address;
  @override
  int? get homeTypeId;
  @override
  int? get homeHomeTypeId;
  @override
  String? get nameHomeType;
  @override
  int? get residents;
  @override
  String? get geoLocation;
  @override
  String? get homeGeoLocation;
  @override
  String? get timezone;
  @override
  String? get nameStatus;
  @override
  String? get image;
  @override
  List<PersonHomeUsser>? get people;

  /// Create a copy of Home
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeImplCopyWith<_$HomeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PersonHomeUsser _$PersonHomeUsserFromJson(Map<String, dynamic> json) {
  return _PersonHomeUsser.fromJson(json);
}

/// @nodoc
mixin _$PersonHomeUsser {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  int? get roleId => throw _privateConstructorUsedError;
  int? get personRoleId => throw _privateConstructorUsedError;
  String? get roleName => throw _privateConstructorUsedError;

  /// Serializes this PersonHomeUsser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PersonHomeUsser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonHomeUsserCopyWith<PersonHomeUsser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonHomeUsserCopyWith<$Res> {
  factory $PersonHomeUsserCopyWith(
          PersonHomeUsser value, $Res Function(PersonHomeUsser) then) =
      _$PersonHomeUsserCopyWithImpl<$Res, PersonHomeUsser>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? image,
      int? roleId,
      int? personRoleId,
      String? roleName});
}

/// @nodoc
class _$PersonHomeUsserCopyWithImpl<$Res, $Val extends PersonHomeUsser>
    implements $PersonHomeUsserCopyWith<$Res> {
  _$PersonHomeUsserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PersonHomeUsser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? roleId = freezed,
    Object? personRoleId = freezed,
    Object? roleName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int?,
      personRoleId: freezed == personRoleId
          ? _value.personRoleId
          : personRoleId // ignore: cast_nullable_to_non_nullable
              as int?,
      roleName: freezed == roleName
          ? _value.roleName
          : roleName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonHomeUsserImplCopyWith<$Res>
    implements $PersonHomeUsserCopyWith<$Res> {
  factory _$$PersonHomeUsserImplCopyWith(_$PersonHomeUsserImpl value,
          $Res Function(_$PersonHomeUsserImpl) then) =
      __$$PersonHomeUsserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? image,
      int? roleId,
      int? personRoleId,
      String? roleName});
}

/// @nodoc
class __$$PersonHomeUsserImplCopyWithImpl<$Res>
    extends _$PersonHomeUsserCopyWithImpl<$Res, _$PersonHomeUsserImpl>
    implements _$$PersonHomeUsserImplCopyWith<$Res> {
  __$$PersonHomeUsserImplCopyWithImpl(
      _$PersonHomeUsserImpl _value, $Res Function(_$PersonHomeUsserImpl) _then)
      : super(_value, _then);

  /// Create a copy of PersonHomeUsser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? roleId = freezed,
    Object? personRoleId = freezed,
    Object? roleName = freezed,
  }) {
    return _then(_$PersonHomeUsserImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int?,
      personRoleId: freezed == personRoleId
          ? _value.personRoleId
          : personRoleId // ignore: cast_nullable_to_non_nullable
              as int?,
      roleName: freezed == roleName
          ? _value.roleName
          : roleName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonHomeUsserImpl implements _PersonHomeUsser {
  const _$PersonHomeUsserImpl(
      {this.id,
      this.name,
      this.image,
      this.roleId,
      this.personRoleId,
      this.roleName});

  factory _$PersonHomeUsserImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonHomeUsserImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? image;
  @override
  final int? roleId;
  @override
  final int? personRoleId;
  @override
  final String? roleName;

  @override
  String toString() {
    return 'PersonHomeUsser(id: $id, name: $name, image: $image, roleId: $roleId, personRoleId: $personRoleId, roleName: $roleName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonHomeUsserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.roleId, roleId) || other.roleId == roleId) &&
            (identical(other.personRoleId, personRoleId) ||
                other.personRoleId == personRoleId) &&
            (identical(other.roleName, roleName) ||
                other.roleName == roleName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, image, roleId, personRoleId, roleName);

  /// Create a copy of PersonHomeUsser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonHomeUsserImplCopyWith<_$PersonHomeUsserImpl> get copyWith =>
      __$$PersonHomeUsserImplCopyWithImpl<_$PersonHomeUsserImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonHomeUsserImplToJson(
      this,
    );
  }
}

abstract class _PersonHomeUsser implements PersonHomeUsser {
  const factory _PersonHomeUsser(
      {final int? id,
      final String? name,
      final String? image,
      final int? roleId,
      final int? personRoleId,
      final String? roleName}) = _$PersonHomeUsserImpl;

  factory _PersonHomeUsser.fromJson(Map<String, dynamic> json) =
      _$PersonHomeUsserImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get image;
  @override
  int? get roleId;
  @override
  int? get personRoleId;
  @override
  String? get roleName;

  /// Create a copy of PersonHomeUsser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonHomeUsserImplCopyWith<_$PersonHomeUsserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
