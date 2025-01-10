import 'package:flutter/material.dart';

class EstoquePage extends StatefulWidget {
  @override
  _EstoquePageState createState() => _EstoquePageState();
}

class _EstoquePageState extends State<EstoquePage> {
  final List<Map<String, dynamic>> produtos = [
    {
      "name": "Farinha de Trigo",
      "category": "Alimento",
      "quantity": 10,
      "unit": "kg",
      "date": "01/01/2025",
      "expiryDate": "01/07/2025",
    },
    {
      "name": "Óleo de Soja",
      "category": "Líquido",
      "quantity": 5,
      "unit": "litro",
      "date": "01/12/2024",
      "expiryDate": null,
    },
    {
      "name": "Açúcar",
      "category": "Alimento",
      "quantity": 20,
      "unit": "kg",
      "date": "15/11/2024",
      "expiryDate": "15/11/2025",
    },
  ];

  final List<String> categorias = ["Todas", "Alimento", "Líquido", "Outros"];
  String selectedCategory = "Todas";
  bool showSearchField = false;
  String searchQuery = "";

  List<Map<String, dynamic>> get filteredProdutos {
    return produtos
        .where((produto) =>
            (selectedCategory == "Todas" || produto["category"] == selectedCategory) &&
            (produto["name"].toLowerCase().contains(searchQuery.toLowerCase())))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Estoque", style: TextStyle(color: Colors.white)),
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
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: () => _showAddProductForm(context),
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
                      hintText: "Buscar produto...",
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
        children: [
          // Filtro de categorias
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...categorias.map((categoria) => _buildFilterChip(categoria)).toList(),
                ],
              ),
            ),
          ),
          // Lista de Produtos
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: filteredProdutos.length,
              itemBuilder: (context, index) {
                final produto = filteredProdutos[index];
                return _buildProductCard(produto);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String category) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: FilterChip(
        label: Text(category),
        selected: selectedCategory == category,
        onSelected: (bool selected) {
          setState(() {
            selectedCategory = category;
          });
        },
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> produto) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(produto["name"], style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(
            "Categoria: ${produto["category"]}\nQuantidade: ${produto["quantity"]} ${produto["unit"]}\nData: ${produto["date"]}${produto["expiryDate"] != null ? "\nValidade: ${produto["expiryDate"]}" : ""}"),
      ),
    );
  }

  void _showAddProductForm(BuildContext context) {
    final _nameController = TextEditingController();
    final _quantityController = TextEditingController();
    String selectedCategory = categorias[1];
    String? selectedUnit;
    String? selectedDate;
    String? selectedExpiryDate;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, MediaQuery.of(context).viewInsets.bottom + 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Adicionar Produto", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Nome do Produto"),
              ),
              TextField(
                controller: _quantityController,
                decoration: InputDecoration(labelText: "Quantidade"),
                keyboardType: TextInputType.number,
              ),
              DropdownButtonFormField<String>(
                value: selectedCategory,
                decoration: InputDecoration(labelText: "Categoria"),
                items: categorias
                    .skip(1)
                    .map((categoria) => DropdownMenuItem(value: categoria, child: Text(categoria)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value!;
                    selectedUnit = null;
                  });
                },
              ),
              DropdownButtonFormField<String>(
                value: selectedUnit,
                decoration: InputDecoration(labelText: "Unidade de Medida"),
                items: (selectedCategory == "Líquido"
                        ? ["ml", "litro", "galão"]
                        : ["g", "kg", "tonelada"])
                    .map((unit) => DropdownMenuItem(value: unit, child: Text(unit)))
                    .toList(),
                onChanged: (value) {
                  selectedUnit = value;
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(labelText: "Data"),
                      onTap: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (picked != null) {
                          selectedDate = "${picked.day}/${picked.month}/${picked.year}";
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(labelText: "Data de Validade"),
                      onTap: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (picked != null) {
                          selectedExpiryDate = "${picked.day}/${picked.month}/${picked.year}";
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_nameController.text.isNotEmpty &&
                      _quantityController.text.isNotEmpty &&
                      selectedUnit != null) {
                    setState(() {
                      produtos.add({
                        "name": _nameController.text,
                        "category": selectedCategory,
                        "quantity": int.parse(_quantityController.text),
                        "unit": selectedUnit,
                        "date": selectedDate ?? "Hoje",
                        "expiryDate": selectedExpiryDate,
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
