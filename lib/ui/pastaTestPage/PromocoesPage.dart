import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PromocoesPage extends StatefulWidget {
  @override
  _PromocoesPageState createState() => _PromocoesPageState();
}

class _PromocoesPageState extends State<PromocoesPage> {
  // Lista de promociones simulada
  List<Map<String, dynamic>> promocoes = [
    {
      'titulo': 'Promoção Especial de Pizza',
      'descricao': '30% de desconto em todas as pizzas.',
      'dataInicio': DateTime.now(), // Hoy
      'dataFinal': DateTime.now().add(Duration(days: 3)), // En 3 días
    },
    {
      'titulo': 'Desconto em Doces',
      'descricao': 'Compre 1, leve 2.',
      'dataInicio': DateTime.now().add(Duration(days: 2)), // En 2 días
      'dataFinal': DateTime.now().add(Duration(days: 5)), // En 5 días
    },
    {
      'titulo': 'Promoção de Bebidas',
      'descricao': 'Compre 2, leve 1 grátis.',
      'dataInicio': DateTime.now().add(Duration(days: 6)), // En 6 días
      'dataFinal': DateTime.now().add(Duration(days: 9)), // En 9 días
    },
  ];

  // Lista de promociones filtradas (por búsqueda)
  List<Map<String, dynamic>> filteredPromocoes = [];
  
  // Controlador de búsqueda
  TextEditingController searchController = TextEditingController();

  // Inicializamos las promociones filtradas
  @override
  void initState() {
    super.initState();
    filteredPromocoes = promocoes;
  }

  // Función para agregar una nueva promoción
  void _adicionarPromocao() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String title = '';
        String description = '';
        DateTime startDate = DateTime.now();
        DateTime endDate = DateTime.now().add(Duration(days: 1));

        return AlertDialog(
          title: Text("Adicionar Nova Promoção"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: "Título"),
                  onChanged: (value) => title = value,
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Descrição"),
                  onChanged: (value) => description = value,
                ),
                Row(
                  children: [
                    Text("Data Início: "),
                    IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () async {
                        DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: startDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (selectedDate != null && selectedDate != startDate) {
                          setState(() {
                            startDate = selectedDate;
                          });
                        }
                      },
                    ),
                    Text(DateFormat('dd/MM/yyyy').format(startDate)),
                  ],
                ),
                Row(
                  children: [
                    Text("Data Final: "),
                    IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () async {
                        DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: endDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (selectedDate != null && selectedDate != endDate) {
                          setState(() {
                            endDate = selectedDate;
                          });
                        }
                      },
                    ),
                    Text(DateFormat('dd/MM/yyyy').format(endDate)),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  promocoes.add({
                    'titulo': title,
                    'descricao': description,
                    'dataInicio': startDate,
                    'dataFinal': endDate,
                  });
                  filteredPromocoes = promocoes;
                });
                Navigator.pop(context);
              },
              child: Text("Adicionar"),
            ),
          ],
        );
      },
    );
  }

  // Función para filtrar las promociones
  void _filterPromocoes(String query) {
    final filtered = promocoes.where((promocao) {
      final titleLower = promocao['titulo'].toLowerCase();
      final descriptionLower = promocao['descricao'].toLowerCase();
      final queryLower = query.toLowerCase();
      return titleLower.contains(queryLower) || descriptionLower.contains(queryLower);
    }).toList();

    setState(() {
      filteredPromocoes = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Promoções"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _adicionarPromocao, // Acción para agregar una nueva promoción
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campo de búsqueda
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: "Buscar Promoção",
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: _filterPromocoes, // Filtra las promociones según el texto ingresado
            ),
            SizedBox(height: 16),
            // Lista de promociones
            Expanded(
              child: ListView.builder(
                itemCount: filteredPromocoes.length,
                itemBuilder: (context, index) {
                  final promocoao = filteredPromocoes[index];
                  final dataInicio = promocoao['dataInicio'];
                  final dataFinal = promocoao['dataFinal'];
                  final hoje = DateTime.now();
                  final diferenca = dataInicio.difference(hoje).inDays;

                  // Definir el color del borde del card según la fecha
                  Color borderColor = Colors.grey; // Color por defecto
                  if (diferenca == 0) {
                    borderColor = Colors.green; // Promoción del día
                  }

                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: borderColor, width: 2), // Borde de color según la fecha
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Título
                          Text(
                            promocoao['titulo'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          // Descripción
                          Text(
                            promocoao['descricao'],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(height: 8),
                          // Fecha de inicio
                          Text(
                            'Início: ${DateFormat('dd/MM/yyyy').format(dataInicio)}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                          // Fecha de finalización
                          Text(
                            'Final: ${DateFormat('dd/MM/yyyy').format(dataFinal)}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                          // Si la promoción tiene fecha de inicio hoy, mostrar en verde
                          if (diferenca == 0)
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'Promoção de hoje!',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
