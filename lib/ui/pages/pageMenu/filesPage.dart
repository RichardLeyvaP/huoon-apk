import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:huoon/domain/blocs/user_activity_bloc/user_activity_service.dart';

class FilesPage extends StatefulWidget {
  const FilesPage({super.key});

  @override
  _FilesPageState createState() => _FilesPageState();
}

class _FilesPageState extends State<FilesPage> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      onScreenChange('screen_Home_Files');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'ARCHIVOS',
        ),
      ),
    );
  }
}
