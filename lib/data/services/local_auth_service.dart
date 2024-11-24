import 'package:huoon/ui/util/util_class.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthService {
  final LocalAuthentication auth;

  LocalAuthService({required this.auth});

  Future<bool> isBiometricAvailable() async {
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    return canAuthenticateWithBiometrics || await auth.isDeviceSupported();
  }

  Future<bool> authenticate() async {
    try {
      return await auth.authenticate(
        localizedReason: TranslationManager.translate('authMessage'),
      );
    } catch (e) {
      return false;
    }
  }
}
