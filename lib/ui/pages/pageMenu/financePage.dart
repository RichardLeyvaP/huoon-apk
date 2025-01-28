import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:huoon/domain/signals/IncomeExpenses_signals/login_service.dart';
import 'package:huoon/domain/signals/IncomeExpenses_signals/login_signal.dart';
import 'package:huoon/ui/components/buttonCustomWidget.dart';
import 'package:huoon/ui/util/utilClass.dart';
import 'package:huoon/ui/util/utilsStyleGlobalApk.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FinancePage extends StatefulWidget {
  const FinancePage({super.key});

  @override
  State<FinancePage> createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage> {
String selectedCategory = 'Últimas transacciones';
  @override
  void initState() {
    //aqui cargar las finanzas
    getIncomeExpenses(1,'Todas');
    super.initState();
  }
  // Widget para los botones de categoría
  Widget _buildCategoryButton(String category) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          decoration: BoxDecoration(
            color: selectedCategory == category ? StyleGlobalApk.colorPrimary : Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Text(
            category,
            style: TextStyle(
              fontSize: 14,
              color: selectedCategory == category ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // Widget para el contenido según la categoría seleccionada
  Widget _buildCategoryContent() {
    if (selectedCategory == 'Últimas transacciones') {
      return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          final item = transactions[index];
          // return _buildFinanceCard(item['description'], item['date'], item['type'], item['income']);
        return  _buildTransactionList();
        },
      );
    } else if (selectedCategory == 'Gastos') {
  return ListView.builder(
    itemCount: financeIE.value!.where((item) => item.spent != '0.00' && item.spent != null).length, // Filtra los elementos donde 'spent' no es igual a 0.00
    itemBuilder: (context, index) {
      final item = financeIE.value!.where((item) => item.spent != '0.00' && item.spent != null).toList()[index]; // Aplica el filtro en el builder
      return _buildFinanceCard(item.description!, item.date!.toString(), item.type!, item.spent?? '0.00',Colors.red);
    },
  );
}
 else if (selectedCategory == 'Ingresos') {
      return ListView.builder(
    itemCount: financeIE.value!.where((item) => item.income != '0.00' && item.income != null).length, // Filtra los elementos donde 'spent' no es igual a 0.00
    itemBuilder: (context, index) {
      final item = financeIE.value!.where((item) => item.income != '0.00' && item.income != null).toList()[index]; // Aplica el filtro en el builder
      return _buildFinanceCard(item.description!, item.date!.toString(), item.type!, item.income!,Colors.green);
    },
  );
    } else {
      return Center(child: Text('Categoría desconocida'));
    }
  }

  // Widget para una tarjeta de finanzas
  Widget _buildFinanceCard(String description, String date, String type, String total,Color colorTotal) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Fecha: $date',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            SizedBox(height: 8),
            Text(
              'Tipo: $type',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            SizedBox(height: 8),
            Text(
              'Total: \$ $total',
              style: TextStyle(fontSize: 14, color: colorTotal),
            ),
          ],
        ),
      ),
    );
  } 

  final List<Map<String, dynamic>> transactions = [
    {'description': 'Compra de supermercado', 'date': '2025-01-15', 'type': 'Personal', 'income': '0.00'},
    {'description': 'Pago de luz', 'date': '2025-01-10', 'type': 'Hogar', 'income': '0.00'},
    {'description': 'Venta de muebles', 'date': '2025-01-05', 'type': 'Personal', 'income': '500.00'},
  ];

  final List<Map<String, dynamic>> finances = [
    {
      "id": 1,
      "homeId": 1,
      "personId": 4,
      "spent": null,
      "income": "30000.00",
      "date": "2025-01-17",
      "description": "Prueba finanza personal editada",
      "type": "Personal",
      "method": null,
      "image": "finances/1.jpg"
    }
  ];

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
          // Row con scroll horizontal
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildCategoryButton('Últimas transacciones'),
                _buildCategoryButton('Gastos'),
                _buildCategoryButton('Ingresos'),
              ],
            ),
          ),
          SizedBox(height: 10),
          Divider(height: 1.0, thickness: 2.0, color: Color.fromARGB(50, 158, 158, 158)),
          // Mostrar contenido según la categoría seleccionada
          SizedBox(
            height: 300, // Ajusta el alto según lo necesites.
            child: _buildCategoryContent(),
          ),
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

