import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class HealthPage extends StatefulWidget {
  @override
  _HealthPageState createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
    final List<Map<String, String>> _files = [
  {'name': 'Exámenes Preventivos', 'type': 'Ecografía', 'date': '10/08/2023'},
  {'name': 'Control Médico', 'type': 'Consulta General', 'date': '15/09/2023'},
  {'name': 'Vacunación', 'type': 'Influenza', 'date': '20/03/2023'},
  {'name': 'Resultados de Laboratorio', 'type': 'Hemograma', 'date': '05/07/2023'},
  {'name': 'Chequeo Dental', 'type': 'Limpieza', 'date': '12/04/2023'},
  {'name': 'Terapia Física', 'type': 'Rehabilitación', 'date': '18/06/2023'},
  {'name': 'Diagnóstico', 'type': 'Radiografía', 'date': '25/05/2023'},
  {'name': 'Consulta Pediátrica', 'type': 'Chequeo Anual', 'date': '30/08/2023'},
  {'name': 'Control de Peso', 'type': 'Nutrición', 'date': '02/02/2023'},
  {'name': 'Vacunación', 'type': 'COVID-19 Refuerzo', 'date': '01/12/2023'},
];


  void _addFile(String name, String type) {
    setState(() {
      _files.insert(0, {'name': name, 'type': type});
    });
  }

  void _deleteFile(int index) {
    setState(() {
      _files.removeAt(index);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBudgetCardGeneral('Archivos de Salud', 'Ir a mis Archivos'),
            SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                itemCount: _files.length,
                itemBuilder: (context, index) {
                  final file = _files[index];
                  return FadeIn(
                    child: _buildBudgetCardFiles(file['name']!,file['type']!,'10/08/2023'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
    // Widget para mostrar los bloques de presupuesto
  Widget _buildBudgetCardGeneral(String title, String amount) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ContainerIcon(const Color.fromARGB(255, 92, 205, 195),Icons.business_center,20),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                Text(
              amount,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }

    // Widget para mostrar los bloques de presupuesto
  Widget _buildBudgetCardFiles(String title,String subTitle,  String data) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ContainerIcon(const Color.fromARGB(255, 92, 205, 195),Icons.attach_money,20),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      subTitle,
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 69, 155, 148)),
                    ),
                    Row(
                      children: [
                        Text(
                                      'Sugerencia de ',
                                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500,),
                                    ),Text(
                                      'Huoon',
                                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold ,color: const Color.fromARGB(255, 69, 155, 148)),
                                    ),
                      ],
                    ),
                  ],
                ),
                
              ],
            ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text('10/08/2023',style: TextStyle(fontSize: 10, color: Colors.red),),
         )
          ],
        ),
      ),
    );
  }


  Container ContainerIcon(Color colorContainerIcon,IconData icon, double paddingIcon) {
    return Container(
        decoration: BoxDecoration(
          color:colorContainerIcon.withOpacity(0.3), // Color verde con transparencia
          borderRadius: BorderRadius.circular(20), // Bordes redondeados
        ),
        padding: EdgeInsets.all(paddingIcon),
        child: Icon(
         icon ,
          size: 30, // Tamaño del icono
          color:colorContainerIcon , // Color del icono
        ),
      );
  }
// Widget para mostrar los bloques de presupuesto

}
