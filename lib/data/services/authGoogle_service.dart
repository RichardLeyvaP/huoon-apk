import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:huoon/data/models/login/login_model.dart';
import 'package:huoon/domain/blocs/login_bloc/login_service.dart';
import 'package:huoon/domain/blocs/login_bloc/login_signal.dart';
import 'package:huoon/ui/pages/env.dart';
import 'package:shared_preferences/shared_preferences.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
  ],
);

// Future<void> loginWithGoogle(context) async {
//   print('resp1- loginWithGoogle()');
//   try {
//     await _googleSignIn.signOut();
//     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//     if (googleUser != null) {
//       print('resp1- loginWithGoogle():idToken:(googleUser != null)');
//       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//       // Verifica si idToken es nulo
//       if (googleAuth.idToken != null) {
//         String idToken = googleAuth.idToken!;
//         //  print('resp1- loginWithGoogle():idToken:$idToken');
//         print('resp1- loginWithGoogle():Name:${googleUser.displayName}');
//         print('resp1- loginWithGoogle():photo:${googleUser.photoUrl}');
//         // Ahora, manda este token a tu API Laravel
//         //  await _sendTokenToApi(idToken);
//         Map<String, dynamic> userData = {
//           'name': googleUser.displayName,
//           'email': googleUser.email,
//           'pictureUrl': googleUser.photoUrl,
//         };

//         GoRouter.of(context).go(
//           '/HomePrincipal'
//         );
//         _googleSignIn.signOut();
//       } else {
//         print('resp1- loginWithGoogle():idToken:ERROR:idToken es null');
//       }
//     }
//   } catch (error) {
//     print('resp1- loginWithGoogle():idToken:ERROR:$error');
//     print(error);
//   }
// }


Future<void> loginWithGoogle(context) async {
  print('resp1- loginWithGoogle()');
  try {
     await _googleSignIn.signOut();
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser != null) {
      print('resp1- loginWithGoogle():idToken:(googleUser != null)');
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      print("Google User: ${googleUser}");
print("Google Auth: ${googleAuth.idToken}");

      // Verifica si idToken es nulo
      if (googleAuth.idToken != null) {
        String idToken = googleAuth.idToken!;
        //  print('resp1- loginWithGoogle():idToken:$idToken');
        print('resp1- loginWithGoogle():Name:${googleUser.displayName}');
        print('resp1- loginWithGoogle():photo:${googleUser.photoUrl}');
        // Ahora, manda este token a tu API Laravel
        //  await _sendTokenToApi(idToken);
        Map<String, dynamic> userData = {
          'name': googleUser.displayName,
          'email': googleUser.email,
          'pictureUrl': googleUser.photoUrl,
        };
   // Muestra un SnackBar que no se cierra automáticamente
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: const Text('Iniciando sessión, espere un momento...'),
    duration: const Duration(days: 1), // Duración muy larga para que no se cierre automáticamente   
        // Cierra el SnackBar manualmente
       // ScaffoldMessenger.of(context).hideCurrentSnackBar();
      
  ),
);
        //llamando a la api para obtener un token
    bool resultLogin =   await loginGoogle(googleUser.id,googleUser.displayName ,googleUser.email,googleUser.photoUrl);

      if(resultLogin == true)   // El usuario ha iniciado sesión correctamente
      {
               // Crear un objeto Login con los datos que has obtenido
final loginData = Login(
  id: googleUser.hashCode, // Reemplaza con el valor real
  userName: googleUser.displayName!, // Reemplaza con el valor real
  email: googleUser.email, // Reemplaza con el valor real
  token: idToken, // Reemplaza con el valor real
);

// Asignar el objeto Login a currentUserLG
currentUserLG.value = loginData;
ScaffoldMessenger.of(context).hideCurrentSnackBar();

        GoRouter.of(context).go(
          '/HomePrincipal'
        );

      }
      else//no conecto con la base de datos o dio un error
      {
      signOutFromGoogle();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No fue posible, Intentelo nuevamente')),
      );
      }

       // _googleSignIn.signOut();
      } else {
        print('resp1- loginWithGoogle():idToken:ERROR:idToken es null');
      }
    }
  } catch (error) {
    print('resp1- loginWithGoogle():idToken:ERROR:$error');
    print(error);
  }
}

Future<bool> signOutFromGoogle() async {
  try {
    if (_googleSignIn.currentUser != null) {
  await _googleSignIn.signOut();
  print("Sesión cerrada correctamente.");
} else {
  print("No hay ninguna sesión activa.");
}

    return true;
  } on Exception catch (_) {
    return false;
  }
}

Future<void> _sendTokenToApi(String idToken) async {
  final response = await http.post(
    Uri.parse('${Env.apiEndpoint}/auth/google-login'),
    body: {
      'id_token': idToken,
    },
  );

  if (response.statusCode == 200) {
    // Login exitoso
    print('Login exitoso');
    final data = json.decode(response.body);
    // Aquí puedes manejar la respuesta, como guardar el token de sesión o navegar a otra página
    await _saveToken(data['token']);
  } else {
    // Error en el login
    print('Error al iniciar sesión: ${response.body}');
  }
}

Future<void> _saveToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('auth_token', token);
}

