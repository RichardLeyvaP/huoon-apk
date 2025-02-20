
import 'package:flutter/material.dart';
import 'package:huoon/data/models/ranking/ranking_model.dart';
import 'package:huoon/ui/pages/env.dart';
import 'package:huoon/ui/pages/pageMenu/RankingPage/widget/utilRanking.dart';

class ListViewRanking extends StatelessWidget {
  const ListViewRanking({
    super.key,
    required this.utilRanking,
    required this.homePeople,
  });

  final Utilranking utilRanking;
  
  final List<HomePerson> homePeople;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: homePeople.length, // Puedes cambiar esto por la longitud de tu lista real
      itemBuilder: (context, index) {
        return utilRanking.buildRankingItem(
          position: index + 1,
          avatar: '${Env.apiEndpoint}/${homePeople[index].personImage}',
          name: '${homePeople[index].personName}',
          username: '${homePeople[index].roleName}',
          points: '${homePeople[index].points} pts',
         // isVerified: true
        );
      },
    );
  }
}