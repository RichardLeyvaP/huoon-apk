import 'dart:convert';

import 'package:huoon/data/services/globalCallApi/apiService.dart';
import 'package:huoon/ui/pages/env.dart';

class IncomeExpensesRepository {
  final ApiService authService;

  IncomeExpensesRepository({required this.authService});


//metodo para agregar una tarea
  Future<dynamic> addIncomeExpenses(homeId,spent,income,date,description,type,method,image) async {
    final endpoint = '${Env.apiEndpoint}/finance';
    final body = {
      'home_id': homeId,
      'spent': spent,
      'income': income,
      'date': date.toString(),
      'description': description,
      'type': type,//personal o del hogar
      'method': method,
      'image': image,
    };
    // Llama al servicio que maneja la API de autenticación para login
    try {
       final response = await authService.post(endpoint, body: body);

    print('si estoy addIncomeExpenses esto:1-${response}');
      if (response.statusCode == 200) {
          final responseData = json.decode(response.body);
          // Maneja la respuesta de la API, como los datos del usuario o token
          print('resp- Login exitoso: $responseData');
        } else {
          print('resp- Error al intentar guardar los datos: ${response.statusCode}');
        }
      
    } catch (e) {
      print('resp- Error al intentar guardar los datos catch: $e');
    }
   
  }


}
