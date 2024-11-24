import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_model.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'product_model.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required List<ProductElement> products,
  }) = _Product;
  factory Product.fromJson(Map<String, Object?> json) => _$ProductFromJson(json);
}

@freezed
class ProductElement with _$ProductElement {
  const factory ProductElement({
    String? name,
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
    String? image,
  }) = _ProductElement;

  factory ProductElement.fromJson(Map<String, Object?> json) => _$ProductElementFromJson(json);
}
