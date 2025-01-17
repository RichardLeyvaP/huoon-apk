// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finances_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FinancesImpl _$$FinancesImplFromJson(Map<String, dynamic> json) =>
    _$FinancesImpl(
      finances: (json['finances'] as List<dynamic>?)
              ?.map((e) => Finance.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$FinancesImplToJson(_$FinancesImpl instance) =>
    <String, dynamic>{
      'finances': instance.finances,
    };

_$FinanceImpl _$$FinanceImplFromJson(Map<String, dynamic> json) =>
    _$FinanceImpl(
      id: (json['id'] as num?)?.toInt(),
      homeId: (json['homeId'] as num?)?.toInt(),
      financeHomeId: (json['financeHomeId'] as num?)?.toInt(),
      personId: (json['personId'] as num?)?.toInt(),
      personD: (json['personD'] as num?)?.toInt(),
      spent: json['spent'] as String?,
      income: json['income'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      description: json['description'] as String?,
      type: json['type'] as String?,
      method: json['method'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$FinanceImplToJson(_$FinanceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'homeId': instance.homeId,
      'financeHomeId': instance.financeHomeId,
      'personId': instance.personId,
      'personD': instance.personD,
      'spent': instance.spent,
      'income': instance.income,
      'date': instance.date?.toIso8601String(),
      'description': instance.description,
      'type': instance.type,
      'method': instance.method,
      'image': instance.image,
    };
