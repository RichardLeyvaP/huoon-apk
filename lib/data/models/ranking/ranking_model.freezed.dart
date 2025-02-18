// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ranking_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Ranking _$RankingFromJson(Map<String, dynamic> json) {
  return _Ranking.fromJson(json);
}

/// @nodoc
mixin _$Ranking {
  List<HomePerson>? get homePeople => throw _privateConstructorUsedError;

  /// Serializes this Ranking to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Ranking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RankingCopyWith<Ranking> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RankingCopyWith<$Res> {
  factory $RankingCopyWith(Ranking value, $Res Function(Ranking) then) =
      _$RankingCopyWithImpl<$Res, Ranking>;
  @useResult
  $Res call({List<HomePerson>? homePeople});
}

/// @nodoc
class _$RankingCopyWithImpl<$Res, $Val extends Ranking>
    implements $RankingCopyWith<$Res> {
  _$RankingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Ranking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? homePeople = freezed,
  }) {
    return _then(_value.copyWith(
      homePeople: freezed == homePeople
          ? _value.homePeople
          : homePeople // ignore: cast_nullable_to_non_nullable
              as List<HomePerson>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RankingImplCopyWith<$Res> implements $RankingCopyWith<$Res> {
  factory _$$RankingImplCopyWith(
          _$RankingImpl value, $Res Function(_$RankingImpl) then) =
      __$$RankingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<HomePerson>? homePeople});
}

/// @nodoc
class __$$RankingImplCopyWithImpl<$Res>
    extends _$RankingCopyWithImpl<$Res, _$RankingImpl>
    implements _$$RankingImplCopyWith<$Res> {
  __$$RankingImplCopyWithImpl(
      _$RankingImpl _value, $Res Function(_$RankingImpl) _then)
      : super(_value, _then);

  /// Create a copy of Ranking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? homePeople = freezed,
  }) {
    return _then(_$RankingImpl(
      homePeople: freezed == homePeople
          ? _value._homePeople
          : homePeople // ignore: cast_nullable_to_non_nullable
              as List<HomePerson>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RankingImpl implements _Ranking {
  const _$RankingImpl({final List<HomePerson>? homePeople})
      : _homePeople = homePeople;

  factory _$RankingImpl.fromJson(Map<String, dynamic> json) =>
      _$$RankingImplFromJson(json);

  final List<HomePerson>? _homePeople;
  @override
  List<HomePerson>? get homePeople {
    final value = _homePeople;
    if (value == null) return null;
    if (_homePeople is EqualUnmodifiableListView) return _homePeople;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Ranking(homePeople: $homePeople)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RankingImpl &&
            const DeepCollectionEquality()
                .equals(other._homePeople, _homePeople));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_homePeople));

  /// Create a copy of Ranking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RankingImplCopyWith<_$RankingImpl> get copyWith =>
      __$$RankingImplCopyWithImpl<_$RankingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RankingImplToJson(
      this,
    );
  }
}

abstract class _Ranking implements Ranking {
  const factory _Ranking({final List<HomePerson>? homePeople}) = _$RankingImpl;

  factory _Ranking.fromJson(Map<String, dynamic> json) = _$RankingImpl.fromJson;

  @override
  List<HomePerson>? get homePeople;

  /// Create a copy of Ranking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RankingImplCopyWith<_$RankingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HomePerson _$HomePersonFromJson(Map<String, dynamic> json) {
  return _HomePerson.fromJson(json);
}

/// @nodoc
mixin _$HomePerson {
  int? get id => throw _privateConstructorUsedError;
  int? get homeId => throw _privateConstructorUsedError;
  int? get homePersonHomeId => throw _privateConstructorUsedError;
  int? get personId => throw _privateConstructorUsedError;
  int? get homePersonPersonId => throw _privateConstructorUsedError;
  String? get personName => throw _privateConstructorUsedError;
  int? get roleId => throw _privateConstructorUsedError;
  int? get homePersonRoleId => throw _privateConstructorUsedError;
  String? get roleName => throw _privateConstructorUsedError;
  String? get personImage => throw _privateConstructorUsedError;
  int? get points => throw _privateConstructorUsedError;

  /// Serializes this HomePerson to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HomePerson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomePersonCopyWith<HomePerson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePersonCopyWith<$Res> {
  factory $HomePersonCopyWith(
          HomePerson value, $Res Function(HomePerson) then) =
      _$HomePersonCopyWithImpl<$Res, HomePerson>;
  @useResult
  $Res call(
      {int? id,
      int? homeId,
      int? homePersonHomeId,
      int? personId,
      int? homePersonPersonId,
      String? personName,
      int? roleId,
      int? homePersonRoleId,
      String? roleName,
      String? personImage,
      int? points});
}

