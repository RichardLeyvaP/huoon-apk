import 'dart:convert';

import 'package:huoon/data/models/finances/finances_model.dart';
import 'package:huoon/data/services/globalCallApi/apiService.dart';
import 'package:huoon/domain/blocs/IncomeExpenses_bloc/incomeExpenses_signal.dart';
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

 
 //aqui response no est allegando statusCode, revisar eso
    print('si estoy addIncomeExpenses esto:1-${response}');
      if (response.statusCode == 200) {
          final responseData = json.decode(response.body);
          // Maneja la respuesta de la API, como los datos del usuario o token
          print('resp- Login exitoso: $responseData');
        } else if (response.statusCode == 201) {
          final responseData = json.decode(response.body);
        }
      
    } catch (e) {
      print('resp- Error al intentar guardar los datos catch: $e');
    }
   
  }

//metodo para agregar una tarea
  Future<dynamic> getIncomeExpenses(homeId,type) async {
    final endpoint = '${Env.apiEndpoint}/get-type-finance';
    final body = {
      'home_id': homeId,
      'type': type,
    };
    // Llama al servicio que maneja la API de autenticación para login
    try {
       final response = await authService.post(endpoint, body: body);

 

// Convierte el JSON en un objeto Finances.
final financesData = Finances.fromJson(response);

// Asigna el primer elemento de la lista de finances a financeIE.

 financeIE.value = financesData.finances.isNotEmpty ? financesData.finances : null;
 print('Aqui esta las finanzas:${financeIE.value}'); // Debe mostrar una lista con elementos

 
      
    } catch (e) {
      print('resp- Error al intentar guardar los datos catch: $e');
    }
   
  }


}
