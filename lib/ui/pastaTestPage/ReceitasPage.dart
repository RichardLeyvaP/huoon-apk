import 'package:flutter/material.dart';

class ReceitasPage extends StatefulWidget {
  @override
  _ReceitasPageState createState() => _ReceitasPageState();
}

class _ReceitasPageState extends State<ReceitasPage> {
  final List<Map<String, dynamic>> receitas = [
    {
      "title": "Pizza Margherita",
      "category": "Pizza",
      "ingredients": [],
      "expanded": false,
    },
    {
      "title": "Pão Integral",
      "category": "Pão",
      "ingredients": [],
      "expanded": false,
    },
    {
      "title": "Bolo de Cenoura",
      "category": "Doce",
      "ingredients": [],
      "expanded": false,
    },
  ];

  final List<String> categorias = ["Pizza", "Pão", "Doce"];
  final List<Map<String, dynamic>> ingredientesDisponiveis = [
    {"name": "Tomate", "unit": "kg"},
    {"name": "Queijo", "unit": "g"},
    {"name": "Manjericão", "unit": "folhas"},
    {"name": "Farinha", "unit": "kg"},
    {"name": "Açúcar", "unit": "g"},
  ];

  String selectedCategory = "Todas";
  bool showSearchField = false;
  String searchQuery = "";

  List<Map<String, dynamic>> get filteredReceitas {
    return receitas
        .where((receita) =>
            (selectedCategory == "Todas" || receita["category"] == selectedCategory) &&
            (receita["title"].toLowerCase().contains(searchQuery.toLowerCase())))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Receitas", style: TextStyle(color: Colors.white)),
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
                      hintText: "Buscar receita...",
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip("Todas"),
                  ...categorias.map((categoria) => _buildFilterChip(categoria)).toList(),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: filteredReceitas.length,
              itemBuilder: (context, index) {
                final receita = filteredReceitas[index];
                return _buildReceitaCard(receita, index);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () => _showAddRecipeForm(context),
        child: Icon(Icons.add, color: Colors.white),
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

  Widget _buildReceitaCard(Map<String, dynamic> receita, int index) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ListTile(
            title: Text(receita["title"], style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(receita["category"]),
            trailing: IconButton(
              icon: Icon(
                receita["expanded"] ? Icons.expand_less : Icons.expand_more,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  receitas[index]["expanded"] = !receitas[index]["expanded"];
                });
              },
            ),
          ),
          if (receita["expanded"])
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ingredientes:", style: TextStyle(fontWeight: FontWeight.bold)),
                  ...receita["ingredients"].map<Widget>((ingrediente) =>
                      Text("- ${ingrediente["name"]}: ${ingrediente["quantity"]} ${ingrediente["unit"]}"))
                ],
              ),
            ),
          TextButton(
            onPressed: () => _addIngredientToRecipe(context, index),
            child: Text("+ Agregar Ingrediente"),
          ),
        ],
      ),
    );
  }

  void _addIngredientToRecipe(BuildContext context, int recipeIndex) {
    String? selectedIngredient;
    String quantity = "";

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
              Text("Agregar Ingrediente", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
  value: selectedIngredient,
  decoration: InputDecoration(labelText: "Ingrediente"),
  items: ingredientesDisponiveis.map((ingrediente) {
    return DropdownMenuItem<String>(
      value: ingrediente['name'].toString(), // Aseguramos que sea String
      child: Text(ingrediente['name'].toString()),
    );
  }).toList(),
  onChanged: (value) {
    selectedIngredient = value;
  },
),

              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Cantidad"),
                onChanged: (value) {
                  quantity = value;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (selectedIngredient != null && quantity.isNotEmpty) {
                    final ingredient = ingredientesDisponiveis.firstWhere(
                        (ingrediente) => ingrediente["name"] == selectedIngredient);
                    setState(() {
                      receitas[recipeIndex]["ingredients"].add({
                        "name": selectedIngredient,
                        "quantity": quantity,
                        "unit": ingredient["unit"],
                      });
                    });
                    Navigator.pop(context);
                  }
                },
                child: Text("Guardar"),
              ),
            ],
          ),
        );
      },
    );
  }

void _showAddRecipeForm(BuildContext context) {
  final _titleController = TextEditingController();
  String? selectedCategory = categorias.isNotEmpty ? categorias.first : null;
  List<Map<String, dynamic>> selectedIngredients = []; // Ingredientes seleccionados

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setModalState) {
          void _addIngredient() {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) {
                final _quantityController = TextEditingController();
                String? selectedIngredient;

                return Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, MediaQuery.of(context).viewInsets.bottom + 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Agregar Ingrediente",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        value: selectedIngredient,
                        decoration: InputDecoration(labelText: "Ingrediente"),
                        items: ingredientesDisponiveis
                            .map((ingrediente) => DropdownMenuItem<String>(
                                  value: ingrediente['name'].toString(),
                                  child: Text(ingrediente['name'].toString()),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setModalState(() {
                            selectedIngredient = value;
                          });
                        },
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: _quantityController,
                        decoration: InputDecoration(labelText: "Cantidad"),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          if (selectedIngredient != null &&
                              _quantityController.text.isNotEmpty) {
                            setModalState(() {
                              selectedIngredients.add({
                                'name': selectedIngredient,
                                'quantity': _quantityController.text,
                              });
                            });
                            Navigator.pop(context); // Cierra el modal de agregar ingrediente
                          }
                        },
                        child: Text("Agregar"),
                      ),
                    ],
                  ),
                );
              },
            );
          }

          return Padding(
            padding: EdgeInsets.fromLTRB(
                16, 16, 16, MediaQuery.of(context).viewInsets.bottom + 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Crear Receta",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(labelText: "Título de la receta"),
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: selectedCategory,
                  decoration: InputDecoration(labelText: "Categoría"),
                  items: categorias
                      .map((categoria) => DropdownMenuItem<String>(
                            value: categoria,
                            child: Text(categoria),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setModalState(() {
                      selectedCategory = value;
                    });
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _addIngredient,
                  child: Text("Agregar Ingrediente"),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Aquí puedes manejar la lógica para guardar la receta
                    print("Título: ${_titleController.text}");
                    print("Categoría: $selectedCategory");
                    print("Ingredientes: $selectedIngredients");
                    Navigator.pop(context);
                  },
                  child: Text("Guardar Receta"),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

}