/// @nodoc
class _$HomePersonCopyWithImpl<$Res, $Val extends HomePerson>
    implements $HomePersonCopyWith<$Res> {
  _$HomePersonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomePerson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? homeId = freezed,
    Object? homePersonHomeId = freezed,
    Object? personId = freezed,
    Object? homePersonPersonId = freezed,
    Object? personName = freezed,
    Object? roleId = freezed,
    Object? homePersonRoleId = freezed,
    Object? roleName = freezed,
    Object? personImage = freezed,
    Object? points = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      homeId: freezed == homeId
          ? _value.homeId
          : homeId // ignore: cast_nullable_to_non_nullable
              as int?,
      homePersonHomeId: freezed == homePersonHomeId
          ? _value.homePersonHomeId
          : homePersonHomeId // ignore: cast_nullable_to_non_nullable
              as int?,
      personId: freezed == personId
          ? _value.personId
          : personId // ignore: cast_nullable_to_non_nullable
              as int?,
      homePersonPersonId: freezed == homePersonPersonId
          ? _value.homePersonPersonId
          : homePersonPersonId // ignore: cast_nullable_to_non_nullable
              as int?,
      personName: freezed == personName
          ? _value.personName
          : personName // ignore: cast_nullable_to_non_nullable
              as String?,
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int?,
      homePersonRoleId: freezed == homePersonRoleId
          ? _value.homePersonRoleId
          : homePersonRoleId // ignore: cast_nullable_to_non_nullable
              as int?,
      roleName: freezed == roleName
          ? _value.roleName
          : roleName // ignore: cast_nullable_to_non_nullable
              as String?,
      personImage: freezed == personImage
          ? _value.personImage
          : personImage // ignore: cast_nullable_to_non_nullable
              as String?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomePersonImplCopyWith<$Res>
    implements $HomePersonCopyWith<$Res> {
  factory _$$HomePersonImplCopyWith(
          _$HomePersonImpl value, $Res Function(_$HomePersonImpl) then) =
      __$$HomePersonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? homeId,
      int? homePersonHomeId,
      int? personId,
      int? homePersonPersonId,
      String? personName,
      int? roleId,
      int? homePersonRoleId,
      String? roleName,
      String? personImage,
      int? points});
}

