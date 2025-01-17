// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'finances_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Finances _$FinancesFromJson(Map<String, dynamic> json) {
  return _Finances.fromJson(json);
}

/// @nodoc
mixin _$Finances {
  List<Finance> get finances => throw _privateConstructorUsedError;

  /// Serializes this Finances to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Finances
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FinancesCopyWith<Finances> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinancesCopyWith<$Res> {
  factory $FinancesCopyWith(Finances value, $Res Function(Finances) then) =
      _$FinancesCopyWithImpl<$Res, Finances>;
  @useResult
  $Res call({List<Finance> finances});
}

/// @nodoc
class _$FinancesCopyWithImpl<$Res, $Val extends Finances>
    implements $FinancesCopyWith<$Res> {
  _$FinancesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Finances
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? finances = null,
  }) {
    return _then(_value.copyWith(
      finances: null == finances
          ? _value.finances
          : finances // ignore: cast_nullable_to_non_nullable
              as List<Finance>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FinancesImplCopyWith<$Res>
    implements $FinancesCopyWith<$Res> {
  factory _$$FinancesImplCopyWith(
          _$FinancesImpl value, $Res Function(_$FinancesImpl) then) =
      __$$FinancesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Finance> finances});
}

/// @nodoc
class __$$FinancesImplCopyWithImpl<$Res>
    extends _$FinancesCopyWithImpl<$Res, _$FinancesImpl>
    implements _$$FinancesImplCopyWith<$Res> {
  __$$FinancesImplCopyWithImpl(
      _$FinancesImpl _value, $Res Function(_$FinancesImpl) _then)
      : super(_value, _then);

  /// Create a copy of Finances
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? finances = null,
  }) {
    return _then(_$FinancesImpl(
      finances: null == finances
          ? _value._finances
          : finances // ignore: cast_nullable_to_non_nullable
              as List<Finance>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FinancesImpl implements _Finances {
  const _$FinancesImpl({final List<Finance> finances = const []})
      : _finances = finances;

  factory _$FinancesImpl.fromJson(Map<String, dynamic> json) =>
      _$$FinancesImplFromJson(json);

  final List<Finance> _finances;
  @override
  @JsonKey()
  List<Finance> get finances {
    if (_finances is EqualUnmodifiableListView) return _finances;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_finances);
  }

  @override
  String toString() {
    return 'Finances(finances: $finances)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinancesImpl &&
            const DeepCollectionEquality().equals(other._finances, _finances));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_finances));

  /// Create a copy of Finances
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FinancesImplCopyWith<_$FinancesImpl> get copyWith =>
      __$$FinancesImplCopyWithImpl<_$FinancesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FinancesImplToJson(
      this,
    );
  }
}

abstract class _Finances implements Finances {
  const factory _Finances({final List<Finance> finances}) = _$FinancesImpl;

  factory _Finances.fromJson(Map<String, dynamic> json) =
      _$FinancesImpl.fromJson;

  @override
  List<Finance> get finances;

  /// Create a copy of Finances
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FinancesImplCopyWith<_$FinancesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Finance _$FinanceFromJson(Map<String, dynamic> json) {
  return _Finance.fromJson(json);
}

/// @nodoc
mixin _$Finance {
  int? get id => throw _privateConstructorUsedError;
  int? get homeId => throw _privateConstructorUsedError;
  int? get financeHomeId => throw _privateConstructorUsedError;
  int? get personId => throw _privateConstructorUsedError;
  int? get personD => throw _privateConstructorUsedError;
  String? get spent => throw _privateConstructorUsedError;
  String? get income => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get method => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  /// Serializes this Finance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Finance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FinanceCopyWith<Finance> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinanceCopyWith<$Res> {
  factory $FinanceCopyWith(Finance value, $Res Function(Finance) then) =
      _$FinanceCopyWithImpl<$Res, Finance>;
  @useResult
  $Res call(
      {int? id,
      int? homeId,
      int? financeHomeId,
      int? personId,
      int? personD,
      String? spent,
      String? income,
      DateTime? date,
      String? description,
      String? type,
      String? method,
      String? image});
}

/// @nodoc
class _$FinanceCopyWithImpl<$Res, $Val extends Finance>
    implements $FinanceCopyWith<$Res> {
  _$FinanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Finance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? homeId = freezed,
    Object? financeHomeId = freezed,
    Object? personId = freezed,
    Object? personD = freezed,
    Object? spent = freezed,
    Object? income = freezed,
    Object? date = freezed,
    Object? description = freezed,
    Object? type = freezed,
    Object? method = freezed,
    Object? image = freezed,
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
      financeHomeId: freezed == financeHomeId
          ? _value.financeHomeId
          : financeHomeId // ignore: cast_nullable_to_non_nullable
              as int?,
      personId: freezed == personId
          ? _value.personId
          : personId // ignore: cast_nullable_to_non_nullable
              as int?,
      personD: freezed == personD
          ? _value.personD
          : personD // ignore: cast_nullable_to_non_nullable
              as int?,
      spent: freezed == spent
          ? _value.spent
          : spent // ignore: cast_nullable_to_non_nullable
              as String?,
      income: freezed == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      method: freezed == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FinanceImplCopyWith<$Res> implements $FinanceCopyWith<$Res> {
  factory _$$FinanceImplCopyWith(
          _$FinanceImpl value, $Res Function(_$FinanceImpl) then) =
      __$$FinanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? homeId,
      int? financeHomeId,
      int? personId,
      int? personD,
      String? spent,
      String? income,
      DateTime? date,
      String? description,
      String? type,
      String? method,
      String? image});
}

