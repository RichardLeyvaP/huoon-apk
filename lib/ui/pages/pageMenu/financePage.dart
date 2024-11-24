import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:huoon/domain/blocs/user_activity_bloc/user_activity_service.dart';

class FinancePage extends StatefulWidget {
  const FinancePage({super.key});

  @override
  _FinancePageState createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      onScreenChange('screen_Home_Finance');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'FINANZAS',
        ),
      ),
    );
  }
}
