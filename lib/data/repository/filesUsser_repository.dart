import 'dart:io';
import 'package:huoon/data/models/filesUsser/filesUsser_model.dart';
import 'package:huoon/data/services/globalCallApi/apiService.dart';
import 'package:huoon/domain/blocs/homeHouse_signal/homeHouse_signal.dart';
import 'package:huoon/ui/pages/env.dart';

class FilesUsserRepository {
  final ApiService authService;

  FilesUsserRepository({required this.authService});

  // Método para obtener la configuración
  Future<dynamic> getFilesUsser() async {
    print('Obteniendo los archivos');
    final endpoint = '${Env.apiEndpoint}/get-type-files';

    try {
      // Llamamos al servicio API para obtener las configuraciones
      final body = {
      'home_id': homeSelectHH.value,
      'personal': 2,// es lo que le pasas para decirle lo que es
      };
    
      // Llama al servicio y obtiene la respuesta procesada
      final response = await authService.post(endpoint, body: body);
     
          if (response is Map<String, dynamic>) {
        // Procesamos el JSON de respuesta a un modelo o directamente
         final taskResponse = response;

        // Retornamos el modelo deserializado
        print('entrando a * - : getHomeHouseUsser-2.4:$taskResponse');
        return taskResponse;
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
  Future<dynamic> storeFilesUsser(FileElement? fileUsser,String sendFilePath) async {
   final endpoint = '${Env.apiEndpoint}/file';
    // Extraer el nombre del archivo sin la extensión
  String nameFile = File(sendFilePath).uri.pathSegments.last.split('.').first;
final body = {

 
  "home_id": homeSelectHH.value,
  "description": fileUsser?.description??'Sin descripción', 
  "name": fileUsser?.name ?? nameFile,
  "personal":  fileUsser?.personal?? 1,
 "date": fileUsser?.date?.toIso8601String() ?? DateTime.now().toIso8601String(),
  //  "home_id": homeSelectHH.value,
  // "description": "descripcion de pruebaRLP",
  // "name": 'prueba jsonRLP',
  // "personal":  1,
  // "date": '2022-10-10 00:00:00',

};

final File file = File(sendFilePath);

try {
  final response = await authService.postWithFile(endpoint, body: body, file: file);
  print('Respuesta: $response');  
  
      return response; 
    } catch (e) {
      print('Error actualizando configuración: $e');
      throw Exception('Error en updateConfiguration(): $e');
    }
  }

  // Método para eliminar una configuración
  Future<dynamic> deleteFilesUsserRepository(int id) async {
    final endpoint = '${Env.apiEndpoint}/file-destroy';
final body = {
      'id': id,
    };
    // Llama al servicio que maneja la API de autenticación para login
    try {
       final response = await authService.post(endpoint, body: body);
      print('Respuesta después de eliminar configuración: $response');
      return response;
    } catch (e) {
      print('Error eliminando configuración: $e');
      throw Exception('Error en deleteConfiguration(): $e');
    }
  }
}