/// @nodoc
class __$$HomePersonImplCopyWithImpl<$Res>
    extends _$HomePersonCopyWithImpl<$Res, _$HomePersonImpl>
    implements _$$HomePersonImplCopyWith<$Res> {
  __$$HomePersonImplCopyWithImpl(
      _$HomePersonImpl _value, $Res Function(_$HomePersonImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomePerson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? homeId = freezed,
    Object? homePersonHomeId = freezed,
    Object? personId = freezed,
    Object? homePersonPersonId = freezed,
    Object? personName = freezed,
    Object? roleId = freezed,
    Object? homePersonRoleId = freezed,
    Object? roleName = freezed,
    Object? personImage = freezed,
    Object? points = freezed,
  }) {
    return _then(_$HomePersonImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      homeId: freezed == homeId
          ? _value.homeId
          : homeId // ignore: cast_nullable_to_non_nullable
              as int?,
      homePersonHomeId: freezed == homePersonHomeId
          ? _value.homePersonHomeId
          : homePersonHomeId // ignore: cast_nullable_to_non_nullable
              as int?,
      personId: freezed == personId
          ? _value.personId
          : personId // ignore: cast_nullable_to_non_nullable
              as int?,
      homePersonPersonId: freezed == homePersonPersonId
          ? _value.homePersonPersonId
          : homePersonPersonId // ignore: cast_nullable_to_non_nullable
              as int?,
      personName: freezed == personName
          ? _value.personName
          : personName // ignore: cast_nullable_to_non_nullable
              as String?,
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int?,
      homePersonRoleId: freezed == homePersonRoleId
          ? _value.homePersonRoleId
          : homePersonRoleId // ignore: cast_nullable_to_non_nullable
              as int?,
      roleName: freezed == roleName
          ? _value.roleName
          : roleName // ignore: cast_nullable_to_non_nullable
              as String?,
      personImage: freezed == personImage
          ? _value.personImage
          : personImage // ignore: cast_nullable_to_non_nullable
              as String?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomePersonImpl implements _HomePerson {
  const _$HomePersonImpl(
      {this.id,
      this.homeId,
      this.homePersonHomeId,
      this.personId,
      this.homePersonPersonId,
      this.personName,
      this.roleId,
      this.homePersonRoleId,
      this.roleName,
      this.personImage,
      this.points});

  factory _$HomePersonImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomePersonImplFromJson(json);

  @override
  final int? id;
  @override
  final int? homeId;
  @override
  final int? homePersonHomeId;
  @override
  final int? personId;
  @override
  final int? homePersonPersonId;
  @override
  final String? personName;
  @override
  final int? roleId;
  @override
  final int? homePersonRoleId;
  @override
  final String? roleName;
  @override
  final String? personImage;
  @override
  final int? points;

  @override
  String toString() {
    return 'HomePerson(id: $id, homeId: $homeId, homePersonHomeId: $homePersonHomeId, personId: $personId, homePersonPersonId: $homePersonPersonId, personName: $personName, roleId: $roleId, homePersonRoleId: $homePersonRoleId, roleName: $roleName, personImage: $personImage, points: $points)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomePersonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.homeId, homeId) || other.homeId == homeId) &&
            (identical(other.homePersonHomeId, homePersonHomeId) ||
                other.homePersonHomeId == homePersonHomeId) &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.homePersonPersonId, homePersonPersonId) ||
                other.homePersonPersonId == homePersonPersonId) &&
            (identical(other.personName, personName) ||
                other.personName == personName) &&
            (identical(other.roleId, roleId) || other.roleId == roleId) &&
            (identical(other.homePersonRoleId, homePersonRoleId) ||
                other.homePersonRoleId == homePersonRoleId) &&
            (identical(other.roleName, roleName) ||
                other.roleName == roleName) &&
            (identical(other.personImage, personImage) ||
                other.personImage == personImage) &&
            (identical(other.points, points) || other.points == points));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      homeId,
      homePersonHomeId,
      personId,
      homePersonPersonId,
      personName,
      roleId,
      homePersonRoleId,
      roleName,
      personImage,
      points);

  /// Create a copy of HomePerson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomePersonImplCopyWith<_$HomePersonImpl> get copyWith =>
      __$$HomePersonImplCopyWithImpl<_$HomePersonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomePersonImplToJson(
      this,
    );
  }
}

abstract class _HomePerson implements HomePerson {
  const factory _HomePerson(
      {final int? id,
      final int? homeId,
      final int? homePersonHomeId,
      final int? personId,
      final int? homePersonPersonId,
      final String? personName,
      final int? roleId,
      final int? homePersonRoleId,
      final String? roleName,
      final String? personImage,
      final int? points}) = _$HomePersonImpl;

  factory _HomePerson.fromJson(Map<String, dynamic> json) =
      _$HomePersonImpl.fromJson;

  @override
  int? get id;
  @override
  int? get homeId;
  @override
  int? get homePersonHomeId;
  @override
  int? get personId;
  @override
  int? get homePersonPersonId;
  @override
  String? get personName;
  @override
  int? get roleId;
  @override
  int? get homePersonRoleId;
  @override
  String? get roleName;
  @override
  String? get personImage;
  @override
  int? get points;

  /// Create a copy of HomePerson
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomePersonImplCopyWith<_$HomePersonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
