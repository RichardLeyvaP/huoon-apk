import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:huoon/data/models/configuration/configuration_model.dart';
import 'package:huoon/domain/blocs/configuration_bloc/configuration_service.dart';
import 'package:shared_preferences/shared_preferences.dart';




/// ✅ Función global para manejar mensajes en segundo plano
Future<void> handleBackgroudMessage(RemoteMessage message) async {
  print("🔹 Handling a background message: ${message.messageId}");
  print("🔹 Data: ${message.data}");
  print("🔹 Title: ${message.notification?.title}");
  print("🔹 Body: ${message.notification?.body}");
} 
class FirebaseApi {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

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

  /// ✅ Inicializar notificaciones (sin actualizar token aquí)
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    /// ✅ Manejo de mensajes en segundo plano
    FirebaseMessaging.onBackgroundMessage(handleBackgroudMessage);

    /// ✅ Manejo de mensajes en primer plano
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("📩 Notificación en primer plano: ${message.notification?.title}");
      print("📩 Cuerpo: ${message.notification?.body}");
      print("📩 Data: ${message.data}");
      final noti = message.data['routeeee'] ?? 'Valor predeterminado';
      print("📩 Routeeee: $noti");
    });

    /// ✅ Manejo de cuando la app se lanza desde una notificación
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("📲 La app se ha abierto desde una notificación: ${message.notification?.title}");
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
