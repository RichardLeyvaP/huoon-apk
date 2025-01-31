// To parse this JSON data, do
//
//     final homeHouse = homeHouseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'homeHouse_model.freezed.dart';
part 'homeHouse_model.g.dart';

HomeHouse homeHouseFromJson(String str) => HomeHouse.fromJson(json.decode(str));

String homeHouseToJson(HomeHouse data) => json.encode(data.toJson());

@freezed
class HomeHouse with _$HomeHouse {
    const factory HomeHouse({
        String? name,
        String? address,
        int? homeTypeId,
        int? residents,
        String? geoLocation,
        String? timezone,
        int? statusId,
        String? image,
        List<Person>? people,
    }) = _HomeHouse;

    factory HomeHouse.fromJson(Map<String, dynamic> json) => _$HomeHouseFromJson(json);
}

@freezed
class Person with _$Person {
    const factory Person({
        int? personId,
        int? roleId,
    }) = _Person;

    factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}
