// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'homeHouseCategory_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HomeHouseCategory _$HomeHouseCategoryFromJson(Map<String, dynamic> json) {
  return _HomeHouseCategory.fromJson(json);
}

/// @nodoc
mixin _$HomeHouseCategory {
  List<Homestatus>? get homestatus => throw _privateConstructorUsedError;
  List<Homerole>? get homeroles => throw _privateConstructorUsedError;
  List<Hometype>? get hometypes => throw _privateConstructorUsedError;
  List<Homeperson>? get homepeople => throw _privateConstructorUsedError;
  List<Homewarehouse>? get homewarehouses => throw _privateConstructorUsedError;

  /// Serializes this HomeHouseCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HomeHouseCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeHouseCategoryCopyWith<HomeHouseCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeHouseCategoryCopyWith<$Res> {
  factory $HomeHouseCategoryCopyWith(
          HomeHouseCategory value, $Res Function(HomeHouseCategory) then) =
      _$HomeHouseCategoryCopyWithImpl<$Res, HomeHouseCategory>;
  @useResult
  $Res call(
      {List<Homestatus>? homestatus,
      List<Homerole>? homeroles,
      List<Hometype>? hometypes,
      List<Homeperson>? homepeople,
      List<Homewarehouse>? homewarehouses});
}

