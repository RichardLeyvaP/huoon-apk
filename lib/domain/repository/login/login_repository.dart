import 'package:huoon/data/services/login/login_api.dart';

class LoginRepository {
  LoginRepository({LoginApi? loginApi}) : _loginApi = loginApi ?? LoginApi();

  final LoginApi _loginApi;

  Future<void> getLogin() async {
    try {
      await _loginApi.getUser();
    } catch (e) {
      print(e);
      throw Exception('Error al devolver el Login:$e');
    }
  }
}
