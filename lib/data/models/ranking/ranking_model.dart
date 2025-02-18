import 'package:freezed_annotation/freezed_annotation.dart';

part 'ranking_model.freezed.dart';
part 'ranking_model.g.dart';

@freezed
class Ranking with _$Ranking {
  const factory Ranking({
    List<HomePerson>? homePeople,
  }) = _Ranking;

  factory Ranking.fromJson(Map<String, dynamic> json) => _$RankingFromJson(json);
}

@freezed
class HomePerson with _$HomePerson {
  const factory HomePerson({
    int? id,
    int? homeId,
    int? homePersonHomeId,
    int? personId,
    int? homePersonPersonId,
    String? personName,
    int? roleId,
    int? homePersonRoleId,
    String? roleName,
    String? personImage,
    int? points,
  }) = _HomePerson;

  factory HomePerson.fromJson(Map<String, dynamic> json) => _$HomePersonFromJson(json);
}