/// @nodoc
class _$HomeHouseCategoryCopyWithImpl<$Res, $Val extends HomeHouseCategory>
    implements $HomeHouseCategoryCopyWith<$Res> {
  _$HomeHouseCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeHouseCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? homestatus = freezed,
    Object? homeroles = freezed,
    Object? hometypes = freezed,
    Object? homepeople = freezed,
    Object? homewarehouses = freezed,
  }) {
    return _then(_value.copyWith(
      homestatus: freezed == homestatus
          ? _value.homestatus
          : homestatus // ignore: cast_nullable_to_non_nullable
              as List<Homestatus>?,
      homeroles: freezed == homeroles
          ? _value.homeroles
          : homeroles // ignore: cast_nullable_to_non_nullable
              as List<Homerole>?,
      hometypes: freezed == hometypes
          ? _value.hometypes
          : hometypes // ignore: cast_nullable_to_non_nullable
              as List<Hometype>?,
      homepeople: freezed == homepeople
          ? _value.homepeople
          : homepeople // ignore: cast_nullable_to_non_nullable
              as List<Homeperson>?,
      homewarehouses: freezed == homewarehouses
          ? _value.homewarehouses
          : homewarehouses // ignore: cast_nullable_to_non_nullable
              as List<Homewarehouse>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeHouseCategoryImplCopyWith<$Res>
    implements $HomeHouseCategoryCopyWith<$Res> {
  factory _$$HomeHouseCategoryImplCopyWith(_$HomeHouseCategoryImpl value,
          $Res Function(_$HomeHouseCategoryImpl) then) =
      __$$HomeHouseCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Homestatus>? homestatus,
      List<Homerole>? homeroles,
      List<Hometype>? hometypes,
      List<Homeperson>? homepeople,
      List<Homewarehouse>? homewarehouses});
}

/// @nodoc
class __$$HomeHouseCategoryImplCopyWithImpl<$Res>
    extends _$HomeHouseCategoryCopyWithImpl<$Res, _$HomeHouseCategoryImpl>
    implements _$$HomeHouseCategoryImplCopyWith<$Res> {
  __$$HomeHouseCategoryImplCopyWithImpl(_$HomeHouseCategoryImpl _value,
      $Res Function(_$HomeHouseCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeHouseCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? homestatus = freezed,
    Object? homeroles = freezed,
    Object? hometypes = freezed,
    Object? homepeople = freezed,
    Object? homewarehouses = freezed,
  }) {
    return _then(_$HomeHouseCategoryImpl(
      homestatus: freezed == homestatus
          ? _value._homestatus
          : homestatus // ignore: cast_nullable_to_non_nullable
              as List<Homestatus>?,
      homeroles: freezed == homeroles
          ? _value._homeroles
          : homeroles // ignore: cast_nullable_to_non_nullable
              as List<Homerole>?,
      hometypes: freezed == hometypes
          ? _value._hometypes
          : hometypes // ignore: cast_nullable_to_non_nullable
              as List<Hometype>?,
      homepeople: freezed == homepeople
          ? _value._homepeople
          : homepeople // ignore: cast_nullable_to_non_nullable
              as List<Homeperson>?,
      homewarehouses: freezed == homewarehouses
          ? _value._homewarehouses
          : homewarehouses // ignore: cast_nullable_to_non_nullable
              as List<Homewarehouse>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeHouseCategoryImpl implements _HomeHouseCategory {
  const _$HomeHouseCategoryImpl(
      {final List<Homestatus>? homestatus,
      final List<Homerole>? homeroles,
      final List<Hometype>? hometypes,
      final List<Homeperson>? homepeople,
      final List<Homewarehouse>? homewarehouses})
      : _homestatus = homestatus,
        _homeroles = homeroles,
        _hometypes = hometypes,
        _homepeople = homepeople,
        _homewarehouses = homewarehouses;

  factory _$HomeHouseCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeHouseCategoryImplFromJson(json);

  final List<Homestatus>? _homestatus;
  @override
  List<Homestatus>? get homestatus {
    final value = _homestatus;
    if (value == null) return null;
    if (_homestatus is EqualUnmodifiableListView) return _homestatus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Homerole>? _homeroles;
  @override
  List<Homerole>? get homeroles {
    final value = _homeroles;
    if (value == null) return null;
    if (_homeroles is EqualUnmodifiableListView) return _homeroles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Hometype>? _hometypes;
  @override
  List<Hometype>? get hometypes {
    final value = _hometypes;
    if (value == null) return null;
    if (_hometypes is EqualUnmodifiableListView) return _hometypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Homeperson>? _homepeople;
  @override
  List<Homeperson>? get homepeople {
    final value = _homepeople;
    if (value == null) return null;
    if (_homepeople is EqualUnmodifiableListView) return _homepeople;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Homewarehouse>? _homewarehouses;
  @override
  List<Homewarehouse>? get homewarehouses {
    final value = _homewarehouses;
    if (value == null) return null;
    if (_homewarehouses is EqualUnmodifiableListView) return _homewarehouses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HomeHouseCategory(homestatus: $homestatus, homeroles: $homeroles, hometypes: $hometypes, homepeople: $homepeople, homewarehouses: $homewarehouses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeHouseCategoryImpl &&
            const DeepCollectionEquality()
                .equals(other._homestatus, _homestatus) &&
            const DeepCollectionEquality()
                .equals(other._homeroles, _homeroles) &&
            const DeepCollectionEquality()
                .equals(other._hometypes, _hometypes) &&
            const DeepCollectionEquality()
                .equals(other._homepeople, _homepeople) &&
            const DeepCollectionEquality()
                .equals(other._homewarehouses, _homewarehouses));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_homestatus),
      const DeepCollectionEquality().hash(_homeroles),
      const DeepCollectionEquality().hash(_hometypes),
      const DeepCollectionEquality().hash(_homepeople),
      const DeepCollectionEquality().hash(_homewarehouses));

  /// Create a copy of HomeHouseCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeHouseCategoryImplCopyWith<_$HomeHouseCategoryImpl> get copyWith =>
      __$$HomeHouseCategoryImplCopyWithImpl<_$HomeHouseCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeHouseCategoryImplToJson(
      this,
    );
  }
}

abstract class _HomeHouseCategory implements HomeHouseCategory {
  const factory _HomeHouseCategory(
      {final List<Homestatus>? homestatus,
      final List<Homerole>? homeroles,
      final List<Hometype>? hometypes,
      final List<Homeperson>? homepeople,
      final List<Homewarehouse>? homewarehouses}) = _$HomeHouseCategoryImpl;

  factory _HomeHouseCategory.fromJson(Map<String, dynamic> json) =
      _$HomeHouseCategoryImpl.fromJson;

  @override
  List<Homestatus>? get homestatus;
  @override
  List<Homerole>? get homeroles;
  @override
  List<Hometype>? get hometypes;
  @override
  List<Homeperson>? get homepeople;
  @override
  List<Homewarehouse>? get homewarehouses;

  /// Create a copy of HomeHouseCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeHouseCategoryImplCopyWith<_$HomeHouseCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Homeperson _$HomepersonFromJson(Map<String, dynamic> json) {
  return _Homeperson.fromJson(json);
}

/// @nodoc
mixin _$Homeperson {
  int? get id => throw _privateConstructorUsedError;
  String? get namePerson => throw _privateConstructorUsedError;
  String? get imagePerson => throw _privateConstructorUsedError;

  /// Serializes this Homeperson to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Homeperson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomepersonCopyWith<Homeperson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomepersonCopyWith<$Res> {
  factory $HomepersonCopyWith(
          Homeperson value, $Res Function(Homeperson) then) =
      _$HomepersonCopyWithImpl<$Res, Homeperson>;
  @useResult
  $Res call({int? id, String? namePerson, String? imagePerson});
}

/// @nodoc
class _$HomepersonCopyWithImpl<$Res, $Val extends Homeperson>
    implements $HomepersonCopyWith<$Res> {
  _$HomepersonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Homeperson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? namePerson = freezed,
    Object? imagePerson = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      namePerson: freezed == namePerson
          ? _value.namePerson
          : namePerson // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePerson: freezed == imagePerson
          ? _value.imagePerson
          : imagePerson // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomepersonImplCopyWith<$Res>
    implements $HomepersonCopyWith<$Res> {
  factory _$$HomepersonImplCopyWith(
          _$HomepersonImpl value, $Res Function(_$HomepersonImpl) then) =
      __$$HomepersonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? namePerson, String? imagePerson});
}

/// @nodoc
class __$$HomepersonImplCopyWithImpl<$Res>
    extends _$HomepersonCopyWithImpl<$Res, _$HomepersonImpl>
    implements _$$HomepersonImplCopyWith<$Res> {
  __$$HomepersonImplCopyWithImpl(
      _$HomepersonImpl _value, $Res Function(_$HomepersonImpl) _then)
      : super(_value, _then);

  /// Create a copy of Homeperson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? namePerson = freezed,
    Object? imagePerson = freezed,
  }) {
    return _then(_$HomepersonImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      namePerson: freezed == namePerson
          ? _value.namePerson
          : namePerson // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePerson: freezed == imagePerson
          ? _value.imagePerson
          : imagePerson // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomepersonImpl implements _Homeperson {
  const _$HomepersonImpl({this.id, this.namePerson, this.imagePerson});

  factory _$HomepersonImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomepersonImplFromJson(json);

  @override
  final int? id;
  @override
  final String? namePerson;
  @override
  final String? imagePerson;

  @override
  String toString() {
    return 'Homeperson(id: $id, namePerson: $namePerson, imagePerson: $imagePerson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomepersonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.namePerson, namePerson) ||
                other.namePerson == namePerson) &&
            (identical(other.imagePerson, imagePerson) ||
                other.imagePerson == imagePerson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, namePerson, imagePerson);

  /// Create a copy of Homeperson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomepersonImplCopyWith<_$HomepersonImpl> get copyWith =>
      __$$HomepersonImplCopyWithImpl<_$HomepersonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomepersonImplToJson(
      this,
    );
  }
}

abstract class _Homeperson implements Homeperson {
  const factory _Homeperson(
      {final int? id,
      final String? namePerson,
      final String? imagePerson}) = _$HomepersonImpl;

  factory _Homeperson.fromJson(Map<String, dynamic> json) =
      _$HomepersonImpl.fromJson;

  @override
  int? get id;
  @override
  String? get namePerson;
  @override
  String? get imagePerson;

  /// Create a copy of Homeperson
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomepersonImplCopyWith<_$HomepersonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Homerole _$HomeroleFromJson(Map<String, dynamic> json) {
  return _Homerole.fromJson(json);
}

/// @nodoc
mixin _$Homerole {
  int? get id => throw _privateConstructorUsedError;
  String? get nameRol => throw _privateConstructorUsedError;
  String? get descriptionRol => throw _privateConstructorUsedError;

  /// Serializes this Homerole to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Homerole
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeroleCopyWith<Homerole> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeroleCopyWith<$Res> {
  factory $HomeroleCopyWith(Homerole value, $Res Function(Homerole) then) =
      _$HomeroleCopyWithImpl<$Res, Homerole>;
  @useResult
  $Res call({int? id, String? nameRol, String? descriptionRol});
}

/// @nodoc
class _$HomeroleCopyWithImpl<$Res, $Val extends Homerole>
    implements $HomeroleCopyWith<$Res> {
  _$HomeroleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Homerole
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nameRol = freezed,
    Object? descriptionRol = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      nameRol: freezed == nameRol
          ? _value.nameRol
          : nameRol // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionRol: freezed == descriptionRol
          ? _value.descriptionRol
          : descriptionRol // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeroleImplCopyWith<$Res>
    implements $HomeroleCopyWith<$Res> {
  factory _$$HomeroleImplCopyWith(
          _$HomeroleImpl value, $Res Function(_$HomeroleImpl) then) =
      __$$HomeroleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? nameRol, String? descriptionRol});
}

/// @nodoc
class __$$HomeroleImplCopyWithImpl<$Res>
    extends _$HomeroleCopyWithImpl<$Res, _$HomeroleImpl>
    implements _$$HomeroleImplCopyWith<$Res> {
  __$$HomeroleImplCopyWithImpl(
      _$HomeroleImpl _value, $Res Function(_$HomeroleImpl) _then)
      : super(_value, _then);

  /// Create a copy of Homerole
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nameRol = freezed,
    Object? descriptionRol = freezed,
  }) {
    return _then(_$HomeroleImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      nameRol: freezed == nameRol
          ? _value.nameRol
          : nameRol // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionRol: freezed == descriptionRol
          ? _value.descriptionRol
          : descriptionRol // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeroleImpl implements _Homerole {
  const _$HomeroleImpl({this.id, this.nameRol, this.descriptionRol});

  factory _$HomeroleImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeroleImplFromJson(json);

  @override
  final int? id;
  @override
  final String? nameRol;
  @override
  final String? descriptionRol;

  @override
  String toString() {
    return 'Homerole(id: $id, nameRol: $nameRol, descriptionRol: $descriptionRol)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeroleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nameRol, nameRol) || other.nameRol == nameRol) &&
            (identical(other.descriptionRol, descriptionRol) ||
                other.descriptionRol == descriptionRol));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nameRol, descriptionRol);

  /// Create a copy of Homerole
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeroleImplCopyWith<_$HomeroleImpl> get copyWith =>
      __$$HomeroleImplCopyWithImpl<_$HomeroleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeroleImplToJson(
      this,
    );
  }
}

abstract class _Homerole implements Homerole {
  const factory _Homerole(
      {final int? id,
      final String? nameRol,
      final String? descriptionRol}) = _$HomeroleImpl;

  factory _Homerole.fromJson(Map<String, dynamic> json) =
      _$HomeroleImpl.fromJson;

  @override
  int? get id;
  @override
  String? get nameRol;
  @override
  String? get descriptionRol;

  /// Create a copy of Homerole
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeroleImplCopyWith<_$HomeroleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Homestatus _$HomestatusFromJson(Map<String, dynamic> json) {
  return _Homestatus.fromJson(json);
}

/// @nodoc
mixin _$Homestatus {
  int? get id => throw _privateConstructorUsedError;
  String? get nameStatus => throw _privateConstructorUsedError;
  String? get descriptionStatus => throw _privateConstructorUsedError;
  String? get colorStatus => throw _privateConstructorUsedError;
  String? get iconStatus => throw _privateConstructorUsedError;

  /// Serializes this Homestatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Homestatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomestatusCopyWith<Homestatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomestatusCopyWith<$Res> {
  factory $HomestatusCopyWith(
          Homestatus value, $Res Function(Homestatus) then) =
      _$HomestatusCopyWithImpl<$Res, Homestatus>;
  @useResult
  $Res call(
      {int? id,
      String? nameStatus,
      String? descriptionStatus,
      String? colorStatus,
      String? iconStatus});
}

/// @nodoc
class _$HomestatusCopyWithImpl<$Res, $Val extends Homestatus>
    implements $HomestatusCopyWith<$Res> {
  _$HomestatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Homestatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nameStatus = freezed,
    Object? descriptionStatus = freezed,
    Object? colorStatus = freezed,
    Object? iconStatus = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      nameStatus: freezed == nameStatus
          ? _value.nameStatus
          : nameStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionStatus: freezed == descriptionStatus
          ? _value.descriptionStatus
          : descriptionStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      colorStatus: freezed == colorStatus
          ? _value.colorStatus
          : colorStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      iconStatus: freezed == iconStatus
          ? _value.iconStatus
          : iconStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomestatusImplCopyWith<$Res>
    implements $HomestatusCopyWith<$Res> {
  factory _$$HomestatusImplCopyWith(
          _$HomestatusImpl value, $Res Function(_$HomestatusImpl) then) =
      __$$HomestatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? nameStatus,
      String? descriptionStatus,
      String? colorStatus,
      String? iconStatus});
}

/// @nodoc
class __$$HomestatusImplCopyWithImpl<$Res>
    extends _$HomestatusCopyWithImpl<$Res, _$HomestatusImpl>
    implements _$$HomestatusImplCopyWith<$Res> {
  __$$HomestatusImplCopyWithImpl(
      _$HomestatusImpl _value, $Res Function(_$HomestatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of Homestatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nameStatus = freezed,
    Object? descriptionStatus = freezed,
    Object? colorStatus = freezed,
    Object? iconStatus = freezed,
  }) {
    return _then(_$HomestatusImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      nameStatus: freezed == nameStatus
          ? _value.nameStatus
          : nameStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionStatus: freezed == descriptionStatus
          ? _value.descriptionStatus
          : descriptionStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      colorStatus: freezed == colorStatus
          ? _value.colorStatus
          : colorStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      iconStatus: freezed == iconStatus
          ? _value.iconStatus
          : iconStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomestatusImpl implements _Homestatus {
  const _$HomestatusImpl(
      {this.id,
      this.nameStatus,
      this.descriptionStatus,
      this.colorStatus,
      this.iconStatus});

  factory _$HomestatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomestatusImplFromJson(json);

  @override
  final int? id;
  @override
  final String? nameStatus;
  @override
  final String? descriptionStatus;
  @override
  final String? colorStatus;
  @override
  final String? iconStatus;

  @override
  String toString() {
    return 'Homestatus(id: $id, nameStatus: $nameStatus, descriptionStatus: $descriptionStatus, colorStatus: $colorStatus, iconStatus: $iconStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomestatusImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nameStatus, nameStatus) ||
                other.nameStatus == nameStatus) &&
            (identical(other.descriptionStatus, descriptionStatus) ||
                other.descriptionStatus == descriptionStatus) &&
            (identical(other.colorStatus, colorStatus) ||
                other.colorStatus == colorStatus) &&
            (identical(other.iconStatus, iconStatus) ||
                other.iconStatus == iconStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, nameStatus, descriptionStatus, colorStatus, iconStatus);

  /// Create a copy of Homestatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomestatusImplCopyWith<_$HomestatusImpl> get copyWith =>
      __$$HomestatusImplCopyWithImpl<_$HomestatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomestatusImplToJson(
      this,
    );
  }
}

abstract class _Homestatus implements Homestatus {
  const factory _Homestatus(
      {final int? id,
      final String? nameStatus,
      final String? descriptionStatus,
      final String? colorStatus,
      final String? iconStatus}) = _$HomestatusImpl;

  factory _Homestatus.fromJson(Map<String, dynamic> json) =
      _$HomestatusImpl.fromJson;

  @override
  int? get id;
  @override
  String? get nameStatus;
  @override
  String? get descriptionStatus;
  @override
  String? get colorStatus;
  @override
  String? get iconStatus;

  /// Create a copy of Homestatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomestatusImplCopyWith<_$HomestatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Hometype _$HometypeFromJson(Map<String, dynamic> json) {
  return _Hometype.fromJson(json);
}

/// @nodoc
mixin _$Hometype {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;

  /// Serializes this Hometype to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Hometype
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HometypeCopyWith<Hometype> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HometypeCopyWith<$Res> {
  factory $HometypeCopyWith(Hometype value, $Res Function(Hometype) then) =
      _$HometypeCopyWithImpl<$Res, Hometype>;
  @useResult
  $Res call({int? id, String? name, String? description, String? icon});
}

/// @nodoc
class _$HometypeCopyWithImpl<$Res, $Val extends Hometype>
    implements $HometypeCopyWith<$Res> {
  _$HometypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Hometype
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? icon = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HometypeImplCopyWith<$Res>
    implements $HometypeCopyWith<$Res> {
  factory _$$HometypeImplCopyWith(
          _$HometypeImpl value, $Res Function(_$HometypeImpl) then) =
      __$$HometypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, String? description, String? icon});
}

/// @nodoc
class __$$HometypeImplCopyWithImpl<$Res>
    extends _$HometypeCopyWithImpl<$Res, _$HometypeImpl>
    implements _$$HometypeImplCopyWith<$Res> {
  __$$HometypeImplCopyWithImpl(
      _$HometypeImpl _value, $Res Function(_$HometypeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Hometype
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? icon = freezed,
  }) {
    return _then(_$HometypeImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HometypeImpl implements _Hometype {
  const _$HometypeImpl({this.id, this.name, this.description, this.icon});

  factory _$HometypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$HometypeImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? icon;

  @override
  String toString() {
    return 'Hometype(id: $id, name: $name, description: $description, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HometypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, icon);

  /// Create a copy of Hometype
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HometypeImplCopyWith<_$HometypeImpl> get copyWith =>
      __$$HometypeImplCopyWithImpl<_$HometypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HometypeImplToJson(
      this,
    );
  }
}

abstract class _Hometype implements Hometype {
  const factory _Hometype(
      {final int? id,
      final String? name,
      final String? description,
      final String? icon}) = _$HometypeImpl;

  factory _Hometype.fromJson(Map<String, dynamic> json) =
      _$HometypeImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  String? get icon;

  /// Create a copy of Hometype
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HometypeImplCopyWith<_$HometypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Homewarehouse _$HomewarehouseFromJson(Map<String, dynamic> json) {
  return _Homewarehouse.fromJson(json);
}

/// @nodoc
mixin _$Homewarehouse {
  int? get id => throw _privateConstructorUsedError;
  String? get nameWarehouses => throw _privateConstructorUsedError;
  String? get descriptionWarehouses => throw _privateConstructorUsedError;
  String? get locationWarehouses => throw _privateConstructorUsedError;

  /// Serializes this Homewarehouse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Homewarehouse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomewarehouseCopyWith<Homewarehouse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomewarehouseCopyWith<$Res> {
  factory $HomewarehouseCopyWith(
          Homewarehouse value, $Res Function(Homewarehouse) then) =
      _$HomewarehouseCopyWithImpl<$Res, Homewarehouse>;
  @useResult
  $Res call(
      {int? id,
      String? nameWarehouses,
      String? descriptionWarehouses,
      String? locationWarehouses});
}

/// @nodoc
class _$HomewarehouseCopyWithImpl<$Res, $Val extends Homewarehouse>
    implements $HomewarehouseCopyWith<$Res> {
  _$HomewarehouseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Homewarehouse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nameWarehouses = freezed,
    Object? descriptionWarehouses = freezed,
    Object? locationWarehouses = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      nameWarehouses: freezed == nameWarehouses
          ? _value.nameWarehouses
          : nameWarehouses // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionWarehouses: freezed == descriptionWarehouses
          ? _value.descriptionWarehouses
          : descriptionWarehouses // ignore: cast_nullable_to_non_nullable
              as String?,
      locationWarehouses: freezed == locationWarehouses
          ? _value.locationWarehouses
          : locationWarehouses // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomewarehouseImplCopyWith<$Res>
    implements $HomewarehouseCopyWith<$Res> {
  factory _$$HomewarehouseImplCopyWith(
          _$HomewarehouseImpl value, $Res Function(_$HomewarehouseImpl) then) =
      __$$HomewarehouseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? nameWarehouses,
      String? descriptionWarehouses,
      String? locationWarehouses});
}

/// @nodoc
class __$$HomewarehouseImplCopyWithImpl<$Res>
    extends _$HomewarehouseCopyWithImpl<$Res, _$HomewarehouseImpl>
    implements _$$HomewarehouseImplCopyWith<$Res> {
  __$$HomewarehouseImplCopyWithImpl(
      _$HomewarehouseImpl _value, $Res Function(_$HomewarehouseImpl) _then)
      : super(_value, _then);

  /// Create a copy of Homewarehouse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nameWarehouses = freezed,
    Object? descriptionWarehouses = freezed,
    Object? locationWarehouses = freezed,
  }) {
    return _then(_$HomewarehouseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      nameWarehouses: freezed == nameWarehouses
          ? _value.nameWarehouses
          : nameWarehouses // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionWarehouses: freezed == descriptionWarehouses
          ? _value.descriptionWarehouses
          : descriptionWarehouses // ignore: cast_nullable_to_non_nullable
              as String?,
      locationWarehouses: freezed == locationWarehouses
          ? _value.locationWarehouses
          : locationWarehouses // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomewarehouseImpl implements _Homewarehouse {
  const _$HomewarehouseImpl(
      {this.id,
      this.nameWarehouses,
      this.descriptionWarehouses,
      this.locationWarehouses});

  factory _$HomewarehouseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomewarehouseImplFromJson(json);

  @override
  final int? id;
  @override
  final String? nameWarehouses;
  @override
  final String? descriptionWarehouses;
  @override
  final String? locationWarehouses;

  @override
  String toString() {
    return 'Homewarehouse(id: $id, nameWarehouses: $nameWarehouses, descriptionWarehouses: $descriptionWarehouses, locationWarehouses: $locationWarehouses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomewarehouseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nameWarehouses, nameWarehouses) ||
                other.nameWarehouses == nameWarehouses) &&
            (identical(other.descriptionWarehouses, descriptionWarehouses) ||
                other.descriptionWarehouses == descriptionWarehouses) &&
            (identical(other.locationWarehouses, locationWarehouses) ||
                other.locationWarehouses == locationWarehouses));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nameWarehouses,
      descriptionWarehouses, locationWarehouses);

  /// Create a copy of Homewarehouse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomewarehouseImplCopyWith<_$HomewarehouseImpl> get copyWith =>
      __$$HomewarehouseImplCopyWithImpl<_$HomewarehouseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomewarehouseImplToJson(
      this,
    );
  }
}

abstract class _Homewarehouse implements Homewarehouse {
  const factory _Homewarehouse(
      {final int? id,
      final String? nameWarehouses,
      final String? descriptionWarehouses,
      final String? locationWarehouses}) = _$HomewarehouseImpl;

  factory _Homewarehouse.fromJson(Map<String, dynamic> json) =
      _$HomewarehouseImpl.fromJson;

  @override
  int? get id;
  @override
  String? get nameWarehouses;
  @override
  String? get descriptionWarehouses;
  @override
  String? get locationWarehouses;

  /// Create a copy of Homewarehouse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomewarehouseImplCopyWith<_$HomewarehouseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
