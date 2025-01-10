import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GastosPage extends StatefulWidget {
  @override
  _GastosPageState createState() => _GastosPageState();
}

class _GastosPageState extends State<GastosPage> {
  final List<Map<String, dynamic>> gastos = [
    {"title": "Aluguel", "amount": 1500.00, "category": "Fixo", "date": "01/01/2025"},
    {"title": "Internet", "amount": 120.00, "category": "Fixo", "date": "02/01/2025"},
    {"title": "Compra de materiais", "amount": 250.00, "category": "Variável", "date": "03/01/2025"},
    {"title": "Transporte", "amount": 75.00, "category": "Variável", "date": "04/01/2025"},
  ];

  String selectedCategory = "Todos";
  bool showSearchField = false;
  String searchQuery = "";

  List<Map<String, dynamic>> get filteredGastos {
    return gastos
        .where((gasto) =>
            (selectedCategory == "Todos" || gasto["category"] == selectedCategory) &&
            (gasto["title"].toLowerCase().contains(searchQuery.toLowerCase())))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Gastos", style: TextStyle(color: Colors.white)),
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
                      hintText: "Buscar gasto...",
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
                _buildFilterChip("Fixo"),
                _buildFilterChip("Variável"),
              ],
            ),
          ),

          // Lista de Gastos
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: filteredGastos.length,
              itemBuilder: (context, index) {
                final gasto = filteredGastos[index];
                return _buildGastoCard(gasto, index);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          _showAddExpenseForm(context);
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

  Widget _buildGastoCard(Map<String, dynamic> gasto, int index) {
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
              gasto["category"] == "Fixo" ? Icons.attach_money : Icons.money_off,
              color: gasto["category"] == "Fixo" ? Colors.green : Colors.red,
              size: 30,
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  gasto["title"],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text("R\$ ${gasto["amount"].toStringAsFixed(2)}"),
                SizedBox(height: 4),
                Text("Data: ${gasto["date"]}"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showAddExpenseForm(BuildContext context) {
    final _titleController = TextEditingController();
    final _amountController = TextEditingController();
    String? selectedCategory = "Fixo";
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
                "Adicionar Gasto",
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
                items: ["Fixo", "Variável"]
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
                      gastos.add({
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
