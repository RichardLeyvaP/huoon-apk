import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:huoon/data/models/ranking/ranking_model.dart';
import 'package:huoon/domain/blocs/ranking_signal/ranking_service.dart';
import 'package:huoon/domain/blocs/ranking_signal/ranking_signals.dart';
import 'package:huoon/ui/pages/env.dart';
import 'package:huoon/ui/pages/pageMenu/RankingPage/widget/curvePainter.dart';
import 'package:huoon/ui/pages/pageMenu/RankingPage/widget/listViewRanking.dart';
import 'package:huoon/ui/pages/pageMenu/RankingPage/widget/utilRanking.dart';

class RankingPage extends StatefulWidget {
  RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  final Utilranking utilRanking = Utilranking();
  late Future<Ranking?> _rankingFuture;
  ui.Image? _backgroundImage;

  @override
  void initState() {
    super.initState();
    _rankingFuture = fetchGetRanking();
    _loadBackgroundImage();
  }

  Future<Ranking?> fetchGetRanking() async {
    await getRanking();
    return rankingSignalRK.value;
  }

  Future<void> _loadBackgroundImage() async {
    final ImageStream stream = 
        AssetImage('assets/images/top-gan.png').resolve(ImageConfiguration());
    final Completer<ui.Image> completer = Completer<ui.Image>();

    stream.addListener(
      ImageStreamListener((ImageInfo info, bool _) {
        completer.complete(info.image);
      }),
    );

    _backgroundImage = await completer.future;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Ranking?>(
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
          final sortedHomePeople = List.from(homePeople);
          sortedHomePeople.sort((a, b) => (b.points ?? 0).compareTo(a.points ?? 0));

          return Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 350,
                  child: Stack(
                    children: [
                      if (_backgroundImage != null)
                        CustomPaint(
                          size: Size(MediaQuery.of(context).size.width, 300),
                          painter: CurvePainter(_backgroundImage),
                        ),
                      const Positioned(
                        top: 30,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Text(
                            "Ranking del Hogar",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      if (homePeople.isNotEmpty) ...[
                        Positioned(
                          left: 30,
                          top: 150,
                          child: utilRanking.buildAvatar(
                            sortedHomePeople.length > 1
                                ? '${Env.apiEndpoint}/${sortedHomePeople[1].personImage}'
                                : 'assets/default_avatar.png',
                            sortedHomePeople.length > 1 ? sortedHomePeople[1].personName ?? '' : '',
                            sortedHomePeople.length > 1 ? sortedHomePeople[1].points ?? 0 : 0,
                            Colors.grey,
                            2,
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width / 2 - 50,
                          top: 90,
                          child: utilRanking.buildAvatar(
                            '${Env.apiEndpoint}/${sortedHomePeople[0].personImage}',
                            sortedHomePeople[0].personName ?? '',
                            sortedHomePeople[0].points ?? 0,
                            Colors.amber,
                            1,
                            isFirst: true,
                          ),
                        ),
                        Positioned(
                          right: 30,
                          top: 150,
                          child: utilRanking.buildAvatar(
                            sortedHomePeople.length > 2
                                ? '${Env.apiEndpoint}/${sortedHomePeople[2].personImage}'
                                : 'assets/default_avatar.png',
                            sortedHomePeople.length > 2 ? sortedHomePeople[2].personName ?? '' : '',
                            sortedHomePeople.length > 2 ? sortedHomePeople[2].points ?? 0 : 0,
                            Colors.brown,
                            3,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 350),
                  Expanded(
                    child: ListViewRanking(utilRanking: utilRanking, homePeople: homePeople),
                  ),
                ],
              ),
              Positioned(
                top: 25,
                left: 10,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
