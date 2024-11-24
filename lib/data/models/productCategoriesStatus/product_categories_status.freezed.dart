// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_categories_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductCategoriesStatus _$ProductCategoriesStatusFromJson(
    Map<String, dynamic> json) {
  return _ProductCategoriesStatus.fromJson(json);
}

/// @nodoc
mixin _$ProductCategoriesStatus {
  List<Productcategory> get productcategories =>
      throw _privateConstructorUsedError;
  List<Productstatus> get productstatus => throw _privateConstructorUsedError;

  /// Serializes this ProductCategoriesStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductCategoriesStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCategoriesStatusCopyWith<ProductCategoriesStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCategoriesStatusCopyWith<$Res> {
  factory $ProductCategoriesStatusCopyWith(ProductCategoriesStatus value,
          $Res Function(ProductCategoriesStatus) then) =
      _$ProductCategoriesStatusCopyWithImpl<$Res, ProductCategoriesStatus>;
  @useResult
  $Res call(
      {List<Productcategory> productcategories,
      List<Productstatus> productstatus});
}

/// @nodoc
class _$ProductCategoriesStatusCopyWithImpl<$Res,
        $Val extends ProductCategoriesStatus>
    implements $ProductCategoriesStatusCopyWith<$Res> {
  _$ProductCategoriesStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductCategoriesStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productcategories = null,
    Object? productstatus = null,
  }) {
    return _then(_value.copyWith(
      productcategories: null == productcategories
          ? _value.productcategories
          : productcategories // ignore: cast_nullable_to_non_nullable
              as List<Productcategory>,
      productstatus: null == productstatus
          ? _value.productstatus
          : productstatus // ignore: cast_nullable_to_non_nullable
              as List<Productstatus>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductCategoriesStatusImplCopyWith<$Res>
    implements $ProductCategoriesStatusCopyWith<$Res> {
  factory _$$ProductCategoriesStatusImplCopyWith(
          _$ProductCategoriesStatusImpl value,
          $Res Function(_$ProductCategoriesStatusImpl) then) =
      __$$ProductCategoriesStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Productcategory> productcategories,
      List<Productstatus> productstatus});
}

/// @nodoc
class __$$ProductCategoriesStatusImplCopyWithImpl<$Res>
    extends _$ProductCategoriesStatusCopyWithImpl<$Res,
        _$ProductCategoriesStatusImpl>
    implements _$$ProductCategoriesStatusImplCopyWith<$Res> {
  __$$ProductCategoriesStatusImplCopyWithImpl(
      _$ProductCategoriesStatusImpl _value,
      $Res Function(_$ProductCategoriesStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductCategoriesStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productcategories = null,
    Object? productstatus = null,
  }) {
    return _then(_$ProductCategoriesStatusImpl(
      productcategories: null == productcategories
          ? _value._productcategories
          : productcategories // ignore: cast_nullable_to_non_nullable
              as List<Productcategory>,
      productstatus: null == productstatus
          ? _value._productstatus
          : productstatus // ignore: cast_nullable_to_non_nullable
              as List<Productstatus>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductCategoriesStatusImpl implements _ProductCategoriesStatus {
  const _$ProductCategoriesStatusImpl(
      {required final List<Productcategory> productcategories,
      required final List<Productstatus> productstatus})
      : _productcategories = productcategories,
        _productstatus = productstatus;

  factory _$ProductCategoriesStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductCategoriesStatusImplFromJson(json);

  final List<Productcategory> _productcategories;
  @override
  List<Productcategory> get productcategories {
    if (_productcategories is EqualUnmodifiableListView)
      return _productcategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productcategories);
  }

  final List<Productstatus> _productstatus;
  @override
  List<Productstatus> get productstatus {
    if (_productstatus is EqualUnmodifiableListView) return _productstatus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productstatus);
  }

  @override
  String toString() {
    return 'ProductCategoriesStatus(productcategories: $productcategories, productstatus: $productstatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductCategoriesStatusImpl &&
            const DeepCollectionEquality()
                .equals(other._productcategories, _productcategories) &&
            const DeepCollectionEquality()
                .equals(other._productstatus, _productstatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_productcategories),
      const DeepCollectionEquality().hash(_productstatus));

  /// Create a copy of ProductCategoriesStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductCategoriesStatusImplCopyWith<_$ProductCategoriesStatusImpl>
      get copyWith => __$$ProductCategoriesStatusImplCopyWithImpl<
          _$ProductCategoriesStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductCategoriesStatusImplToJson(
      this,
    );
  }
}

abstract class _ProductCategoriesStatus implements ProductCategoriesStatus {
  const factory _ProductCategoriesStatus(
          {required final List<Productcategory> productcategories,
          required final List<Productstatus> productstatus}) =
      _$ProductCategoriesStatusImpl;

  factory _ProductCategoriesStatus.fromJson(Map<String, dynamic> json) =
      _$ProductCategoriesStatusImpl.fromJson;

  @override
  List<Productcategory> get productcategories;
  @override
  List<Productstatus> get productstatus;

  /// Create a copy of ProductCategoriesStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductCategoriesStatusImplCopyWith<_$ProductCategoriesStatusImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Productcategory _$ProductcategoryFromJson(Map<String, dynamic> json) {
  return _Productcategory.fromJson(json);
}

/// @nodoc
mixin _$Productcategory {
  int get id => throw _privateConstructorUsedError;
  String get nameCategory => throw _privateConstructorUsedError;
  String get descriptionCategory => throw _privateConstructorUsedError;
  dynamic get iconCategory => throw _privateConstructorUsedError;

  /// Serializes this Productcategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Productcategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductcategoryCopyWith<Productcategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductcategoryCopyWith<$Res> {
  factory $ProductcategoryCopyWith(
          Productcategory value, $Res Function(Productcategory) then) =
      _$ProductcategoryCopyWithImpl<$Res, Productcategory>;
  @useResult
  $Res call(
      {int id,
      String nameCategory,
      String descriptionCategory,
      dynamic iconCategory});
}

/// @nodoc
class _$ProductcategoryCopyWithImpl<$Res, $Val extends Productcategory>
    implements $ProductcategoryCopyWith<$Res> {
  _$ProductcategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Productcategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameCategory = null,
    Object? descriptionCategory = null,
    Object? iconCategory = freezed,
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
      iconCategory: freezed == iconCategory
          ? _value.iconCategory
          : iconCategory // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductcategoryImplCopyWith<$Res>
    implements $ProductcategoryCopyWith<$Res> {
  factory _$$ProductcategoryImplCopyWith(_$ProductcategoryImpl value,
          $Res Function(_$ProductcategoryImpl) then) =
      __$$ProductcategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String nameCategory,
      String descriptionCategory,
      dynamic iconCategory});
}

/// @nodoc
class __$$ProductcategoryImplCopyWithImpl<$Res>
    extends _$ProductcategoryCopyWithImpl<$Res, _$ProductcategoryImpl>
    implements _$$ProductcategoryImplCopyWith<$Res> {
  __$$ProductcategoryImplCopyWithImpl(
      _$ProductcategoryImpl _value, $Res Function(_$ProductcategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Productcategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameCategory = null,
    Object? descriptionCategory = null,
    Object? iconCategory = freezed,
  }) {
    return _then(_$ProductcategoryImpl(
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
      iconCategory: freezed == iconCategory
          ? _value.iconCategory
          : iconCategory // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductcategoryImpl implements _Productcategory {
  const _$ProductcategoryImpl(
      {required this.id,
      required this.nameCategory,
      required this.descriptionCategory,
      required this.iconCategory});

  factory _$ProductcategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductcategoryImplFromJson(json);

  @override
  final int id;
  @override
  final String nameCategory;
  @override
  final String descriptionCategory;
  @override
  final dynamic iconCategory;

  @override
  String toString() {
    return 'Productcategory(id: $id, nameCategory: $nameCategory, descriptionCategory: $descriptionCategory, iconCategory: $iconCategory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductcategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nameCategory, nameCategory) ||
                other.nameCategory == nameCategory) &&
            (identical(other.descriptionCategory, descriptionCategory) ||
                other.descriptionCategory == descriptionCategory) &&
            const DeepCollectionEquality()
                .equals(other.iconCategory, iconCategory));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nameCategory,
      descriptionCategory, const DeepCollectionEquality().hash(iconCategory));

  /// Create a copy of Productcategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductcategoryImplCopyWith<_$ProductcategoryImpl> get copyWith =>
      __$$ProductcategoryImplCopyWithImpl<_$ProductcategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductcategoryImplToJson(
      this,
    );
  }
}

abstract class _Productcategory implements Productcategory {
  const factory _Productcategory(
      {required final int id,
      required final String nameCategory,
      required final String descriptionCategory,
      required final dynamic iconCategory}) = _$ProductcategoryImpl;

  factory _Productcategory.fromJson(Map<String, dynamic> json) =
      _$ProductcategoryImpl.fromJson;

  @override
  int get id;
  @override
  String get nameCategory;
  @override
  String get descriptionCategory;
  @override
  dynamic get iconCategory;

  /// Create a copy of Productcategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductcategoryImplCopyWith<_$ProductcategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Productstatus _$ProductstatusFromJson(Map<String, dynamic> json) {
  return _Productstatus.fromJson(json);
}

/// @nodoc
mixin _$Productstatus {
  int get id => throw _privateConstructorUsedError;
  String get nameStatus => throw _privateConstructorUsedError;
  String get descriptionStatus => throw _privateConstructorUsedError;
  dynamic get iconCategory => throw _privateConstructorUsedError;

  /// Serializes this Productstatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Productstatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductstatusCopyWith<Productstatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductstatusCopyWith<$Res> {
  factory $ProductstatusCopyWith(
          Productstatus value, $Res Function(Productstatus) then) =
      _$ProductstatusCopyWithImpl<$Res, Productstatus>;
  @useResult
  $Res call(
      {int id,
      String nameStatus,
      String descriptionStatus,
      dynamic iconCategory});
}

/// @nodoc
class _$ProductstatusCopyWithImpl<$Res, $Val extends Productstatus>
    implements $ProductstatusCopyWith<$Res> {
  _$ProductstatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Productstatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameStatus = null,
    Object? descriptionStatus = null,
    Object? iconCategory = freezed,
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
      iconCategory: freezed == iconCategory
          ? _value.iconCategory
          : iconCategory // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductstatusImplCopyWith<$Res>
    implements $ProductstatusCopyWith<$Res> {
  factory _$$ProductstatusImplCopyWith(
          _$ProductstatusImpl value, $Res Function(_$ProductstatusImpl) then) =
      __$$ProductstatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String nameStatus,
      String descriptionStatus,
      dynamic iconCategory});
}

