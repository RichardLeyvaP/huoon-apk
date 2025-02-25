import 'package:huoon/data/models/store/store_model.dart';
import 'package:huoon/data/services/globalApiService.dart';
import 'package:huoon/ui/pages/env.dart';

class StoreRepository {
  final ApiService authService;

  StoreRepository({required this.authService});

  // Método para obtener las tiendas
  Future<dynamic> getStore(int homeId) async {
    print('Obteniendo tiendas desde la API');
    final endpoint = '${Env.apiEndpoint}/person-warehouse-home';
    Future.delayed(Duration(seconds: 10));
    final body = {'home_id': homeId};
    try {
      // Llama al servicio y obtiene la respuesta procesada
      final response = await authService.post(endpoint, body: body);

      print('asi esta devolviendo los almacenes:${response}');
      // Verificamos si response es un JSON válido
      if (response is Map<String, dynamic>) {
        // Deserializamos la respuesta a nuestro modelo StoreResponse
        final storeResponse = Store.fromJson(response);
        // Retornamos el modelo deserializado
        print('Tiendas obtenidas: $storeResponse');
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

  // Método para agregar una tienda
  Future<dynamic> addStore(StoreElement store, int homeId) async {
    final endpoint = '${Env.apiEndpoint}/person-warehouse';
    print('Agregando nueva tienda');

    final body = {
      'home_id': homeId,
      'title': store.title,
      'status': store.status,
      'location': store.location,
      'description': store.description,
    };

    try {
      print('Tienda agregada exitosamente: $body');
      // Llama al servicio que maneja la API para agregar la tienda
      final response = await authService.post(endpoint, body: body);
      print('Tienda agregada exitosamente: $response');
      return response;
    } catch (e) {
      print('Error al agregar tienda: $e');
      throw Exception('addStore(): $e');
    }
  }

  // Método para agregar una tienda
  Future<dynamic> updateStoreRepository(StoreElement store, int homeId) async {
    final endpoint = '${Env.apiEndpoint}/person-warehouse';
    print('Agregando nueva tienda');

    final body = {
      'home_id': homeId,
      'title': store.title,
      'id': store.id,
      'status': store.status,
      'location': store.location,
      'description': store.description,
    };

    try {
      // Llama al servicio que maneja la API para agregar la tienda
      final response = await authService.put(endpoint, body: body);
      print('Tienda modificada exitosamente: $response');
      print('Tienda modificada exitosamente: $body');
      return response;
    } catch (e) {
      print('Error al modificar tienda: $e');
      throw Exception('updateStoreRepository(): $e');
    }
  }

  // Método para obtener las categorías y estados de las tiendas
  Future<dynamic> getCategoriesPriority() async {
    print('Obteniendo categorías y estados de las tiendas');
    final endpoint = '${Env.apiEndpoint}/storecategory-storestatus-apk';

    try {
      // Llama al servicio y obtiene la respuesta procesada
      final response = await authService.get(endpoint);
      print('Respuesta obtenida: $response');

      if (response is Map<String, dynamic>) {
        print('Deserializando categorías y estados de tiendas');
        return response; // Retorna la respuesta deserializada
      } else if (response is String) {
        print('Respuesta en formato String: $response');
        return response;
      } else {
        print('Respuesta inesperada del servidor: $response');
        throw Exception('Respuesta inesperada del servidor. Revise su conexión');
      }
    } catch (e) {
      print('Error obteniendo categorías y estados: $e');
      throw Exception('getCategoriesPriority(): $e');
    }
  }

// Eliminar un almacén
  Future<dynamic> deleteStoreRepository(int id) async {
    final endpoint = '${Env.apiEndpoint}/person-warehouse-destroy';
    final body = {
      'id': id,
    };
    print('mandando los datos para eliminar:$id');
    print('mandando los datos para eliminar-body:$body');
    try {
      final response = await authService.post(endpoint, body: body);

      print('Intentando Eliminar el almacén con-response: $response');
    } catch (e) {
      print('Error en showTasks: $e');
    }
  }
}
