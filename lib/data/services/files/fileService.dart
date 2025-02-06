
import 'package:flutter/material.dart';
import 'package:huoon/domain/blocs/filesUsser_signal/fileUsser_service.dart';
import 'package:huoon/ui/util/util_class.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class FileService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();

  // Inicializar las notificaciones
  static void initNotifications() {
    const AndroidInitializationSettings androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings settings = InitializationSettings(android: androidSettings);
    _notificationsPlugin.initialize(settings);
  }

  // Método para manejar la visualización o descarga del archivo
  static Future<void> handleFile(BuildContext context, String url, int id) async {
    // Primero pedimos los permisos de almacenamiento
    //await requestStoragePermission();

    // Después, procedemos con el diálogo
    _showDownloadDialog(context, url,id);
  }

  // Diálogo para elegir entre abrir o descargar el archivo
  static void _showDownloadDialog(BuildContext context, String url,int id) {
    final scaffoldMessenger = ScaffoldMessenger.of(context); // Guarda la referencia


    showDialog(
  context: context,
  builder: (context) => AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    title: Row(
      children: [
        Icon(Icons.insert_drive_file, color: Colors.blue),
        SizedBox(width: 10),
        Text("Archivo", style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    ),
    content: Text("¿Qué deseas hacer con el archivo?", 
      style: TextStyle(fontSize: 16),
    ),
    actions: [
      TextButton.icon(
        onPressed: () async {
          Navigator.pop(context);
          await _downloadAndOpen(url, scaffoldMessenger);
        },
        icon: Icon(Icons.open_in_new, color: Colors.blue),
        label: Text("Abrir"),
      ),
      TextButton.icon(
        onPressed: () async {
          Navigator.pop(context);
          await _downloadFile(url, scaffoldMessenger);
        },
        icon: Icon(Icons.download, color: Colors.green),
        label: Text("Descargar"),
      ),
      TextButton.icon(
        onPressed: () async {
          Navigator.pop(context);
          await deleteFilesUsser(id);
        },
        icon: Icon(Icons.delete, color: Colors.red),
        label: Text("Eliminar"),
      ),
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: Text("Cancelar", style: TextStyle(color: Colors.red)),
      ),
    ],
  ),
);

  }

  // Descarga y abre el archivo
  static Future<void> _downloadAndOpen(String url, ScaffoldMessengerState scaffoldMessenger) async {
    String? path = await _downloadFile(url, scaffoldMessenger);
    if (path != null) {
      OpenFile.open(path);
    }
  }

  // Descarga el archivo y lo guarda en el dispositivo
  static Future<String?> _downloadFile(String url, ScaffoldMessengerState scaffoldMessenger) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      String filePath = "${dir.path}/${url.split('/').last}";
      File file = File(filePath);
      var response = await http.get(Uri.parse(url));
      await file.writeAsBytes(response.bodyBytes);

      scaffoldMessenger.showSnackBar(SnackBar(content: Text("Descarga completada: ${file.path}"))); // Notificación

      // Mostrar notificación de descarga
      _showDownloadNotification(filePath);

      return filePath;
    } catch (e) {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text("Error al descargar el archivo")));
      debugPrint("Error al descargar: $e");
      return null;
    }
  }



  // Muestra una notificación cuando la descarga termine
  static void _showDownloadNotification(String filePath) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'download_channel', 'Descargas',
      importance: Importance.high, priority: Priority.high, showWhen: true,
    );

    const NotificationDetails notificationDetails = NotificationDetails(android: androidDetails);
    await _notificationsPlugin.show(
      0, // ID de la notificación
      'Descarga completada',
      'Archivo guardado en: $filePath',
      notificationDetails,
    );
  }
}
