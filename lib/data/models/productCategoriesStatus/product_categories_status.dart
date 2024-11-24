import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_categories_status.freezed.dart';
part 'product_categories_status.g.dart';
//  factory Login.fromJson(Map<String, Object?> json) => _$LoginFromJson(json);

@freezed
class ProductCategoriesStatus with _$ProductCategoriesStatus {
  const factory ProductCategoriesStatus({
    required List<Productcategory> productcategories,
    required List<Productstatus> productstatus,
  }) = _ProductCategoriesStatus;
  factory ProductCategoriesStatus.fromJson(Map<String, Object?> json) => _$ProductCategoriesStatusFromJson(json);
}

@freezed
class Productcategory with _$Productcategory {
  const factory Productcategory({
    required int id,
    required String nameCategory,
    required String descriptionCategory,
    required dynamic iconCategory,
  }) = _Productcategory;
  factory Productcategory.fromJson(Map<String, Object?> json) => _$ProductcategoryFromJson(json);
}

@freezed
class Productstatus with _$Productstatus {
  const factory Productstatus({
    required int id,
    required String nameStatus,
    required String descriptionStatus,
    required dynamic iconCategory,
  }) = _Productstatus;
  factory Productstatus.fromJson(Map<String, Object?> json) => _$ProductstatusFromJson(json);
}
