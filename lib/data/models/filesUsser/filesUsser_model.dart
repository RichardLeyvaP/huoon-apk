// To parse this JSON data, do
//
//     final filesModel = filesModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'filesUsser_model.freezed.dart';
part 'filesUsser_model.g.dart';

FilesModel filesModelFromJson(String str) => FilesModel.fromJson(json.decode(str));

String filesModelToJson(FilesModel data) => json.encode(data.toJson());

@freezed
class FilesModel with _$FilesModel {
    const factory FilesModel({
        List<FileElement>? files,
    }) = _FilesModel;

    factory FilesModel.fromJson(Map<String, dynamic> json) => _$FilesModelFromJson(json);
}

@freezed
class FileElement with _$FileElement {
    const factory FileElement({
        int? id,
        String? name,
        String? archive,
        String? type,
        int? size,
        DateTime? date,
        String? description,
        int? filePersonId,
        int? personId,
        int? homeId,
        int? fileHomeId,
        int? personal,
    }) = _FileElement;

    factory FileElement.fromJson(Map<String, dynamic> json) => _$FileElementFromJson(json);
}
