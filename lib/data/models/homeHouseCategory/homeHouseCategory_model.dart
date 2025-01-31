import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'homeHouseCategory_model.freezed.dart';
part 'homeHouseCategory_model.g.dart';

HomeHouseCategory homeHouseCategoryFromJson(String str) => HomeHouseCategory.fromJson(json.decode(str));

String homeHouseCategoryToJson(HomeHouseCategory data) => json.encode(data.toJson());

@freezed
class HomeHouseCategory with _$HomeHouseCategory {
    const factory HomeHouseCategory({
        List<Homestatus>? homestatus,
        List<Homerole>? homeroles,
        List<Hometype>? hometypes,
        List<Homeperson>? homepeople,
        List<Homewarehouse>? homewarehouses,
    }) = _HomeHouseCategory;

    factory HomeHouseCategory.fromJson(Map<String, dynamic> json) => _$HomeHouseCategoryFromJson(json);
}

@freezed
class Homeperson with _$Homeperson {
    const factory Homeperson({
        int? id,
        String? namePerson,
        String? imagePerson,
    }) = _Homeperson;

    factory Homeperson.fromJson(Map<String, dynamic> json) => _$HomepersonFromJson(json);
}

@freezed
class Homerole with _$Homerole {
    const factory Homerole({
        int? id,
        String? nameRol,
        String? descriptionRol,
    }) = _Homerole;

    factory Homerole.fromJson(Map<String, dynamic> json) => _$HomeroleFromJson(json);
}

@freezed
class Homestatus with _$Homestatus {
    const factory Homestatus({
        int? id,
        String? nameStatus,
        String? descriptionStatus,
        String? colorStatus,
        String? iconStatus,
    }) = _Homestatus;

    factory Homestatus.fromJson(Map<String, dynamic> json) => _$HomestatusFromJson(json);
}

@freezed
class Hometype with _$Hometype {
    const factory Hometype({
        int? id,
        String? name,
        String? description,
        String? icon,
    }) = _Hometype;

    factory Hometype.fromJson(Map<String, dynamic> json) => _$HometypeFromJson(json);
}

@freezed
class Homewarehouse with _$Homewarehouse {
    const factory Homewarehouse({
        int? id,
        String? nameWarehouses,
        String? descriptionWarehouses,
        String? locationWarehouses,
    }) = _Homewarehouse;

    factory Homewarehouse.fromJson(Map<String, dynamic> json) => _$HomewarehouseFromJson(json);
}
