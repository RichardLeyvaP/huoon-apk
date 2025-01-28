import 'package:flutter/material.dart';
import 'package:huoon/ui/pages/rol/admin/task/bootStoreTask.dart';

class IncomeExpensesCreation extends StatefulWidget {
  @override
  _IncomeExpensesCreationState createState() => _IncomeExpensesCreationState();
}

class _IncomeExpensesCreationState extends State<IncomeExpensesCreation> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: BouncingScrollPhysics(),
        children:  const [
        TaskChatPage(conversationSteps: [
    
    {'key': 'income_expenses', 'message': '¿Que deseas registrar?', 'hint': ''},//( Gasto o ingreso )  
  {'key': 'income_expense_type', 'message': '¿Este lo vas a registrar como?', 'hint': ''},//( personal - Hogar )
  {'key': 'money_amount', 'message': 'Por favor cual es la cantidad ', 'hint': 'cantidad de dinero'},
  {'key': 'description_income_expense', 'message': 'Perfecto. Ahora, ¿puedes darme una breve descripción? ', 'hint': 'Descripción '},
   {'key': 'date_income_expense', 'message': 'Esoja la fecha por favor...', 'hint': ''},
    

    {'key': 'done', 'message': '¡Genial! He registrado todos los datos. ¿Quieres guardarlo?', 'hint': 'Confirmar Producto'}
    //ENVIANDO A INSERTAR
        // await storeTask();
  ],title: 'Ingresos y Gastos',module: 'IncomeExpensesCreation',),
        
        ],
      ),
    );
  }
}
