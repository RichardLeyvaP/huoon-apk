import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:huoon/ui/util/utilsStyleGlobalApk.dart';

class DataAnalysisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60, // Altura ajustada para mayor visibilidad
        backgroundColor: Colors.transparent, // Fondo transparente para un diseño limpio
        elevation: 0, // Sin sombra para mantener un estilo moderno
        title: Center(
          child: Column(
            children: [
              Text(
                'Asistente de Salud', // Título principal
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: StyleGlobalApk.getColorGreenBlue(), // Color relacionado con salud y tranquilidad
                ),
              ),
              Text(
                'Tu guía personalizada en bienestar',
                style: TextStyle(
                  fontSize: 12,
                  color: StyleGlobalApk.getColorGreenBlue().withAlpha(80), // Un tono más suave
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.notifications_none, // Ícono para notificaciones
              color: StyleGlobalApk.getColorGreenBlue(), // Color consistente
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.0),
          child: Divider(
            height: 2.0,
            thickness: 2.0,
            color: StyleGlobalApk.getColorGreenBlue().withAlpha(80), // Color claro para separar secciones
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tendencias de Salud',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              _buildLineChart(),
              SizedBox(height: 32),
              Text(
                'Distribución de Datos',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              _buildBarChart(),
              SizedBox(height: 32),
              Text(
                'Proporciones',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              _buildPieChart(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLineChart() {
    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(show: true),
          borderData: FlBorderData(
            border: Border.all(color: Colors.grey, width: 1),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 3),
                FlSpot(1, 4),
                FlSpot(2, 2),
                FlSpot(3, 5),
                FlSpot(4, 3.5),
                FlSpot(5, 4.5),
              ],
              isCurved: true,
              color: StyleGlobalApk.getColorOpaqueBlue(),
              barWidth: 3,
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBarChart() {
    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(show: true),
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [
                BarChartRodData(toY: 8, color: StyleGlobalApk.getColorGreenBlue()),
              ],
            ),
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(toY: 10, color: StyleGlobalApk.getColorGreenBlue()),
              ],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [
                BarChartRodData(toY: 14, color: StyleGlobalApk.getColorGreenBlue()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPieChart() {
    return SizedBox(
      height: 200,
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              color: StyleGlobalApk.getColorRedOpaque(),
              value: 40,
              title: '40%',
              radius: 50,
              titleStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            PieChartSectionData(
              color: StyleGlobalApk.getColorOpaqueBlue(),
              value: 30,
              title: '30%',
              radius: 50,
              titleStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            PieChartSectionData(
              color: StyleGlobalApk.getColorGreenBlue(),
              value: 30,
              title: '30%',
              radius: 50,
              titleStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
