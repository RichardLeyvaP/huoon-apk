// To parse this JSON data, do
//
//     final homeHouseUsser = homeHouseUsserFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'homeHouseUsser_model.freezed.dart';
part 'homeHouseUsser_model.g.dart';

HomeHouseUsser homeHouseUsserFromJson(String str) => HomeHouseUsser.fromJson(json.decode(str));

String homeHouseUsserToJson(HomeHouseUsser data) => json.encode(data.toJson());

@freezed
class HomeHouseUsser with _$HomeHouseUsser {
    const factory HomeHouseUsser({
        List<Home>? homes,
    }) = _HomeHouseUsser;

    factory HomeHouseUsser.fromJson(Map<String, dynamic> json) => _$HomeHouseUsserFromJson(json);
}

@freezed
class Home with _$Home {
    const factory Home({
        int? id,
        int? statusId,
        int? homeStatusId,
        String? name,
        String? address,
        int? homeTypeId,
        int? homeHomeTypeId,
        String? nameHomeType,
        int? residents,
        String? geoLocation,
        String? homeGeoLocation,
        String? timezone,
        String? nameStatus,
        String? image,
        List<PersonHomeUsser>? people,
    }) = _Home;

    factory Home.fromJson(Map<String, dynamic> json) => _$HomeFromJson(json);
}

@freezed
class PersonHomeUsser with _$PersonHomeUsser {
    const factory PersonHomeUsser({
        int? id,
        String? name,
        String? image,
        int? roleId,
        int? personRoleId,
        String? roleName,
    }) = _PersonHomeUsser;

    factory PersonHomeUsser.fromJson(Map<String, dynamic> json) => _$PersonHomeUsserFromJson(json);
}
