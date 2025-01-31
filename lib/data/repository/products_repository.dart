import 'package:huoon/data/models/products/product_model.dart';
import 'package:huoon/data/services/globalCallApi/apiService.dart';
import 'package:huoon/domain/blocs/homeHouse_signal/homeHouse_signal.dart';
import 'package:huoon/ui/pages/env.dart';
import 'package:huoon/ui/pages/rol-admin/Task/selectDays/utils.dart';

class ProductsRepository {
  final ApiService authService;

  ProductsRepository({required this.authService});

  Future<dynamic> getProduct(int homeId, int warehouseId) async {
    final endpoint = '${Env.apiEndpoint}/person-home-warehouse-products';
    final body = {
      'home_id': homeSelectHH.value, 
      'warehouse_id': warehouseId, //todo valor fijo
    };
    print('resultado al devolver los producto-$body');
    try {
      // Llama al servicio y obtiene la respuesta procesada
      final response = await authService.post(endpoint, body: body);

      // Verificamos si response es un JSON válido
      if (response is Map<String, dynamic>) {
        print('dando click en la imagen-3-123:$response');
        // Deserializamos la respuesta a nuestro modelo TaskResponse
        final taskResponse = Product.fromJson(response);
        // Retornamos el modelo deserializado
        print('dando click en la imagen-3-123:$taskResponse');
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
      throw Exception('getProduct(): $e');
    }
  }

//metodo para agregar una tarea
  Future<dynamic> deleteProduct(int id) async {
    final endpoint = '${Env.apiEndpoint}/person-home-warehouse-product-destroy';
    final body = {
      'id': id,
    };
    // Llama al servicio que maneja la API de autenticación para login
    final response = await authService.post(endpoint, body: body);

    print('si estoy devolviendo esto:1-${response}');
  }

//metodo para agregar una tarea
  Future<dynamic> addProduct(ProductElement product) async {
    final endpoint = '${Env.apiEndpoint}/person-home-warehouse-product';
    final body = {
      'home_id': homeSelectHH.value,
      'warehouse_id': product.warehouseId,
      'status_id': product.statusId,
      'category_id': product.categoryId,
      'name': product.productName,
      'unit_price': product.unitPrice,
      'quantity': product.quantity,
      'total_price': multiplyAndConvert(product.quantity!, product.unitPrice!), //(int intValue, String stringValue)
      'purchase_date': product.purchaseDate,
      'purchase_place': product.purchasePlace,
      'expiration_date': product.expirationDate?.toLocal().toIso8601String().split('T')[0], // Solo la fecha
      'brand': product.brand,
      'additional_notes': product.additionalNotes,
      'image': product.image,
    };
    // Llama al servicio que maneja la API de autenticación para login
    final response = await authService.post(endpoint, body: body);

    print('si estoy devolviendo esto:1-${response}');
  }


//metodo para agregar una tarea
  Future<dynamic> updateProductRepository(ProductElement product) async {
    final endpoint = '${Env.apiEndpoint}/person-home-warehouse-product-update';
    final body = {
      'home_id': homeSelectHH.value,
      'id': product.id,
      'product_id': product.productId,      
      'warehouse_id': product.warehouseId,
      'status_id': product.statusId,
      'category_id': product.categoryId,
      'name': product.productName,
      'unit_price': product.unitPrice,
      'quantity': product.quantity,
      'total_price': multiplyAndConvert(product.quantity!, product.unitPrice!), //(int intValue, String stringValue)
      'purchase_date': product.purchaseDate,
      'purchase_place': product.purchasePlace,
      'expiration_date': product.expirationDate?.toLocal().toIso8601String().split('T')[0], // Solo la fecha
      'brand': product.brand,
      'additional_notes': product.additionalNotes,
      'image': product.image,
    };
    // Llama al servicio que maneja la API de autenticación para login
    final response = await authService.post(endpoint, body: body);

    print('al modificar producto recibo esto como respuesta:1-${response}');
  }


  Future<dynamic> getCategoriesPriority() async {
    print('dando click en la getProduct');
    final endpoint = '${Env.apiEndpoint}/productcategory-productstatus-apk';
    print('entrando a * - : getCategoriesPriority-2.1-product;INICIO');
    try {
      // Llama al servicio y obtiene la respuesta procesada
      final response = await authService.get(endpoint);
      print('entrando a * - : getCategoriesPriority-2.1-product;$response');
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
      throw Exception('getCategoriesPriority(): $e');
    }
  }
}
