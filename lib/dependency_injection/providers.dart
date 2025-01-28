import 'package:huoon/data/services/localAuthService.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
//import 'package:turnopro_apk/get_connect/repository/feed_repository.dart';

final providers = <SingleChildWidget>[
  Provider<LocalAuthService>(
    create: (context) => LocalAuthService(
      auth: LocalAuthentication(),
    ),
  ),
];
