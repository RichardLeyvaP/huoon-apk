import 'package:huoon/data/models/ranking/ranking_model.dart';
import 'package:huoon/data/services/globalCallApi/apiService.dart';
import 'package:huoon/domain/blocs/homeHouse_signal/homeHouse_signal.dart';
import 'package:huoon/ui/pages/env.dart';

class RankingRepository {
  final ApiService authService;

  RankingRepository({required this.authService});

  Future<dynamic> getRanking() async {
    final endpoint = '${Env.apiEndpoint}/get-home-persons';
    final body = {
      'home_id': homeSelectHH.value, 
    };
    print('resultado al devolver los getRanking-$body');
    try {
      // Llama al servicio y obtiene la respuesta procesada
      final response = await authService.post(endpoint, body: body);

      // Verificamos si response es un JSON válido
      if (response is Map<String, dynamic>) {
        // Deserializamos la respuesta a nuestro modelo TaskResponse
        final taskResponse = Ranking.fromJson(response);
        // Retornamos el modelo deserializado
        print('dando click en 1-getRanking:$taskResponse');
        return taskResponse;
      } else if (response is String) {
        print('dando click en 2-getRanking:$response');
        return response;
      } else {
        print('dando click en 3-getRanking:$response');
        throw Exception('Respuesta inesperada del servidor.Revise su conexión');
      }
    } catch (e) {
      print('dando click en 4-getRanking:$e');
      // Manejo de errores
      throw Exception('getRanking(): $e');
    }
  }
  
  //metodo para agregar una tarea
  Future<dynamic> addRanking(int taskId,List<Map<String, dynamic>> people) async {
    final endpoint = '${Env.apiEndpoint}/person-home-warehouse-product';
    final body = {
      'home_id': homeSelectHH.value,
      'task_id': taskId,
      'people': people,
    };
    // Llama al servicio que maneja la API de autenticación para login
    final response = await authService.post(endpoint, body: body);

    print('si estoy devolviendo esto:1-${response}');
  }




  }
