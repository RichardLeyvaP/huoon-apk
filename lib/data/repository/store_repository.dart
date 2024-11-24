import 'package:huoon/data/models/store/store_model.dart';
import 'package:huoon/data/services/globalCallApi/apiService.dart';
import 'package:huoon/ui/pages/env.dart';

class StoreRepository {
  final ApiService authService;

  StoreRepository({required this.authService});

  // Método para obtener las tiendas
  Future<dynamic> getStore() async {
    print('Obteniendo tiendas desde la API');
    // final endpoint = '${Env.apiEndpoint}/stores';
    Future.delayed(Duration(seconds: 10));
    try {
      // Llama al servicio y obtiene la respuesta procesada
      // final response = await authService.get(endpoint);
      const response = {
        "store": [
          {
            "id": 1,
            "name": "Arroz",
            "description": "Este es el arroz de la comida de la semana, ahi hay 5kg mas para que no falte",
            "location": "Está en la parte de abajo de la cocina Está en la parte de abajo de la cocina",
          },
          {
            "id": 2,
            "name": "Pasta",
            "description": "10 tubos de pasta",
            "location": "Etsan en el baño",
          },
          {
            "id": 3,
            "name": "Store 23",
            "description": "Market23",
            "location": "lugar23",
          },
          {
            "id": 4,
            "name": "Store 24",
            "description": "Market24",
            "location": "lugar24",
          },
          {
            "id": 5,
            "name": "Store 25",
            "description": "Market25",
            "location": "lugar25",
          },
          {
            "id": 6,
            "name": "Store 26",
            "description": "Market26",
            "location": "Esta en la parte de abajo de la silla del comedor",
          },
          {
            "id": 7,
            "name": "Store 27",
            "description": "Market27",
            "location": "lugar27",
          },
        ]
      };
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
  Future<dynamic> addStore(StoreElement store) async {
    final endpoint = '${Env.apiEndpoint}/stores';
    print('Agregando nueva tienda');

    final body = {
      'name': store.name,
      'location': store.location,
      'description': store.description,
    };

    try {
      // Llama al servicio que maneja la API para agregar la tienda
      final response = await authService.post(endpoint, body: body);
      print('Tienda agregada exitosamente: $response');
      return response;
    } catch (e) {
      print('Error al agregar tienda: $e');
      throw Exception('addStore(): $e');
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
}