/// @nodoc
class __$$FinanceImplCopyWithImpl<$Res>
    extends _$FinanceCopyWithImpl<$Res, _$FinanceImpl>
    implements _$$FinanceImplCopyWith<$Res> {
  __$$FinanceImplCopyWithImpl(
      _$FinanceImpl _value, $Res Function(_$FinanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Finance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? homeId = freezed,
    Object? financeHomeId = freezed,
    Object? personId = freezed,
    Object? personD = freezed,
    Object? spent = freezed,
    Object? income = freezed,
    Object? date = freezed,
    Object? description = freezed,
    Object? type = freezed,
    Object? method = freezed,
    Object? image = freezed,
  }) {
    return _then(_$FinanceImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      homeId: freezed == homeId
          ? _value.homeId
          : homeId // ignore: cast_nullable_to_non_nullable
              as int?,
      financeHomeId: freezed == financeHomeId
          ? _value.financeHomeId
          : financeHomeId // ignore: cast_nullable_to_non_nullable
              as int?,
      personId: freezed == personId
          ? _value.personId
          : personId // ignore: cast_nullable_to_non_nullable
              as int?,
      personD: freezed == personD
          ? _value.personD
          : personD // ignore: cast_nullable_to_non_nullable
              as int?,
      spent: freezed == spent
          ? _value.spent
          : spent // ignore: cast_nullable_to_non_nullable
              as String?,
      income: freezed == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      method: freezed == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FinanceImpl implements _Finance {
  const _$FinanceImpl(
      {this.id,
      this.homeId,
      this.financeHomeId,
      this.personId,
      this.personD,
      this.spent,
      this.income,
      this.date,
      this.description,
      this.type,
      this.method,
      this.image});

  factory _$FinanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$FinanceImplFromJson(json);

  @override
  final int? id;
  @override
  final int? homeId;
  @override
  final int? financeHomeId;
  @override
  final int? personId;
  @override
  final int? personD;
  @override
  final String? spent;
  @override
  final String? income;
  @override
  final DateTime? date;
  @override
  final String? description;
  @override
  final String? type;
  @override
  final String? method;
  @override
  final String? image;

  @override
  String toString() {
    return 'Finance(id: $id, homeId: $homeId, financeHomeId: $financeHomeId, personId: $personId, personD: $personD, spent: $spent, income: $income, date: $date, description: $description, type: $type, method: $method, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinanceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.homeId, homeId) || other.homeId == homeId) &&
            (identical(other.financeHomeId, financeHomeId) ||
                other.financeHomeId == financeHomeId) &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.personD, personD) || other.personD == personD) &&
            (identical(other.spent, spent) || other.spent == spent) &&
            (identical(other.income, income) || other.income == income) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, homeId, financeHomeId,
      personId, personD, spent, income, date, description, type, method, image);

  /// Create a copy of Finance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FinanceImplCopyWith<_$FinanceImpl> get copyWith =>
      __$$FinanceImplCopyWithImpl<_$FinanceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FinanceImplToJson(
      this,
    );
  }
}

abstract class _Finance implements Finance {
  const factory _Finance(
      {final int? id,
      final int? homeId,
      final int? financeHomeId,
      final int? personId,
      final int? personD,
      final String? spent,
      final String? income,
      final DateTime? date,
      final String? description,
      final String? type,
      final String? method,
      final String? image}) = _$FinanceImpl;

  factory _Finance.fromJson(Map<String, dynamic> json) = _$FinanceImpl.fromJson;

  @override
  int? get id;
  @override
  int? get homeId;
  @override
  int? get financeHomeId;
  @override
  int? get personId;
  @override
  int? get personD;
  @override
  String? get spent;
  @override
  String? get income;
  @override
  DateTime? get date;
  @override
  String? get description;
  @override
  String? get type;
  @override
  String? get method;
  @override
  String? get image;

  /// Create a copy of Finance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FinanceImplCopyWith<_$FinanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
