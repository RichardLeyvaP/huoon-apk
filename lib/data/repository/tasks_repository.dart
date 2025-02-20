import 'package:huoon/data/models/tasks/tasks_model.dart';
import 'package:huoon/data/services/globalCallApi/apiService.dart';
import 'package:huoon/domain/blocs/homeHouse_signal/homeHouse_signal.dart';
import 'package:huoon/domain/blocs/task_cat_state_prior.dart/task_cat_state_prior_signal.dart';
import 'package:huoon/domain/blocs/tasks/tasks_signal.dart';
import 'package:huoon/ui/pages/env.dart';

class TasksRepository {
  final ApiService authService;

  TasksRepository({required this.authService});

  Future<dynamic> getCategoriesStatusPriority() async {
    print('dando click en la getProduct');
    final endpoint = '${Env.apiEndpoint}/category-status-priority-apk';
    final body = {'home_id':  homeSelectHH.value};
    try {
      // Llama al servicio y obtiene la respuesta procesada
      final response = await authService.post(endpoint, body: body);
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

  Future<dynamic> getTasksRepository(date) async {
    final endpoint = '${Env.apiEndpoint}/task-date-apk';
    final body = {
      'start_date': date ,
      'home_id':  homeSelectHH.value,
      };

    try {
      // Llama al servicio y obtiene la respuesta procesada
      final response = await authService.post(endpoint, body: body);

      // Verificamos si response es un JSON válido
      if (response is Map<String, dynamic>) {
        // Deserializamos la respuesta a nuestro modelo TaskResponse

        final taskResponse = Task.fromJson(response);
        // Retornamos el modelo deserializado
        print('dando click en la imagen-3:$taskResponse');
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
      throw Exception('getTasks(date): $e');
    }
  }

  void showTasks(String date) async {
    try {
      final taskResponse = await getTasksRepository(date);

      // Puedes usar taskResponse.tasks para mostrar los datos
      for (var task in taskResponse.tasks) {
        print('Tarea: ${task.title}');
      }
    } catch (e) {
      print('Error en showTasks: $e');
    }
  }

  List<Map<String, dynamic>> getTaskFamiliesFromSelectedPersons(List selectedTaskpersons) {
    print('eeee-personas:${selectedTaskpersons.length}');
    return selectedTaskpersons.map((p) {
      print('eeee-personas:${p.id}');
      return {
        "role_id": p.rolId??1, // Valor fijo por ahora
        "person_id": p.id, // Aquí p.id es el ID de la persona
        
        "home_id": homeSelectHH.value,
      };
    }).toList();
  }

//metodo para agregar una tarea
  Future<dynamic> addTasks(notificationDate,notificationTime,TaskElement task) async {
    final endpoint = '${Env.apiEndpoint}/task';
    //  const endpoint = '${Env.apiEndpoint}/task-test';
    List<Map<String, dynamic>> peopleSelected = getTaskFamiliesFromSelectedPersons(selecteFamilyCSP.value!);
    final body = {
      //fecha y hora de notificar la tarea
      'notificationDate': notificationDate,
      'notificationTime': notificationTime,
      //
      'home_id': homeSelectHH.value,
      'title': task.title,
      'description': task.description,
      'start_date': task.startDate,
      'end_date': task.endDate,
      'priority_id': task.priorityId, //llegando null
      'parent_id': task.parentId,
     // 'status_id': task.statusId,//poner aqui pendiente
      'category_id': task.categoryId,
      'recurrence': task.recurrence,
      'estimated_time': task.estimatedTime ?? 0, //todo fijo por duda
      'comments': 'comentario de prueba', //todo fijo por duda
      'attachments': 'image/test.png', //todo fijo por duda
      'geo_location': task.geoLocation == "" ? null : task.geoLocation,
      'people': peopleSelected,
      //datos nuevos
      'type': task.type,
      'start_time': task.startTime,
      'end_time': task.endTime,

    };
    // print('si estoy devolviendo esto:1-BODY-${body}');
    // Llama al servicio que maneja la API de autenticación para login
    final response = await authService.post(endpoint, body: body);
    print('si estoy devolviendo esto:1-BODY-${body}');
    print('si estoy devolviendo esto:1-${response}');
  }

//metodo para agregar una tarea
  Future<dynamic> updateTasksRepository(TaskElement task) async {
    final endpoint = '${Env.apiEndpoint}/task-update';
    //  const endpoint = '${Env.apiEndpoint}/task-test';
    List<Map<String, dynamic>> peopleSelected = [];
    if(selecteFamilyCSP.value != null)
  {
     peopleSelected = getTaskFamiliesFromSelectedPersons(selecteFamilyCSP.value!);

  }
    
    final body = {
      'id': task.id,
      'title': task.title,
      'description': task.description,
      'start_date': task.startDate,
      'end_date': task.endDate,
      'priority_id': task.priorityId, //llegando null
      'parent_id': task.parentId,
      'status_id': task.statusId,
      'category_id': task.categoryId,
      'recurrence': task.recurrence,
      'estimated_time': task.estimatedTime ?? 0, //todo fijo por duda
      'comments': 'comentario de prueba', //todo fijo por duda
      'attachments': 'image/test.png', //todo fijo por duda
      'geo_location': task.geoLocation == "" ? null : task.geoLocation,
      'people': personRolesTA.value,
      //datos nuevos
      'type': task.type,
      'start_time': task.startTime,
      'end_time': task.endTime,
    };
    
    print('si estoy devolviendo esto:1-BODY-New:${body}');
    // Llama al servicio que maneja la API de autenticación para login
    final response = await authService.post(endpoint, body: body);

    print('si estoy devolviendo esto:1-New-${response}');
  }

  Future<dynamic> deleteTasks(int id) async {
    final endpoint = '${Env.apiEndpoint}/task-destroy';
    final body = {
      'id': id,
    };
    try {
      final response = await authService.post(endpoint, body: body);

      print('Intentando Eliminar la Tarea con-response: $response');
      print('Intentando Eliminar la Tarea con id: $id');
    } catch (e) {
      print('Error en showTasks: $e');
    }
  }
}
