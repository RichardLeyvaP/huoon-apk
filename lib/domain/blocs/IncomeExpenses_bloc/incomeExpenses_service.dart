import 'package:huoon/data/repository/income_expenses_repository.dart';
import 'package:huoon/data/services/globalCallApi/apiService.dart';
import 'package:huoon/domain/blocs/IncomeExpenses_bloc/incomeExpenses_signal.dart';

// Este es el servicio que maneja la lógica de incomeexpenses

final iExpensesRepository = IncomeExpensesRepository(authService: ApiService());


// Método para enviar el producto a la API
Future<void> submitIncomeExpenses(homeId,spent,income,date,description,type,method,image) async {
  try {
    await iExpensesRepository.addIncomeExpenses(homeId,spent,income,date,description,type,method,image);

  } catch (error) {
   
  } finally {
 
  }
}

// Mostrar estadistica dato el tipo (Todas,Personal,Hogar)
Future<void> getIncomeExpenses(homeId,type) async {
  try {
    await iExpensesRepository.getIncomeExpenses(homeId,type);

  } catch (error) {
   
  } finally {
 
  }
}
// Método para hacer incomeexpenses
void clearIncomeExpensesSignals() {
  // Restablecer las señales a sus valores predeterminados
incomeExpensesSelectIE.value = null;
personalHomeSelectIE.value = null;
description_income_expenseIE.value = '';
money_amountIE.value = '';
date_income_expenseIE.value = DateTime.now();
}





