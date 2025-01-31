
import 'package:huoon/data/services/globalCallApi/apiService.dart';
import 'package:huoon/domain/blocs/homeHouse_signal/homeHouse_signal.dart';
import 'package:huoon/ui/pages/env.dart';

class HomeHouseRepository {
  final ApiService authService;

  HomeHouseRepository({required this.authService});

  Future<dynamic> getCategoriesStatusHomeHouse() async {
    print('dando click en la getProduct');
    final endpoint = '${Env.apiEndpoint}/hometype-status-people-apk';
    
    try {
      // Llama al servicio y obtiene la respuesta procesada
      final response = await authService.get(endpoint);
      print('entrando a * - : getCategoriesPriority-2.1;$response');
      // Verificamos si response es un JSON válido
      if (response is Map<String, dynamic>) {
        print('entrando a * - : getCategoriesPriority-2.2');
        // Deserializamos la respuesta a nuestro modelo TaskResponse
        print('entrando a * - : getCategoriesPriority-2.3:${response['productcategories']}');

        // Mapea la lista de categorías desde el JSON
        /*   final List<ProductCP> categories = (response['productcategories'] as List)
            .map((category) => ProductCP.fromJson(category as Map<String, dynamic>))
            .toList();*/

// Verifica el mapeo
        // print('entrando a * - :-Categorías mapeadas: $categories');
        final taskResponse = response;

        // Retornamos el modelo deserializado
        print('entrando a * - : getCategoriesPriority-2.4:$taskResponse');
        return taskResponse;
      } else if (response is String) {
        print('dando click en la imagen-4:$response');
        return response;
      } else {
        print('dando click en la imagen-5:$response');
        throw Exception('Respuesta inesperada del servidor.Revise su conexión');
      }
    } catch (e) {
      print('dando click en la imagen-4:$e');
      // Manejo de errores
      throw Exception('getCategoriesStatusPriority(): $e');
    }
  }

  Future<dynamic> getHomeHouseUsser() async {
    print('dando click en la getProduct');
    final endpoint = '${Env.apiEndpoint}/person-homes';
    
    try {
      // Llama al servicio y obtiene la respuesta procesada
      final response = await authService.post(endpoint,body: {});
      print('entrando a * - : getHomeHouseUsser-2.1;$response');
      // Verificamos si response es un JSON válido
      if (response is Map<String, dynamic>) {
       
        final taskResponse = response;

        // Retornamos el modelo deserializado
        print('entrando a * - : getHomeHouseUsser-2.4:$taskResponse');
        return taskResponse;
      } else if (response is String) {
        print('dando click en la imagenge-HomeHouseUsser-4:$response');
        return response;
      } else {
        
        throw Exception('Respuesta inesperada del servidor.-getHomeHouseUsser-Revise su conexión');
      }
    } catch (e) {
      throw Exception('getHomeHouseUsser(): $e');
    }
  }


  // Método para agregar una casa
Future<dynamic> addHomeHouse() async {
  final endpoint = '${Env.apiEndpoint}/home';
  print('Agregando nueva casa');

  final body = {
    'name': homeNameHH.value,
    'address': homeAddressHH.value,
    'home_type_id': homeTypeIdHH.value??'',
    'residents': residentsHH.value??0,
    'geo_location': geoLocationHH.value,
    'timezone': timezoneHH.value,
    'status_id': statusIdHH.value??'',
    'image': homeImageHH.value,
    'people': peopleHH.value??[],
  };

  try {
    print('Casa agregada exitosamente: $body');
    // Llama al servicio que maneja la API para agregar la casa
    final response = await authService.post(endpoint, body: body);
    print('Casa agregada exitosamente: $response');
    return response;
  } catch (e) {
    print('Error al agregar casa: $e');
    throw Exception('addHomeHouse(): $e');
  }
}



}
