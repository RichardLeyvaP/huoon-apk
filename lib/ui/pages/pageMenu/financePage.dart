import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:huoon/ui/util/utils_class_apk.dart';

class FinancePage extends StatelessWidget {
  const FinancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Finanzas', style: TextStyle(fontSize: 18, color: Colors.black)),
            Text('Resumen de tus finanzas personales',
                style: TextStyle(fontSize: 10, color: Color.fromARGB(150, 0, 0, 0))),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(Icons.account_balance_wallet, color: Colors.black),
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(height: 1.0, thickness: 2.0, color: Color.fromARGB(50, 158, 158, 158)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Indicadores clave
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildFinancialIndicator('Ingresos', '\$3,500', StyleGlobalApk.getColorGreenBlue()),
                _buildFinancialIndicator('Gastos', '\$2,000', StyleGlobalApk.getColorRedOpaque()),
                _buildFinancialIndicator('Balance', '\$1,500', StyleGlobalApk.getColorOpaqueBlue()),
              ],
            ),
            SizedBox(height: 20),

            // Gráficos
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PieChart(
                            PieChartData(
                              sections: _getPieChartSections(),
                              borderData: FlBorderData(show: false),
                              centerSpaceRadius: 40,
                              sectionsSpace: 4,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: AspectRatio(
                      aspectRatio: 1.5,
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: BarChart(
                            BarChartData(
                              barGroups: _getBarChartGroups(),
                              titlesData: FlTitlesData(
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: true),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (value, meta) {
                                      switch (value.toInt()) {
                                        case 0:
                                          return Text('Ene');
                                        case 1:
                                          return Text('Feb');
                                        case 2:
                                          return Text('Mar');
                                        default:
                                          return Text('');
                                      }
                                    },
                                  ),
                                ),
                              ),
                              borderData: FlBorderData(show: false),
                              gridData: FlGridData(show: false),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Transacciones recientes
            Text('Transacciones Recientes', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView(
                children: [
                  _buildTransactionTile(
                      'Compra en supermercado', 'Alimentos', '-\$120.00', StyleGlobalApk.getColorRedOpaque()),
                  _buildTransactionTile(
                      'Pago de salario', 'Ingresos', '+\$2,000.00', StyleGlobalApk.getColorGreenBlue()),
                  _buildTransactionTile('Pago de luz', 'Servicios', '-\$50.00', StyleGlobalApk.getColorRedOpaque()),
                  _buildTransactionTile(
                      'Venta de producto', 'Ingresos', '+\$300.00', StyleGlobalApk.getColorGreenBlue()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFinancialIndicator(String title, String amount, Color color) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black54)),
        SizedBox(height: 8),
        Text(amount, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)),
      ],
    );
  }

  List<PieChartSectionData> _getPieChartSections() {
    return [
      PieChartSectionData(color: StyleGlobalApk.getColorOpaqueBlue(), value: 40, title: 'Vivienda', radius: 50),
      PieChartSectionData(color: StyleGlobalApk.getColorYellowBurnt(), value: 30, title: 'Comida', radius: 50),
      PieChartSectionData(color: StyleGlobalApk.getColorRedOpaque(), value: 20, title: 'Transporte', radius: 50),
      PieChartSectionData(color: StyleGlobalApk.getColorGreenBlue(), value: 10, title: 'Ahorros', radius: 50),
    ];
  }

  List<BarChartGroupData> _getBarChartGroups() {
    return [
      BarChartGroupData(
          x: 0, barRods: [BarChartRodData(toY: 3500, color: StyleGlobalApk.getColorGreenBlue(), width: 15)]),
      BarChartGroupData(
          x: 1, barRods: [BarChartRodData(toY: 2000, color: StyleGlobalApk.getColorRedOpaque(), width: 15)]),
      BarChartGroupData(
          x: 2, barRods: [BarChartRodData(toY: 1500, color: StyleGlobalApk.getColorOpaqueBlue(), width: 15)]),
    ];
  }

  Widget _buildTransactionTile(String title, String category, String amount, Color color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: StyleGlobalApk.getColorDarkGreen().withAlpha(80),
        child: Icon(Icons.monetization_on, color: StyleGlobalApk.getColorDarkGreen()),
      ),
      title: Text(title),
      subtitle: Text(category),
      trailing: Text(
        amount,
        style: TextStyle(fontWeight: FontWeight.bold, color: color),
      ),
    );
  }
}
