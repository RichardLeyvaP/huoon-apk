// ignore_for_file: unused_element, depend_on_referenced_packages

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:huoon/data/repository/configuration_repository.dart';
import 'package:huoon/data/services/globalCallApi/apiService.dart';
import 'package:huoon/dependency_injection/providers.dart';
import 'package:huoon/domain/blocs/configuration_bloc/configuration_service.dart';
import 'package:huoon/ui/myApp.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // Habilita la recopilación de eventos de Firebase Analytics
  // await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);

  // await Firebase.initializeApp(
  //   name: "huoon-app-flutter",
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  await initializeDateFormatting('es', null);
  //await requestConfiguration();//esto cargaba las configuraciones iniciales y ponia lenta la aplicación

  runApp(
    MultiProvider(
      providers: providers,
      child: const AppInitializerWidget(),
    ),
  );
}

class AppInitializerWidget extends StatefulWidget {
  const AppInitializerWidget({super.key});

  @override
  State<AppInitializerWidget> createState() => _AppInitializerWidgetState();
}

class _AppInitializerWidgetState extends State<AppInitializerWidget> {
  final ConfigurationRepository configurationRepository = ConfigurationRepository(authService: ApiService());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}
