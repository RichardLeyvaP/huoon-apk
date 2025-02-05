import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:huoon/ui/pages/env.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http_parser/http_parser.dart';



class ApiService {
  String? baseUrl;
  String? _token; // Token privado

  ApiService({this.baseUrl, String? token}) : _token = token;

  // Método para establecer el token
  Future<void> setToken(String? token) async {
    _token = token;
    print('el token es:$token -setToken');
    // Guardar el token en shared_preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token ?? '');
  }

  // Método para obtener el token
  Future<String?> getToken() async {
    if (_token != null) {
      return _token;
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _token = prefs.getString('auth_token');
      return _token;
    }
  }

  // Método general para iniciar sesión
  Future<Map<String, dynamic>> login({
    //datos para el login y register de google
    String? id,
    String? name,
    String? email,
    String? image,
    //
    String? facebookToken,
    String? googleToken,
    String? username,
    String? password,
  }) async {
    if (facebookToken != null) {
      return loginWithTokenFacebook(facebookToken);
    } else if (googleToken != null && id != null && name != null && email != null) {
      return loginWithTokenGoogle(id,name,email,image??'');//(String id,String name,String email, String image)
    } else if (username != null && password != null) {
      return loginWithCredentials(username, password);
    } else {
      throw Exception('Datos de autenticación insuficientes.');
    }
  }

  // Método GET
  Future<dynamic> get(String endpoint) async {
    final response = await http.get(
      Uri.parse(endpoint),
      headers: await _headers(),
    );
    print('mandando para el get-empoint:$endpoint');
    return _processResponse(response);
  }

  // Método POST
  Future<dynamic> post(String endpoint, {required Map<String, dynamic> body}) async {
    try {
      print('si estoy addIncomeExpenses esto:1-post');
      final response = await http.post(
        Uri.parse(endpoint),
        headers: await _headers(),
        body: jsonEncode(body),
      );
      SharedPreferences prefs = await SharedPreferences.getInstance();
       String ?token = prefs.getString('auth_token');
      print('aqui estoy entrando-al metodo-post-task-response.statusCode${response.statusCode}');
      print('aqui estoy entrando-al metodo-post-task-response.statusCode-1${token}');

      return _processResponse(response);
    } on SocketException catch (e) {
      print('Error de red (SocketException): $e');
      throw Exception('Error de red: No se pudo conectar al servidor.');
    } on HttpException catch (e) {
      print('Error HTTP (HttpException): $e');
      throw Exception('Error HTTP: La solicitud al servidor falló.');
    } on FormatException catch (e) {
      print('Error de formato (FormatException): $e');
      throw Exception('Error de formato: La respuesta no tiene un formato esperado.');
    } catch (e, stacktrace) {
      print('Error general (Exception): $e');
      print('Stacktrace: $stacktrace');
      throw Exception('Error desconocido: $e');
    }
  }



Future<dynamic> postWithFile(
  String endpoint, {
  required Map<String, dynamic> body,
  required File file,
  String fileField = 'archive', // Nombre del campo del archivo en el servidor
}) async {
  try {
    print('📤 Subiendo archivo: ${file.path}');

    // Detectar el tipo MIME del archivo
    String mimeType = _getMimeType(file);
    print('📌 Tipo de archivo detectado: $mimeType');

    final uri = Uri.parse(endpoint);
    final request = http.MultipartRequest('POST', uri);

    // Agregar encabezados
    final headers = await _headers();
    request.headers.addAll(headers);

    // Agregar campos del body
    body.forEach((key, value) {
      if (value is String) {
        request.fields[key] = value;
      } else {
        request.fields[key] = jsonEncode(value); // Convertir a JSON si no es String
      }
    });

    // Adjuntar el archivo con el tipo MIME correcto
    request.files.add(await http.MultipartFile.fromPath(
      fileField,
      file.path,
      contentType: MediaType.parse(mimeType),
    ));

    // Enviar la solicitud
    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    print('✅ Respuesta del servidor: ${response.statusCode} - ${response.body}');

    return _processResponse(response);
  } on SocketException catch (e) {
    print('❌ Error de red (SocketException): $e');
    throw Exception('Error de red: No se pudo conectar al servidor.');
  } on HttpException catch (e) {
    print('❌ Error HTTP (HttpException): $e');
    throw Exception('Error HTTP: La solicitud al servidor falló.');
  } on FormatException catch (e) {
    print('❌ Error de formato (FormatException): $e');
    throw Exception('Error de formato: La respuesta no tiene un formato esperado.');
  } catch (e, stacktrace) {
    print('❌ Error general (Exception): $e');
    print('🔍 Stacktrace: $stacktrace');
    throw Exception('Error desconocido: $e');
  }
}

/// Método para obtener el tipo MIME del archivo
String _getMimeType(File file) {
  String extension = file.path.split('.').last.toLowerCase();
  switch (extension) {
    case 'jpg':
    case 'jpeg':
      return 'image/jpeg';
    case 'png':
      return 'image/png';
    default:
      return 'application/octet-stream'; // Tipo por defecto si no se reconoce
  }
}






  // Método PUT
  Future<dynamic> put(String endpoint, {required Map<String, dynamic> body}) async {
    print('_onConfigurationSubmitted entrando Future<dynamic> put:${body}');
    final response = await http.put(
      Uri.parse(endpoint),
      headers: await _headers(),
      body: jsonEncode(body),
    );
    print('_onConfigurationSubmitted entrando Future<dynamic> response:${response.body}');
    return _processResponse(response);
  }

