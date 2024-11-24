import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:huoon/domain/blocs/user_activity_bloc/user_activity_service.dart';

class WishesPage extends StatefulWidget {
  const WishesPage({super.key});

  @override
  _WishesPageState createState() => _WishesPageState();
}

class _WishesPageState extends State<WishesPage> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      onScreenChange('screen_Home_Wishes');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'DESEOS',
        ),
      ),
    );
  }
}
