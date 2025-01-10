import 'package:flutter/material.dart';

class FuncionariosPage extends StatefulWidget {
  @override
  _FuncionariosPageState createState() => _FuncionariosPageState();
}

class _FuncionariosPageState extends State<FuncionariosPage> {
  final List<Map<String, dynamic>> funcionarios = [
    {"name": "João Silva", "role": "Gerente", "status": "Ativo", "image": "assets/images/employee1.jpg"},
    {"name": "Maria Oliveira", "role": "Caixa", "status": "Inativo", "image": "assets/images/employee2.jpg"},
    {"name": "Carlos Pereira", "role": "Pizzaiolo", "status": "Ativo", "image": "assets/images/employee3.jpg"},
    {"name": "Ana Souza", "role": "Entregador", "status": "Ativo", "image": "assets/images/employee4.jpg"},
  ];

  final List<String> roles = ["Gerente", "Caixa", "Pizzaiolo", "Entregador"];
  String selectedStatus = "Todos";
  bool showSearchField = false;
  String searchQuery = "";

  List<Map<String, dynamic>> get filteredFuncionarios {
    return funcionarios
        .where((func) =>
            (selectedStatus == "Todos" || func["status"] == selectedStatus) &&
            (func["name"].toLowerCase().contains(searchQuery.toLowerCase())))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Funcionários", style: TextStyle(color: Colors.white)),
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
                      hintText: "Buscar funcionário...",
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
          // Filtro de estados
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFilterChip("Todos"),
                _buildFilterChip("Ativo"),
                _buildFilterChip("Inativo"),
              ],
            ),
          ),

          // Lista de Funcionarios
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: filteredFuncionarios.length,
              itemBuilder: (context, index) {
                final func = filteredFuncionarios[index];
                return _buildFuncionarioCard(func, index);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          _showAddOrEditEmployeeForm(context);
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildFilterChip(String status) {
    return FilterChip(
      label: Text(status),
      selected: selectedStatus == status,
      onSelected: (bool selected) {
        setState(() {
          selectedStatus = status;
        });
      },
    );
  }

  Widget _buildFuncionarioCard(Map<String, dynamic> func, int index) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(func["image"]),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      func["name"],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(func["role"]),
                  ],
                ),
                Spacer(),
                // Etiqueta de estado
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: func["status"] == "Ativo" ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    func["status"],
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -5,
            right: -5,
            child: IconButton(
              icon: Icon(Icons.edit, color: Colors.blue),
              onPressed: () {
                _showAddOrEditEmployeeForm(context, funcionario: func, index: index);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showAddOrEditEmployeeForm(BuildContext context, {Map<String, dynamic>? funcionario, int? index}) {
    final _nameController = TextEditingController(text: funcionario?["name"] ?? "");
    String? selectedRole = funcionario?["role"];
    String? selectedEmployeeStatus = funcionario?["status"];

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
                funcionario == null ? "Adicionar Funcionário" : "Editar Funcionário",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Nome"),
              ),
              DropdownButtonFormField<String>(
                value: selectedRole,
                decoration: InputDecoration(labelText: "Cargo"),
                items: roles
                    .map((role) => DropdownMenuItem(value: role, child: Text(role)))
                    .toList(),
                onChanged: (value) {
                  selectedRole = value;
                },
              ),
              DropdownButtonFormField<String>(
                value: selectedEmployeeStatus,
                decoration: InputDecoration(labelText: "Estado"),
                items: ["Ativo", "Inativo"]
                    .map((status) => DropdownMenuItem(value: status, child: Text(status)))
                    .toList(),
                onChanged: (value) {
                  selectedEmployeeStatus = value;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_nameController.text.isNotEmpty && selectedRole != null && selectedEmployeeStatus != null) {
                    setState(() {
                      if (funcionario == null) {
                        // Agregar nuevo funcionario
                        funcionarios.add({
                          "name": _nameController.text,
                          "role": selectedRole,
                          "status": selectedEmployeeStatus,
                          "image": "assets/images/default.jpg",
                        });
                      } else {
                        // Editar funcionario existente
                        funcionarios[index!] = {
                          "name": _nameController.text,
                          "role": selectedRole,
                          "status": selectedEmployeeStatus,
                          "image": funcionario["image"],
                        };
                      }
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