  // Método DELETE
  Future<dynamic> delete(String endpoint) async {
    final response = await http.delete(
      Uri.parse('$baseUrl$endpoint'),
      headers: await _headers(),
    );
    return _processResponse(response);
  }

  // Método para obtener los encabezados
  Future<Map<String, String>> _headers() async {
    //final token = 'ghjhjhkjghjgjh'; //SIMULANDO UN TOKEN MAL
    final token = await getToken();
    final headers = {
      'Content-Type': 'application/json',
    };
    headers['Authorization'] = 'Bearer $token';
    //print('mandando para el get-geader:${token}');
    return headers;
  }

// Método para procesar la respuesta
  dynamic _processResponse(http.Response response) {
    print('entrando a * - : getCategoriesPriority-3:${response.statusCode}');

    switch (response.statusCode) {
      case 200:
        // Código 200 OK: La solicitud se realizó correctamente y se obtuvo una respuesta
        return jsonDecode(response.body);
      case 201: //es que insertó
        // Código 200 OK: La solicitud se realizó correctamente y se obtuvo una respuesta
        return jsonDecode(response.body);
      case 204:
        // Código 204 OK: La solicitud se realizó correctamente y se obtuvo una respuesta vacia
        return 'No hay resultados';
      case 401: // Código 401 : No tiene permisos o token expirado
        return jsonDecode(response.body);
      case 404:
        return 'No encontró la dirección statusCode:404';

      default:
        // Otros códigos de estado: Manejo de errores
        throw Exception('_processResponse():statusCode:${response.statusCode} llamando a la ruta:${response.request}');
      // throw Exception('Error ${response.statusCode}: ${response.body}');
    }
  }

  // Método para iniciar sesión con usuario y contraseña
  Future<Map<String, dynamic>> loginWithCredentials(String username, String password) async {
    print('aqui estoy entrando... 1');
    //final endpoint = '${Env.apiEndpoint}/login-apk';
    final endpoint = '${Env.apiEndpoint}/login-apk';
    final body = {
      'email': username,
      'password': password,
    };
    print('aqui estoy entrando... 2');
    try {
      // Realiza la solicitud POST

      // Procesa la respuesta
      return await post(endpoint, body: body);
    } catch (e) {
      // Manejo de errores específico para el login
      print('Error en el login: $e');
      throw Exception('Error en el login:$e');
    }
  }

  // Método para iniciar sesión con usuario y contraseña
  Future<Map<String, dynamic>> registerGlobal(String name,String email, String password,String language,String usser) async {
    print('aqui estoy entrando... 1');
    //final endpoint = '${Env.apiEndpoint}/login-apk';
    final endpoint = '${Env.apiEndpoint}/register';
    final body = {
      'user': usser,
      'password': password,
      'name': name,
      'email': email,
      'language': language,
    };
    print('aqui estoy entrando... 2');
    try {
      // Realiza la solicitud POST

      // Procesa la respuesta
      return await post(endpoint, body: body);
    } catch (e) {
      // Manejo de errores específico para el login
      print('Error en el login: $e');
      throw Exception('Error en el login:$e');
    }
  }

// Método para iniciar sesión con un token de terceros (Google)
  Future<Map<String, dynamic>> loginWithTokenGoogle(String id,String name,String email, String image) async {
    final endpoint = '${Env.apiEndpoint}/google-callback-apk'; // Asegúrate de que este endpoint sea correcto
    final body = {
      'id': id,
      'name': name,
      'email': email,
      'image': image,
    };

    try {
      // Realiza la solicitud POST
    
    // Procesa la respuesta
      return await post(endpoint, body: body);
     
    } catch (e) {
      // Manejo de errores específico para el login con Google
      print('Error en el login con Google: $e');
      throw Exception('Error en el login con Google:$e');
    }
  }

  // Método para iniciar sesión con un token de terceros (Facebook)
  Future<Map<String, dynamic>> loginWithTokenFacebook(String thirdPartyToken) async {
    final endpoint = '/facebook-callback-apk'; // Asegúrate de que este endpoint sea correcto
    final body = {
      'token': thirdPartyToken,
    };

    try {
      // Realiza la solicitud POST
      final response = await post(endpoint, body: body);

      // Procesa la respuesta
      final data = _processResponse(response);

      // Asignar el token al recibir la respuesta, si es necesario
      if (data.containsKey('token')) {
        _token = data['token'];
      } else {
        throw Exception('El token no está presente en la respuesta');
      }

      return data;
    } catch (e) {
      // Manejo de errores específico para el login con Facebook
      print('Error en el login con Facebook: $e');
      throw Exception('Error en el login con Facebook:$e');
    }
  }

  // Método para hacer logout
  Future<bool> logout() async {
    try {

      final endpoint = '${Env.apiEndpoint}/logout'; // Asegúrate de que este endpoint sea correcto
      final response = await get(endpoint);
// Verifica si el mensaje es "Logout exitoso"
      if (response['msg'] == 'Logout exitoso') {
        // Eliminar el token de SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.remove('auth_token');

        // Limpiar la variable local si lo deseas
        _token = null;

        print('Sesión cerrada y token eliminado');
        return true; // Devuelve true si todo está bien
      }
    else
    {
      print('ERROR al cerrar session:  no tenia response[msg]');
      return false;
    }
      
    } catch (e) {
      print('ERROR al cerrar session:$e');
        return false;
      
    }
    
  }
}
