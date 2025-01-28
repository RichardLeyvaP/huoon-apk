import 'package:flutter/material.dart';

class RelatoriosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Relatórios"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Informe de Ventas
            _buildReportCard(context, "Vendas Totais", "Total de ventas diarias, semanales o mensuales", Colors.blue, () {
              _showReportDetails(context, "Vendas Totais");
            }),

            // Informe de Pedidos por Estado
            _buildReportCard(context, "Pedidos por Estado", "Informe de pedidos pendientes, en proceso o listos", Colors.orange, () {
              _showReportDetails(context, "Pedidos por Estado");
            }),

            // Informe de Productos Más Vendidos
            _buildReportCard(context, "Produtos Mais Vendidos", "Lista de productos más vendidos", Colors.green, () {
              _showReportDetails(context, "Produtos Mais Vendidos");
            }),

            // Informe de Clientes
            _buildReportCard(context, "Clientes Mais Frequentes", "Clientes con mayor cantidad de compras", Colors.purple, () {
              _showReportDetails(context, "Clientes Mais Frequentes");
            }),

            // Informe de Rentabilidad
            _buildReportCard(context, "Rentabilidade", "Informe de ganancias netas", Colors.red, () {
              _showReportDetails(context, "Rentabilidade");
            }),

            // Informe de Cancelaciones
            _buildReportCard(context, "Cancelamentos", "Pedidos cancelados", Colors.yellow, () {
              _showReportDetails(context, "Cancelamentos");
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildReportCard(BuildContext context, String title, String description, Color color, Function onTap) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(Icons.report, color: color),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(description),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Mostrar detalles del informe seleccionado
  void _showReportDetails(BuildContext context, String reportName) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Detalles del Informe: $reportName"),
          content: Text("Aquí iría el contenido del informe: $reportName"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cerrar"),
            ),
          ],
        );
      },
    );
  }
}
