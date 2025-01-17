import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class FilesPage extends StatefulWidget {
  @override
  _FilesPageState createState() => _FilesPageState();
}

class _FilesPageState extends State<FilesPage> {
  final List<Map<String, String>> _files = [
    {'name': 'Factura de Luz.pdf', 'type': 'document'},
    {'name': 'Foto Familiar.png', 'type': 'image'},
    {'name': 'Cumpleaños Juan.mp4', 'type': 'video'},
    {'name': 'Lista de Compras.docx', 'type': 'document'},
    {'name': 'Recibo de Agua.pdf', 'type': 'document'},
    {'name': 'Plano de la Casa.png', 'type': 'image'},
    {'name': 'Fiesta de Fin de Año.mp4', 'type': 'video'},
    {'name': 'Horario de Actividades.docx', 'type': 'document'},
    {'name': 'Certificado de Nacimiento.png', 'type': 'image'},
    {'name': 'Vacaciones en la Playa.mp4', 'type': 'video'},
    {'name': 'Contrato de Alquiler.docx', 'type': 'document'},
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

  IconData _getIcon(String type) {
    switch (type) {
      case 'image':
        return Icons.image;
      case 'video':
        return Icons.video_library;
      case 'document':
      default:
        return Icons.insert_drive_file;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBudgetCardGeneral('Archivos', 'Ir a mis Archivos'),
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
