// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  List<ProductElement> get products => throw _privateConstructorUsedError;

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call({List<ProductElement> products});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductElement>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProductElement> products});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_$ProductImpl(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductElement>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  const _$ProductImpl({required final List<ProductElement> products})
      : _products = products;

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  final List<ProductElement> _products;
  @override
  List<ProductElement> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'Product(products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  const factory _Product({required final List<ProductElement> products}) =
      _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  List<ProductElement> get products;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductElement _$ProductElementFromJson(Map<String, dynamic> json) {
  return _ProductElement.fromJson(json);
}

/// @nodoc
mixin _$ProductElement {
  String? get name => throw _privateConstructorUsedError;
  int? get categoryId => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  String? get nameCategory => throw _privateConstructorUsedError;
  int? get statusId => throw _privateConstructorUsedError;
  String? get nameStatus => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  String? get unitPrice => throw _privateConstructorUsedError;
  String? get totalPrice => throw _privateConstructorUsedError;
  String? get purchaseDate => throw _privateConstructorUsedError;
  DateTime? get expirationDate => throw _privateConstructorUsedError;
  String? get purchasePlace => throw _privateConstructorUsedError;
  String? get brand => throw _privateConstructorUsedError;
  String? get additionalNotes => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  /// Serializes this ProductElement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductElement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductElementCopyWith<ProductElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductElementCopyWith<$Res> {
  factory $ProductElementCopyWith(
          ProductElement value, $Res Function(ProductElement) then) =
      _$ProductElementCopyWithImpl<$Res, ProductElement>;
  @useResult
  $Res call(
      {String? name,
      int? categoryId,
      int? count,
      String? nameCategory,
      int? statusId,
      String? nameStatus,
      int? quantity,
      String? unitPrice,
      String? totalPrice,
      String? purchaseDate,
      DateTime? expirationDate,
      String? purchasePlace,
      String? brand,
      String? additionalNotes,
      String? image});
}

/// @nodoc
class _$ProductElementCopyWithImpl<$Res, $Val extends ProductElement>
    implements $ProductElementCopyWith<$Res> {
  _$ProductElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductElement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? categoryId = freezed,
    Object? count = freezed,
    Object? nameCategory = freezed,
    Object? statusId = freezed,
    Object? nameStatus = freezed,
    Object? quantity = freezed,
    Object? unitPrice = freezed,
    Object? totalPrice = freezed,
    Object? purchaseDate = freezed,
    Object? expirationDate = freezed,
    Object? purchasePlace = freezed,
    Object? brand = freezed,
    Object? additionalNotes = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      nameCategory: freezed == nameCategory
          ? _value.nameCategory
          : nameCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      statusId: freezed == statusId
          ? _value.statusId
          : statusId // ignore: cast_nullable_to_non_nullable
              as int?,
      nameStatus: freezed == nameStatus
          ? _value.nameStatus
          : nameStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      unitPrice: freezed == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      purchaseDate: freezed == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      expirationDate: freezed == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      purchasePlace: freezed == purchasePlace
          ? _value.purchasePlace
          : purchasePlace // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalNotes: freezed == additionalNotes
          ? _value.additionalNotes
          : additionalNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductElementImplCopyWith<$Res>
    implements $ProductElementCopyWith<$Res> {
  factory _$$ProductElementImplCopyWith(_$ProductElementImpl value,
          $Res Function(_$ProductElementImpl) then) =
      __$$ProductElementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      int? categoryId,
      int? count,
      String? nameCategory,
      int? statusId,
      String? nameStatus,
      int? quantity,
      String? unitPrice,
      String? totalPrice,
      String? purchaseDate,
      DateTime? expirationDate,
      String? purchasePlace,
      String? brand,
      String? additionalNotes,
      String? image});
}

