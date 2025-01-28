import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class IngresosPage extends StatefulWidget {
  @override
  _IngresosPageState createState() => _IngresosPageState();
}

class _IngresosPageState extends State<IngresosPage> {
  final List<Map<String, dynamic>> ingresos = [
    {"title": "Venta Producto A", "amount": 2500.00, "category": "Producto", "date": "01/01/2025"},
    {"title": "Servicio B", "amount": 300.00, "category": "Servicio", "date": "02/01/2025"},
    {"title": "Venta Producto B", "amount": 800.00, "category": "Producto", "date": "03/01/2025"},
    {"title": "Consultoría", "amount": 500.00, "category": "Servicio", "date": "04/01/2025"},
  ];

  String selectedCategory = "Todos";
  bool showSearchField = false;
  String searchQuery = "";

  List<Map<String, dynamic>> get filteredIngresos {
    return ingresos
        .where((ingreso) =>
            (selectedCategory == "Todos" || ingreso["category"] == selectedCategory) &&
            (ingreso["title"].toLowerCase().contains(searchQuery.toLowerCase())))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Ingresos", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(showSearchField ? Icons.close : Icons.search, color: Colors.white),
            onPressed: () {
              setState(() {
                showSearchField = !showSearchField;
                searchQuery = ""; // Reiniciar búsqueda
              });
            },
          ),
        ],
        bottom: showSearchField
            ? PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Buscar ingreso...",
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
              )
            : null,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Filtro de categorias
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFilterChip("Todos"),
                _buildFilterChip("Producto"),
                _buildFilterChip("Servicio"),
              ],
            ),
          ),

          // Lista de Ingresos
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: filteredIngresos.length,
              itemBuilder: (context, index) {
                final ingreso = filteredIngresos[index];
                return _buildIngresoCard(ingreso, index);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          _showAddIncomeForm(context);
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildFilterChip(String category) {
    return FilterChip(
      label: Text(category),
      selected: selectedCategory == category,
      onSelected: (bool selected) {
        setState(() {
          selectedCategory = category;
        });
      },
    );
  }

  Widget _buildIngresoCard(Map<String, dynamic> ingreso, int index) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              ingreso["category"] == "Producto" ? Icons.shopping_cart : Icons.business_center,
              color: ingreso["category"] == "Producto" ? Colors.blue : Colors.orange,
              size: 30,
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ingreso["title"],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text("R\$ ${ingreso["amount"].toStringAsFixed(2)}"),
                SizedBox(height: 4),
                Text("Data: ${ingreso["date"]}"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showAddIncomeForm(BuildContext context) {
    final _titleController = TextEditingController();
    final _amountController = TextEditingController();
    String? selectedCategory = "Producto";
    DateTime? selectedDate;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, MediaQuery.of(context).viewInsets.bottom + 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Adicionar Ingreso",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: "Título"),
              ),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Valor (R\$)"),
              ),
              DropdownButtonFormField<String>(
                value: selectedCategory,
                decoration: InputDecoration(labelText: "Categoria"),
                items: ["Producto", "Servicio"]
                    .map((category) => DropdownMenuItem(value: category, child: Text(category)))
                    .toList(),
                onChanged: (value) {
                  selectedCategory = value;
                },
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      selectedDate == null
                          ? "Data: ${DateFormat('dd/MM/yyyy').format(DateTime.now())}"
                          : "Data: ${DateFormat('dd/MM/yyyy').format(selectedDate!)}",
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          selectedDate = pickedDate;
                        });
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_titleController.text.isNotEmpty &&
                      _amountController.text.isNotEmpty &&
                      selectedCategory != null) {
                    setState(() {
                      ingresos.add({
                        "title": _titleController.text,
                        "amount": double.tryParse(_amountController.text) ?? 0.0,
                        "category": selectedCategory,
                        "date": DateFormat('dd/MM/yyyy')
                            .format(selectedDate ?? DateTime.now()),
                      });
                    });
                    Navigator.pop(context);
                  }
                },
                child: Text("Salvar"),
              ),
            ],
          ),
        );
      },
    );
  }
}
