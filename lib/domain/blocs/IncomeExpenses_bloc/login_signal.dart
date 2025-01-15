import 'package:signals/signals.dart';

// Definimos las señales
final Signal<bool?> isLoggedInIE = Signal<bool?>(null);
final Signal<String> incomeexpensesMessageIE = Signal<String>(""); // Mensaje de error o éxito
final Signal<bool> isLoadingIE = Signal<bool>(false); // Estado de carga
final Signal<bool> isIncomeExpensesErrorIE = Signal<bool>(false); // Estado de carga
//
//
final Signal<String> description_income_expenseIE = Signal<String>(""); // descripcion
final Signal<String> money_amountIE = Signal<String>(""); //cantidad de dinero
final Signal<DateTime> date_income_expenseIE = Signal<DateTime>(DateTime.now()); //cantidad de dinero
final Signal<int?> incomeExpensesSelectIE = Signal<int?>(null); // Mensaje de error o éxito
final Signal<int?> personalHomeSelectIE = Signal<int?>(null); // Mensaje de error o éxito