/// @nodoc
class __$$ProductstatusImplCopyWithImpl<$Res>
    extends _$ProductstatusCopyWithImpl<$Res, _$ProductstatusImpl>
    implements _$$ProductstatusImplCopyWith<$Res> {
  __$$ProductstatusImplCopyWithImpl(
      _$ProductstatusImpl _value, $Res Function(_$ProductstatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of Productstatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameStatus = null,
    Object? descriptionStatus = null,
    Object? iconCategory = freezed,
  }) {
    return _then(_$ProductstatusImpl(
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
      iconCategory: freezed == iconCategory
          ? _value.iconCategory
          : iconCategory // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductstatusImpl implements _Productstatus {
  const _$ProductstatusImpl(
      {required this.id,
      required this.nameStatus,
      required this.descriptionStatus,
      required this.iconCategory});

  factory _$ProductstatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductstatusImplFromJson(json);

  @override
  final int id;
  @override
  final String nameStatus;
  @override
  final String descriptionStatus;
  @override
  final dynamic iconCategory;

  @override
  String toString() {
    return 'Productstatus(id: $id, nameStatus: $nameStatus, descriptionStatus: $descriptionStatus, iconCategory: $iconCategory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductstatusImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nameStatus, nameStatus) ||
                other.nameStatus == nameStatus) &&
            (identical(other.descriptionStatus, descriptionStatus) ||
                other.descriptionStatus == descriptionStatus) &&
            const DeepCollectionEquality()
                .equals(other.iconCategory, iconCategory));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nameStatus,
      descriptionStatus, const DeepCollectionEquality().hash(iconCategory));

  /// Create a copy of Productstatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductstatusImplCopyWith<_$ProductstatusImpl> get copyWith =>
      __$$ProductstatusImplCopyWithImpl<_$ProductstatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductstatusImplToJson(
      this,
    );
  }
}

abstract class _Productstatus implements Productstatus {
  const factory _Productstatus(
      {required final int id,
      required final String nameStatus,
      required final String descriptionStatus,
      required final dynamic iconCategory}) = _$ProductstatusImpl;

  factory _Productstatus.fromJson(Map<String, dynamic> json) =
      _$ProductstatusImpl.fromJson;

  @override
  int get id;
  @override
  String get nameStatus;
  @override
  String get descriptionStatus;
  @override
  dynamic get iconCategory;

  /// Create a copy of Productstatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductstatusImplCopyWith<_$ProductstatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