/// @nodoc
class __$$ProductElementImplCopyWithImpl<$Res>
    extends _$ProductElementCopyWithImpl<$Res, _$ProductElementImpl>
    implements _$$ProductElementImplCopyWith<$Res> {
  __$$ProductElementImplCopyWithImpl(
      _$ProductElementImpl _value, $Res Function(_$ProductElementImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductElement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? categoryId = freezed,
    Object? count = freezed,
    Object? nameCategory = freezed,
    Object? statusId = freezed,
    Object? nameStatus = freezed,
    Object? quantity = freezed,
    Object? unitPrice = freezed,
    Object? totalPrice = freezed,
    Object? purchaseDate = freezed,
    Object? expirationDate = freezed,
    Object? purchasePlace = freezed,
    Object? brand = freezed,
    Object? additionalNotes = freezed,
    Object? image = freezed,
  }) {
    return _then(_$ProductElementImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      nameCategory: freezed == nameCategory
          ? _value.nameCategory
          : nameCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      statusId: freezed == statusId
          ? _value.statusId
          : statusId // ignore: cast_nullable_to_non_nullable
              as int?,
      nameStatus: freezed == nameStatus
          ? _value.nameStatus
          : nameStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      unitPrice: freezed == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      purchaseDate: freezed == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      expirationDate: freezed == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      purchasePlace: freezed == purchasePlace
          ? _value.purchasePlace
          : purchasePlace // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalNotes: freezed == additionalNotes
          ? _value.additionalNotes
          : additionalNotes // ignore: cast_nullable_to_non_nullable
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
class _$ProductElementImpl implements _ProductElement {
  const _$ProductElementImpl(
      {this.name,
      this.categoryId,
      this.count,
      this.nameCategory,
      this.statusId,
      this.nameStatus,
      this.quantity,
      this.unitPrice,
      this.totalPrice,
      this.purchaseDate,
      this.expirationDate,
      this.purchasePlace,
      this.brand,
      this.additionalNotes,
      this.image});

  factory _$ProductElementImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductElementImplFromJson(json);

  @override
  final String? name;
  @override
  final int? categoryId;
  @override
  final int? count;
  @override
  final String? nameCategory;
  @override
  final int? statusId;
  @override
  final String? nameStatus;
  @override
  final int? quantity;
  @override
  final String? unitPrice;
  @override
  final String? totalPrice;
  @override
  final String? purchaseDate;
  @override
  final DateTime? expirationDate;
  @override
  final String? purchasePlace;
  @override
  final String? brand;
  @override
  final String? additionalNotes;
  @override
  final String? image;

  @override
  String toString() {
    return 'ProductElement(name: $name, categoryId: $categoryId, count: $count, nameCategory: $nameCategory, statusId: $statusId, nameStatus: $nameStatus, quantity: $quantity, unitPrice: $unitPrice, totalPrice: $totalPrice, purchaseDate: $purchaseDate, expirationDate: $expirationDate, purchasePlace: $purchasePlace, brand: $brand, additionalNotes: $additionalNotes, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductElementImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.nameCategory, nameCategory) ||
                other.nameCategory == nameCategory) &&
            (identical(other.statusId, statusId) ||
                other.statusId == statusId) &&
            (identical(other.nameStatus, nameStatus) ||
                other.nameStatus == nameStatus) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.purchaseDate, purchaseDate) ||
                other.purchaseDate == purchaseDate) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate) &&
            (identical(other.purchasePlace, purchasePlace) ||
                other.purchasePlace == purchasePlace) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.additionalNotes, additionalNotes) ||
                other.additionalNotes == additionalNotes) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      categoryId,
      count,
      nameCategory,
      statusId,
      nameStatus,
      quantity,
      unitPrice,
      totalPrice,
      purchaseDate,
      expirationDate,
      purchasePlace,
      brand,
      additionalNotes,
      image);

  /// Create a copy of ProductElement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductElementImplCopyWith<_$ProductElementImpl> get copyWith =>
      __$$ProductElementImplCopyWithImpl<_$ProductElementImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductElementImplToJson(
      this,
    );
  }
}

abstract class _ProductElement implements ProductElement {
  const factory _ProductElement(
      {final String? name,
      final int? categoryId,
      final int? count,
      final String? nameCategory,
      final int? statusId,
      final String? nameStatus,
      final int? quantity,
      final String? unitPrice,
      final String? totalPrice,
      final String? purchaseDate,
      final DateTime? expirationDate,
      final String? purchasePlace,
      final String? brand,
      final String? additionalNotes,
      final String? image}) = _$ProductElementImpl;

  factory _ProductElement.fromJson(Map<String, dynamic> json) =
      _$ProductElementImpl.fromJson;

  @override
  String? get name;
  @override
  int? get categoryId;
  @override
  int? get count;
  @override
  String? get nameCategory;
  @override
  int? get statusId;
  @override
  String? get nameStatus;
  @override
  int? get quantity;
  @override
  String? get unitPrice;
  @override
  String? get totalPrice;
  @override
  String? get purchaseDate;
  @override
  DateTime? get expirationDate;
  @override
  String? get purchasePlace;
  @override
  String? get brand;
  @override
  String? get additionalNotes;
  @override
  String? get image;

  /// Create a copy of ProductElement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductElementImplCopyWith<_$ProductElementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
