import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'finances_model.freezed.dart';
part 'finances_model.g.dart';

Finances financesFromJson(String str) => Finances.fromJson(json.decode(str));

String financesToJson(Finances data) => json.encode(data.toJson());

@freezed
class Finances with _$Finances {
  const factory Finances({
    @Default([]) List<Finance> finances, // Se establece un valor predeterminado.
  }) = _Finances;

  factory Finances.fromJson(Map<String, dynamic> json) => _$FinancesFromJson(json);
}

@freezed
class Finance with _$Finance {
  const factory Finance({
    int? id,
    int? homeId,
    int? financeHomeId,
    int? personId,
    int? personD,
    String? spent,
    String? income,
    DateTime? date,
    String? description,
    String? type,
    String? method,
    String? image,
  }) = _Finance;

  factory Finance.fromJson(Map<String, dynamic> json) => _$FinanceFromJson(json);
}
