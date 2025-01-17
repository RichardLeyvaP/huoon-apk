


  import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:huoon/domain/blocs/user_activity_bloc/user_activity_service.dart';

class WishesPage extends StatefulWidget {
  @override
  _WishesPageState createState() => _WishesPageState();
}

class _WishesPageState extends State<WishesPage> {


   final List<Map<String, dynamic>> _files = [
    {'name': 'Viajar a Japón', 'description': 'Punta Arenas', 'completed': false,'frequency' :'Media'},
    {'name': 'Aprender un nuevo idioma', 'description': 'Osorno', 'completed': false,'frequency' :'Alta'},
    {'name': 'Correr una maratón', 'description': 'En casa', 'completed': true,'frequency' :'Media'},
    {'name': 'Leer 20 libros este año', 'description': 'Lorial', 'completed': false,'frequency' :'Media'},
    {'name': 'Hacer un curso de cocina', 'description': 'Osorno', 'completed': false,'frequency' :'Baja'},
    {'name': 'Ahorrar para una casa', 'description': 'En casa', 'completed': true,'frequency' :'Media'},
    {'name': 'Aprender a tocar guitarra', 'description': 'Punta Arenas', 'completed': false,'frequency' :'Media'},
    {'name': 'Participar en voluntariado', 'description': 'En casa', 'completed': true,'frequency' :'Media'},
    {'name': 'Tener un jardín en casa', 'description': 'Osorno', 'completed': false,'frequency' :'Media'},
    {'name': 'Subir a una montaña', 'description': 'En casa', 'completed': false,'frequency' :'Media'},
    {'name': 'Pintar un cuadro', 'description': 'Punta Arenas', 'completed': false,'frequency' :'Media'},
    {'name': 'Organizar las fotos familiares', 'description': 'Osorno', 'completed': true,'frequency' :'Media'},
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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // user_activity Actualizando estado
      onScreenChange('screen_Home_Wishes');
    });

    super.initState();
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                itemCount: _files.length,
                itemBuilder: (context, index) {
                  final file = _files[index];
                  return FadeIn(
                    child: _buildBudgetCardFiles(const Color.fromARGB(255, 205, 92, 188),file['name']!,file['description']!,file['frequency']!),
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
  Widget _buildBudgetCardFiles(Color color, String title,String direction,  String frequency) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContainerIcon(color,Icons.attach_money,20),
                SizedBox(width: 15),
                Padding(
                  padding: const EdgeInsets.only(top:  10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '  $title',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                     SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.location_on,color:  Colors.blue,),Text(
                                        direction,
                                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold ,color:  Colors.blue),
                                      ),
                        ],
                      ),
                    ],
                  ),
                ),
                
              ],
            ),
         Padding(
           padding: const EdgeInsets.only(top: 10, right:  8.0),
           child: Text(frequency,style: TextStyle(fontSize: 10, color: Colors.red),),
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
