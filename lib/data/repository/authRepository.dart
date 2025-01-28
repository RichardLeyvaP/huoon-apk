import 'package:huoon/data/models/login/login_model.dart';
import 'package:huoon/data/services/globalApiService.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:huoon/ui/pages/env.dart';

class AuthRepository {
  final ApiService authService;

  AuthRepository({required this.authService});

  Future loginNew(String email, String password) async {
    // Llama al servicio que maneja la API de autenticación para login
    final url = Uri.parse('${Env.apiEndpoint}/login-apk');
    try {
      // Hacemos la petición HTTP POST con las credenciales de usuario
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        // Si el login fue exitoso, parseamos la respuesta
        if (responseData.containsKey('token')) {
          return responseData['token'] as String; // Asegúrate de que es un String
        }
      } else {
        // Si hubo un error en la respuesta de la API
        return response.body.toString();
      }
    } catch (error) {
      // Si hubo un error durante la petición
      throw Exception('Token no presente en la respuesta');
    }
  }

  Future<dynamic> login(String email, String password) async {
    // Llama al servicio que maneja la API de autenticación para login
    final response = await authService.loginWithCredentials(email, password);
    // Extrae el token del Map<String, dynamic>
    // Crea una instancia de `Login` con los datos de la respuesta de la API

    print('si estoy devolviendo esto:1-$response');
    if (response.containsKey('token')) {
      final user = Login(
        id: response['id'] as int,
        userName: response['userName'] as String,
        email: response['email'] as String,
        token: response['token'] as String,
      );

      authService.setToken(response['token']);

      // Crear objeto User a partir de la respuesta
      //  final user = Login.fromJson(response['user']);//esto no esta probado
      return user;
    } else if (response.containsKey('msg')) {
      return response['msg'] as String;
    } else {
      print('aqui estoy entrando-error');
      throw Exception('Token no presente en la respuesta');
    }
  }

  Future<String> loginWithFacebook(String token) async {
    // Llama al servicio que maneja la autenticación de Facebook
    final response = await authService.loginWithTokenFacebook(token);
    if (response.containsKey('token')) {
      return response['token'] as String; // Asegúrate de que es un String
    } else {
      throw Exception('Token no presente en la respuesta');
    }
  }

  Future<String> loginWithGoogle(String token) async {
    // Llama al servicio que maneja la autenticación de Google
    final response = await authService.loginWithTokenGoogle(token);
    if (response.containsKey('token')) {
      return response['token'] as String; // Asegúrate de que es un String
    } else {
      throw Exception('Token no presente en la respuesta');
    }
  }

  Future<void> logout() async {
    // Llama al servicio para cerrar sesión
    authService.logout();
  }
}
