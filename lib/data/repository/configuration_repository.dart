import 'package:huoon/data/models/configuration/configuration_model.dart';
import 'package:huoon/data/services/globalCallApi/apiService.dart';
import 'package:huoon/ui/pages/env.dart';

class ConfigurationRepository {
  final ApiService authService;

  ConfigurationRepository({required this.authService});

  // Método para obtener la configuración
  Future<dynamic> getConfigurations() async {
    print('Obteniendo configuraciones');
    final endpoint = '${Env.apiEndpoint}/configuration-show';

    try {
      // Llamamos al servicio API para obtener las configuraciones
      final response = await authService.get(endpoint);
      /* const response = {
        "configurations": [
          {
            "appName": "Mi Aplicación",
            "appVersion": "1.0.0",
            "language": "en",
            "defaultCurrency": "USD",
            "themeColor": "#FFFFFF",
            "backgroundColor": "#F0F0F0",
            "textColor": "#000000",
            "buttonColor": "#007BFF",
            "isDarkModeEnabled": true,
            "notificationsEnabled": true,
            "apiEndpoint": "https://api.miapp.com",
            "connectionTimeout": 30,
            "retryAttempts": 3,
            "useBiometricAuth": true,
            "requirePinForSensitiveActions": true,
            "storagePath": "/data/app",
            "maxCacheSize": 1024,
            "autoUpdateEnabled": true,
            "supportContactEmail": "soporte@miapp.com",
            "lastSyncTime": "2024-10-03T12:34:56.789Z",
            "fontSize": 14
          }
        ]
      };*/

      if (response is Map<String, dynamic>) {
        // Procesamos el JSON de respuesta a un modelo o directamente
        print('Obteniendo configuraciones-Respuesta de configuraciones obtenida: ${response['configurations']}');
        // Convertir la respuesta JSON al modelo Configuration
        // Extraemos la lista de configuraciones
        List<Configuration> configurationsList = (response['configurations'] as List<dynamic>).map((configJson) {
          return Configuration.fromJson(configJson);
        }).toList();
        // Suponiendo que solo necesitas la primera configuración
        final configuration = configurationsList.isNotEmpty ? configurationsList.first : null;
        return configuration;
        // return response;
      } else if (response is String) {
        print('Respuesta en formato string: $response');
        return response;
      } else {
        throw Exception('Respuesta inesperada del servidor. Revise su conexión.');
      }
    } catch (e) {
      print('Error obteniendo configuraciones: $e');
      throw Exception('Error en getConfigurations(): $e');
    }
  }

  // Método para agregar una nueva configuración
  Future<dynamic> addConfigurationLanguage(String language) async {
    final endpoint = '${Env.apiEndpoint}/configuration';

    final body = {
      'language': language,
    };

    try {
      final response = await authService.put(endpoint, body: body);
      print('Respuesta después de agregar configuración: $response');
      return response;
    } catch (e) {
      print('Error agregando configuración: $e');
      throw Exception('Error en addConfiguration(): $e');
    }
  }

  // Método para actualizar una configuración
  Future<dynamic> updateConfiguration(Configuration configData) async {
    final endpoint = '${Env.apiEndpoint}/configuration';

    final body = {
      'language': configData.language,
      'home': configData.home,
      'tokenNotification': configData.tokenNotification,
      };
    //final body = configData.toJson(); // Convertir el modelo a 
    
    print('_onConfigurationSubmitted entrando y con endpoint:${endpoint}');
    print('_onConfigurationSubmitted entrando y con body:${body}');
    try {
      final response = await authService.put(endpoint, body: body);
      print('Respuesta después de actualizar configuración: $response');
      return response;
    } catch (e) {
      print('Error actualizando configuración: $e');
      throw Exception('Error en updateConfiguration(): $e');
    }
  }

  // Método para eliminar una configuración
  Future<dynamic> deleteConfiguration(int id) async {
    final endpoint = '${Env.apiEndpoint}/configurations/$id';

    try {
      final response = await authService.delete(endpoint);
      print('Respuesta después de eliminar configuración: $response');
      return response;
    } catch (e) {
      print('Error eliminando configuración: $e');
      throw Exception('Error en deleteConfiguration(): $e');
    }
  }
}
