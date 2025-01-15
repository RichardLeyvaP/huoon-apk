import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:huoon/domain/blocs/IncomeExpenses_bloc/login_service.dart';
import 'package:huoon/ui/Components/button_custom.dart';
import 'package:huoon/ui/util/util_class.dart';
import 'package:huoon/ui/util/utils_class_apk.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FinancePage extends StatelessWidget {
  const FinancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Presupuesto actual
             Column(
              crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 10,),
            CustomButton(
  onPressed: () {
    clearIncomeExpensesSignals(); 
    GoRouter.of(context).push('/IncomeExpensesCreation');
  },
  text: 'Registrar',
  icon: Icons.attach_money, // Usa un ícono representativo
  backgroundColor: StyleGlobalApk.colorPrimary,
  textColor: Colors.white,
  width: 130,
  height: 35,
),

              _buildBudgetCardGeneral('Presupuesto Actual', '\$1,500,000'),
              SizedBox(height: 16),
              Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 5), // Margen a la derecha
                child: _buildBudgetCard('Gasto Mensual', '\$298,250',const Color.fromARGB(255, 222, 125, 207),MdiIcons.chartPie),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 5), // Margen a la izquierda
                child: _buildBudgetCard('Gasto Mensual', '\$298,250',const Color.fromARGB(255, 92, 205, 195),Icons.autorenew),
              ),
            ),
          ],
              ),
            ],
          ),
          
              SizedBox(height: 20),
          
              // Últimas Transacciones
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Últimas transacciones',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
              _buildTransactionList(),
            ],
          ),
        ),
        
      ),
    );
  }

  // Widget para mostrar los bloques de presupuesto
  Widget _buildBudgetCardGeneral(String title, String amount) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ContainerIcon(const Color.fromARGB(255, 92, 205, 195),Icons.attach_money,20),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                Text(
              amount,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }

  Container ContainerIcon(Color colorContainerIcon,IconData icon, double paddingIcon) {
    return Container(
        decoration: BoxDecoration(
          color:colorContainerIcon.withOpacity(0.3), // Color verde con transparencia
          borderRadius: BorderRadius.circular(20), // Bordes redondeados
        ),
        padding: EdgeInsets.all(paddingIcon),
        child: Icon(
         icon ,
          size: 30, // Tamaño del icono
          color:colorContainerIcon , // Color del icono
        ),
      );
  }
// Widget para mostrar los bloques de presupuesto
  Widget _buildBudgetCard(String title, String amount,Color color,IconData icon) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ContainerIcon(color,icon,26.0),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5),
            Text(
              amount,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
  // Lista de transacciones
  Widget _buildTransactionList() {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: 
      SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Encabezados
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          child: Table(
            columnWidths: const {
              0: FlexColumnWidth(2), // Espacio proporcional para "REF"
              1: FlexColumnWidth(4), // Espacio proporcional para "Nombre"
              2: FlexColumnWidth(4), // Espacio proporcional para "Categoría"
              3: FlexColumnWidth(2), // Espacio proporcional para "Valor"
            },
            children: [
              TableRow(
                children: [
                  Text('REF', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  Text('Nombre', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  Text('Categoría', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  Text('Valor', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                ],
              ),
            ],
          ),
        ),
        // Separador
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Divider(color: Colors.grey.shade100, thickness: 1),
        ),
        // Datos con scroll
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, ),
          child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 280),
            child: SingleChildScrollView(
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(2), // Espacio proporcional para "REF"
                  1: FlexColumnWidth(4), // Espacio proporcional para "Nombre"
                  2: FlexColumnWidth(4), // Espacio proporcional para "Categoría"
                  3: FlexColumnWidth(2), // Espacio proporcional para "Valor"
                },
                children: [
                  _buildTransactionTableRow('01.', 'Evelyn', 'Compras', '-24.990'),
                  _buildTransactionTableRow('02.', 'Juan', 'Servicios', '-9.990'),
                  _buildTransactionTableRow('03.', 'Juan', 'Depósito', '+91.320'),
                  _buildTransactionTableRow('04.', 'María', 'Ahorros', '+15.000'),
                  _buildTransactionTableRow('05.', 'Luis', 'Entretenimiento', '-5.000'),
                  
                  _buildTransactionTableRow('02.', 'Juan', 'Servicios', '-9.990'),
                  _buildTransactionTableRow('03.', 'Juan', 'Depósito', '+91.320'),
                  _buildTransactionTableRow('04.', 'María', 'Ahorros', '+15.000'),
                  _buildTransactionTableRow('05.', 'Luis', 'Entretenimiento', '-5.000'),
                  _buildTransactionTableRow('02.', 'Juan', 'Servicios', '-9.990'),
                  _buildTransactionTableRow('03.', 'Juan', 'Depósito', '+91.320'),
                  _buildTransactionTableRow('04.', 'María', 'Ahorros', '+15.000'),
                  _buildTransactionTableRow('05.', 'Luis', 'Entretenimiento', '-5.000'),
                  
                  
                  _buildTransactionTableRow('02.', 'Juan', 'Servicios', '-9.990'),
                  _buildTransactionTableRow('03.', 'Juan', 'Depósito', '+91.320'),
                  _buildTransactionTableRow('04.', 'María', 'Ahorros', '+15.000'),
                  _buildTransactionTableRow('05.', 'Luis', 'Entretenimiento', '-5.000'),
                  _buildTransactionTableRow('02.', 'Juan', 'Servicios', '-9.990'),
                  _buildTransactionTableRow('03.', 'Juan', 'Depósito', '+91.320'),
                  _buildTransactionTableRow('04.', 'María', 'Ahorros', '+15.000'),
                  _buildTransactionTableRow('05.', 'Luis', 'Entretenimiento', '-5.000'),
                  // Agrega más filas aquí...
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  ),
),


    );
  }

TableRow _buildTransactionTableRow(String ref, String name, String category, String value) {
  return TableRow(
    children: [
      Text(ref, style: TextStyle(fontSize: 14,height: 2)),
      Text(name, style: TextStyle(fontSize: 14,height: 2)),
      Text(category, style: TextStyle(fontSize: 14, color: Colors.grey,height: 2)),
      Text(
        value,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: value.startsWith('-') ? Colors.redAccent : const Color.fromARGB(255, 92, 205, 195),height: 2
        ),
      ),
    ],
  );
}

  // Widget para mostrar un elemento de transacción
 Widget _buildTransactionItem(String code,String name, String category, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Avatar + Nombre
        Row(
          children: [
            Text(' $code'),
            SizedBox(width: 10), // Espacio entre el avatar y el texto
            Text(' $name', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        // Categoría
        Expanded(
          child: Text(
            category,
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.center, // Centrado
          ),
        ),
        // Valor
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isNegative(value)
                ? Colors.redAccent
                : const Color.fromARGB(255, 92, 205, 195),
          ),
        ),
      ],
    ),
  );
}


}
