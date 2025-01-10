import 'dart:convert';

import 'package:huoon/data/models/chatIA/chat_IA_model.dart';
import 'package:huoon/data/models/store/store_model.dart';
import 'package:huoon/data/services/globalCallApi/apiService.dart';
import 'package:huoon/ui/pages/env.dart';

class ChatIRepository {
  final ApiService authService;

  ChatIRepository({required this.authService});

  // Método para obtener las tiendas
  Future<String> getAnswerIA(String question,String issue) async {
    print('Obteniendo tiendas desde la API');
    final endpoint = '${Env.apiEndpoint}/ask-ai';
   
    final body = {
      'question': question,
      'issue': issue,// es lo que le pasas para decirle lo que es
      };
    try {
      // Llama al servicio y obtiene la respuesta procesada
      final response = await authService.post(endpoint, body: body);

      print('asi esta devolviendo los almacenes:${response}');
      // Verificamos si response es un JSON válido
      if (response is Map<String, dynamic>) {
        // Deserializamos la respuesta a nuestro modelo StoreResponse
          // Convertimos el Map a un String JSON
  String jsonString = jsonEncode(response);

  // Parseamos el JSON a un objeto ChatIa
  ChatIa chat = chatIaFromJson(jsonString);

  // Ahora puedes usar el objeto ChatIa
  print('asi esta devolviendo los almacenes - ${chat.question }');
  print('asi esta devolviendo los almacenes - ${chat.answer }');
  print(chat.answer);
  String storeResponse = chat.answer; 
        
        return storeResponse;
      } else if (response is String) {
        print('Respuesta en formato String: $response');
        return response;
      } else {
        print('Respuesta inesperada del servidor: $response');
        throw Exception('Respuesta inesperada del servidor. Revise su conexión');
      }
    } catch (e) {
      print('Error obteniendo tiendas: $e');
      throw Exception('getStore(): $e');
    }
  }

  // Método para obtener las tiendas
  Future<String> addChatIa(String module,String answerIa,String question) async {
    print('Obteniendo tiendas desde la API');
    final endpoint = '${Env.apiEndpoint}/ask-ai-module';
   
    final body = { 
      'module': module,
      'question': question,// es lo que le pasas para decirle lo que es
      'answer': answerIa,// es lo que le pasas para decirle lo que es
      };
    try {
      // Llama al servicio y obtiene la respuesta procesada
      final response = await authService.post(endpoint, body: body);

      print('asi esta devolviendo los almacenes:${response}');
      // Verificamos si response es un JSON válido
      if (response is String) {
        print('Respuesta en formato String: $response');
        return response;
      } else {
        print('Respuesta inesperada del servidor: $response');
        throw Exception('Respuesta inesperada del servidor. Revise su conexión');
      }
    } catch (e) {
      print('Error obteniendo tiendas: $e');
      throw Exception('getStore(): $e');
    }
  }

 



}
