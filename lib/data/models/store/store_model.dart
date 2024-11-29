import 'package:freezed_annotation/freezed_annotation.dart';
part 'store_model.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'store_model.g.dart';

@freezed
class Store with _$Store {
  const factory Store({
    required List<StoreElement> store,
  }) = _Store;
  factory Store.fromJson(Map<String, Object?> json) => _$StoreFromJson(json);
}

@freezed
class StoreElement with _$StoreElement {
  const factory StoreElement({
    int? id, //id de lla relacion del store-hogar
    int? warehouse_id, //warehouse_id del almacen
    int? status, //si es 0 es creador - si es 1 Colaboradores si es 2 Visualizadores
    bool? creator,
    String? title,
    String? description,
    String? location,
  }) = _StoreElement;

  factory StoreElement.fromJson(Map<String, Object?> json) => _$StoreElementFromJson(json);
}
