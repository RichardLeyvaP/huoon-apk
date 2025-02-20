import 'package:flutter/material.dart';
import 'package:huoon/data/models/ranking/ranking_model.dart';
import 'package:huoon/domain/blocs/ranking_signal/ranking_service.dart';
import 'package:huoon/domain/blocs/ranking_signal/ranking_signals.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  late Future<Ranking?> _rankingFuture;

  @override
  void initState() {
    super.initState();
    _rankingFuture = fetchGetRanking();
  }

  Future<Ranking?> fetchGetRanking() async {
   await getRanking();
   return rankingSignalRK.value;
 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
        //  cardGeneralTop('Ranking', 'Ranking del hogar'),
          Expanded(
            child: FutureBuilder<Ranking?>(
              future: _rankingFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.homePeople == null) {
                  return const Center(child: Text('No hay datos disponibles'));
                }
                

                 final homePeople = snapshot.data!.homePeople!;
   

                return ListView.builder(
                  itemCount: homePeople.length,
                  itemBuilder: (context, index) {
                    final person = homePeople[index];

                    return Container();
                    // ListTileRanking(
                    //   person: {
                    //     "idPerson": person.id,
                    //     "namePerson": person.personName ?? 'Sin nombre',
                    //     "rolePerson": person.roleName ?? 'Sin nombre',
                    //     //"imagePerson": "https://randomuser.me/api/portraits/men/${index + 1}.jpg",
                    //     "imagePerson": '${Env.apiEndpoint}/${person.personImage}',
                    //     "ranking": person.percent ?? 0,
                    //   },
                    // );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}





















// import 'package:flutter/material.dart';
// import 'package:huoon/domain/blocs/ranking_signal/ranking_service.dart';
// import 'package:huoon/ui/pages/pageMenu/RankingPage/widget/cardGeneralTop.dart';
// import 'package:huoon/ui/pages/pageMenu/RankingPage/widget/listTileRanking.dart';

// class RankingPage extends StatefulWidget {

//   RankingPage({super.key});

//   @override
//   State<RankingPage> createState() => _RankingPageState();
// }

// class _RankingPageState extends State<RankingPage> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     fectchGetRanking();
//     super.initState();
//   }

//   fectchGetRanking()
// async {
//   await getRanking();
// }
//   final List<Map<String, dynamic>> people = [
//     {
//       "idPerson": 1,
//       "namePerson": "Carlos Pérez",
//       "imagePerson": "https://randomuser.me/api/portraits/men/1.jpg",
//       "ranking": 5
//     },
//     {
//       "idPerson": 2,
//       "namePerson": "Ana López",
//       "imagePerson": "https://randomuser.me/api/portraits/women/2.jpg",
//       "ranking": 3
//     },
//     {
//       "idPerson": 3,
//       "namePerson": "Juan Rodríguez",
//       "imagePerson": "https://randomuser.me/api/portraits/men/3.jpg",
//       "ranking": 4
//     },
//     {
//       "idPerson": 4,
//       "namePerson": "Sofía García",
//       "imagePerson": "https://randomuser.me/api/portraits/women/4.jpg",
//       "ranking": 2
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//       body: Column(
//         children: [
//           cardGeneralTop('Ranking', 'Ranking del hogar'),
//           Expanded(
//             child: ListView.builder(
//               itemCount: people.length,
//               itemBuilder: (context, index) {
//                 final person = people[index];
//                 return ListTileRanking(person: person);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
