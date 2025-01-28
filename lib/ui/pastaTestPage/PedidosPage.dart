import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PedidosPage extends StatefulWidget {
  @override
  _PedidosPageState createState() => _PedidosPageState();
}

class _PedidosPageState extends State<PedidosPage> {
  final List<Map<String, dynamic>> pedidos = [
    {"pedidoId": "001", "cliente": "Juan Pérez", "estado": "Pendiente", "total": 50.00, "fecha": "25/01/2025", "productos": ["Pizza", "Refresco"]},
    {"pedidoId": "002", "cliente": "María López", "estado": "En proceso", "total": 80.00, "fecha": "25/01/2025", "productos": ["Pastel", "Café"]},
    {"pedidoId": "003", "cliente": "Carlos García", "estado": "Listo", "total": 30.00, "fecha": "25/01/2025", "productos": ["Pan", "Jugo"]},
  ];

  String selectedEstado = "Todos";

  List<Map<String, dynamic>> get filteredPedidos {
    return pedidos
        .where((pedido) =>
            (selectedEstado == "Todos" || pedido["estado"] == selectedEstado))
        .toList();
  }

  Color _getEstadoColor(String estado) {
    switch (estado) {
      case "Pendiente":
        return Colors.amber.shade800; // Amarillo quemado
      case "En proceso":
        return Colors.blue.shade700; // Azul
      case "Listo":
        return Colors.green.shade700; // Verde
      default:
        return Colors.grey; // Gris para otros casos
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedidos"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Navegar a la pantalla de nuevo pedido
              _showNewPedidoForm(context);
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Filtros por estado
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFilterChip("Todos"),
                _buildFilterChip("Pendiente"),
                _buildFilterChip("En proceso"),
                _buildFilterChip("Listo"),
              ],
            ),
          ),

          // Lista de pedidos
          Expanded(
            child: ListView.builder(
              itemCount: filteredPedidos.length,
              itemBuilder: (context, index) {
                final pedido = filteredPedidos[index];
                return _buildPedidoCard(pedido);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Filtro por estado
  Widget _buildFilterChip(String estado) {
    return FilterChip(
      label: Text(estado),
      selected: selectedEstado == estado,
      onSelected: (bool selected) {
        setState(() {
          selectedEstado = estado;
        });
      },
    );
  }

  // Tarjeta de un pedido con color de borde según estado
  Widget _buildPedidoCard(Map<String, dynamic> pedido) {
    Color borderColor = _getEstadoColor(pedido['estado']);

    return GestureDetector(
      onTap: () => _showPedidoDetails(pedido), // Al hacer tap, mostrar detalles
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          elevation: 3,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor, width: 3), // Borde color según estado
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Pedido ${pedido['pedidoId']}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Cliente: ${pedido['cliente']}"),
                    Text("Total: R\$ ${pedido['total'].toStringAsFixed(2)}"),
                    Text("Estado: ${pedido['estado']}"),
                    Text("Fecha: ${pedido['fecha']}"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Mostrar detalles de un pedido
  void _showPedidoDetails(Map<String, dynamic> pedido) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Detalles del Pedido ${pedido['pedidoId']}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("Cliente: ${pedido['cliente']}", style: TextStyle(fontSize: 16)),
              Text("Fecha: ${pedido['fecha']}", style: TextStyle(fontSize: 16)),
              Text("Total: R\$ ${pedido['total'].toStringAsFixed(2)}", style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              Text("Productos:", style: TextStyle(fontSize: 16)),
              ...pedido['productos'].map<Widget>((producto) => Text("- $producto", style: TextStyle(fontSize: 16))).toList(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Cerrar el modal
                  Navigator.pop(context);
                },
                child: Text("Cerrar"),
              ),
            ],
          ),
        );
      },
    );
  }

  // Mostrar el formulario para agregar un nuevo pedido
  void _showNewPedidoForm(BuildContext context) {
    final _clienteController = TextEditingController();
    final _totalController = TextEditingController();
    String? selectedEstado = "Pendiente";
    List<String> productosSeleccionados = [];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Nuevo Pedido", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextField(controller: _clienteController, decoration: InputDecoration(labelText: "Cliente")),
              TextField(controller: _totalController, decoration: InputDecoration(labelText: "Total (R\$)"), keyboardType: TextInputType.number),
              DropdownButtonFormField<String>(
                value: selectedEstado,
                items: ["Pendiente", "En proceso", "Listo"]
                    .map((estado) => DropdownMenuItem(value: estado, child: Text(estado)))
                    .toList(),
                onChanged: (value) {
                  selectedEstado = value;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_clienteController.text.isNotEmpty && _totalController.text.isNotEmpty && selectedEstado != null) {
                    setState(() {
                      pedidos.add({
                        "pedidoId": (pedidos.length + 1).toString().padLeft(3, '0'),
                        "cliente": _clienteController.text,
                        "estado": selectedEstado,
                        "total": double.tryParse(_totalController.text) ?? 0.0,
                        "fecha": DateFormat('dd/MM/yyyy').format(DateTime.now()),
                        "productos": productosSeleccionados, // Esto se puede llenar con productos seleccionados
                      });
                    });
                    Navigator.pop(context);
                  }
                },
                child: Text("Confirmar Pedido"),
              ),
            ],
          ),
        );
      },
    );
  }
}
