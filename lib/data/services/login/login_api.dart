import 'dart:convert';

import 'package:huoon/ui/pages/env.dart';

class LoginApi {
  get http => null;

  Future<void> getUser() async {
    final String api = '${Env.apiEndpoint}';
    final String Enpoint = 'login-apk';
    try {
      print('resp- entrando a loginWithGoogle');
      final url = Uri.parse('$api$Enpoint'); // URL de tu API
      try {
        final response = await http.get(url);
        // Imprime la respuesta completa
        print('resp- Response body: ${response.body}');
        if (response.statusCode == 200) {
          final responseData = json.decode(response.body);
          // Maneja la respuesta de la API, como los datos del usuario o token
          print('resp- Login exitoso: $responseData');
        } else {
          print('resp- Error al iniciar sesión: ${response.statusCode}');
        }
      } catch (error) {
        print('resp- Error en la solicitud: $error');
      }
    } catch (e) {
      print(e);
    }
  }
}
