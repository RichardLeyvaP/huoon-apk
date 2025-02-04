import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:huoon/data/models/configuration/configuration_model.dart';
import 'package:huoon/domain/blocs/configuration_bloc/configuration_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

/// ✅ Función global para manejar mensajes en segundo plano
Future<void> handleBackgroudMessage(RemoteMessage message) async {
  print("🔹 Handling a background message: ${message.messageId}");
  print("🔹 Data: ${message.data}");
  print("🔹 Title: ${message.notification?.title}");
  print("🔹 Body: ${message.notification?.body}");
}

class FirebaseApi {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  /// ✅ Obtener el token guardado localmente
  Future<String?> _getSavedToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('firebase_token');
  }

  /// ✅ Guardar el nuevo token localmente
  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('firebase_token', token);
  }

  /// ✅ Inicializar notificaciones locales
  Future<void> initializeLocalNotifications(BuildContext context) async {
    const AndroidInitializationSettings androidInitSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings =
        InitializationSettings(android: androidInitSettings);

    await _localNotifications.initialize(initSettings,
        onDidReceiveNotificationResponse: (NotificationResponse response) {
      if (response.payload != null) {
        print("🔗 Redirigiendo a la ruta: ${response.payload}");
        Navigator.pushNamed(context, response.payload!);
      }
    });
  }

  /// ✅ Inicializar notificaciones de Firebase
  Future<void> initNotifications(BuildContext context) async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    // Inicializar notificaciones locales
    await initializeLocalNotifications(context);

    /// ✅ Manejo de mensajes en segundo plano
    FirebaseMessaging.onBackgroundMessage(handleBackgroudMessage);

    /// ✅ Manejo de mensajes en primer plano
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print("📩 Notificación en primer plano: ${message.notification?.title}");
      print("📩 Cuerpo: ${message.notification?.body}");
      print("📩 Data: ${message.data}");

      String? route = message.data['routeeee'];

      // ✅ Mostrar notificación local
      await _localNotifications.show(
        message.messageId.hashCode,
        message.notification?.title ?? 'Sin título',
        message.notification?.body ?? 'Sin contenido',
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'high_importance_channel', // ID del canal
            'Notificaciones', // Nombre visible del canal
            importance: Importance.max,
            priority: Priority.high,
          ),
        ),
        payload: route, // Enviar la ruta como payload
      );
    });

    /// ✅ Manejo cuando la app se abre desde una notificación
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("📲 La app se ha abierto desde una notificación: ${message.notification?.title}");

      String? route = message.data['routeeee'];
      if (route != null) {
        Navigator.pushNamed(context, route);
      }
    });
  }

  /// ✅ Guardar y actualizar token después del login
  Future<void> saveTokenAfterLogin() async {
    final token = await _firebaseMessaging.getToken();
    print('📌 Token obtenido después del login: $token');

    if (token != null) {
      final savedToken = await _getSavedToken();
      if (savedToken != token) {
        print("📌 El token ha cambiado. Actualizando el backend.");

        // Guardar el nuevo token localmente
        await _saveToken(token);

        // Enviar el nuevo token al backend
        final config = Configuration(tokenNotification: token);
        updateConfiguration(config);
      } else {
        // Enviar el nuevo token al backend
        final config = Configuration(tokenNotification: token);
        updateConfiguration(config);
        print("📌 El token no ha cambiado. No es necesario actualizar el backend.");
      }
    }
  }
}
