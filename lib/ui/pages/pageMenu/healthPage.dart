import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:huoon/domain/blocs/user_activity_bloc/user_activity_service.dart';

class HealthPage extends StatefulWidget {
  const HealthPage({super.key});

  @override
  _HealthPageState createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      onScreenChange('screen_Home_Health');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'SALUD',
        ),
      ),
    );
  }
}
