// To parse this JSON data, do
//
//     final chatIa = chatIaFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'chat_IA_model.freezed.dart';
part 'chat_IA_model.g.dart';

ChatIa chatIaFromJson(String str) => ChatIa.fromJson(json.decode(str));

String chatIaToJson(ChatIa data) => json.encode(data.toJson());

@freezed
class ChatIa with _$ChatIa {
    const factory ChatIa({
        required String question,
        required String answer,
    }) = _ChatIa;

    factory ChatIa.fromJson(Map<String, dynamic> json) => _$ChatIaFromJson(json);
}
