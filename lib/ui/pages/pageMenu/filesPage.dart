import 'dart:io';

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:huoon/domain/blocs/filesUsser_signal/fileUsser_service.dart';
import 'package:huoon/domain/blocs/filesUsser_signal/fileUsser_signal.dart';
import 'package:huoon/domain/blocs/homeHouse_signal/homeHouse_signal.dart';
import 'package:intl/intl.dart';
import 'package:signals/signals_flutter.dart';

class FilesPage extends StatefulWidget {
  @override
  _FilesPageState createState() => _FilesPageState();
}

class _FilesPageState extends State<FilesPage> {
  late Future<void> _loadFilesFuture;

  @override
  void initState() {
    super.initState();
    _loadFilesFuture = loadFilesUsser();
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

  // Modificar loadFilesUsser para devolver un Future
  Future<void> loadFilesUsser() async {
    Future.delayed(Duration(seconds: 4) ); // Simula una carga de 2 segundos
    // Siempre verifico si tiene hogar, sino no mando a la API
    print('aqui mostrando a homeSelectHH:${homeSelectHH.value}');
    if (homeSelectHH.value != null) {
      await requestFilesUsser(); // Solicita los archivos
    } else {
      // Si no tiene hogar, muestra un mensaje de error
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('No tiene hogar asignado'),
        duration: const Duration(seconds: 2),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _loadFilesFuture, // Utilizamos el Future de carga de archivos
        builder: (context, snapshot) {
          // Muestra un cargando mientras se espera el resultado
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // Si hubo un error, muestra un mensaje
          if (snapshot.hasError) {
            return Center(child: Text('Error al cargar los archivos'));
          }

          // Si la carga fue exitosa, construye la interfaz
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBudgetCardGeneral('Archivos', 'Ir a mis Archivos'),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: listFileElementFU.watch(context)?.length ?? 0,
                    itemBuilder: (context, index) {
                      return FadeIn(
                        child: _buildBudgetCardFiles(
                          listFileElementFU.value![index].name!,
                          listFileElementFU.value![index].type!,
                          DateFormat('yyyy-MM-dd').format(listFileElementFU.value![index].date!), // Formatea la fecha
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBudgetCardGeneral(String title, String amount) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ContainerIcon(const Color.fromARGB(255, 92, 205, 195), Icons.business_center, 20),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title (${listFileElementFU.value?.length ?? 0})',
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

// Widget _buildBudgetCardFiles(String title, String subTitle, DateTime date, String fileType, String filePath) {
//   return Card(
//     elevation: 1,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//     child: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               _getFileIcon(fileType, filePath), // Icono dinámico según el tipo de archivo
//               SizedBox(width: 10),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
//                   ),
//                   Text(
//                     subTitle,
//                     style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 69, 155, 148)),
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         'Sugerencia de ',
//                         style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
//                       ),
//                       Text(
//                         'Huoon',
//                         style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 69, 155, 148)),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               DateFormat('yyyy-MM-dd').format(date),
//               style: TextStyle(fontSize: 10, color: Colors.red),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// /// Función para obtener el icono adecuado según el tipo de archivo
// Widget _getFileIcon(String fileType, String filePath) {
//   if (["jpg", "jpeg", "png", "gif"].contains(fileType.toLowerCase())) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(10),
//       child: Image.file(
//         File(filePath),
//         width: 50,
//         height: 50,
//         fit: BoxFit.cover,
//       ),
//     );
//   } else if (fileType == "pdf") {
//     return _iconContainer(Colors.red, Icons.picture_as_pdf);
//   } else if (["doc", "docx"].contains(fileType.toLowerCase())) {
//     return _iconContainer(Colors.blue, Icons.description);
//   } else if (["mp3", "wav", "aac"].contains(fileType.toLowerCase())) {
//     return _iconContainer(Colors.orange, Icons.audiotrack);
//   } else if (["mp4", "avi", "mov"].contains(fileType.toLowerCase())) {
//     return _iconContainer(Colors.purple, Icons.video_library);
//   } else {
//     return _iconContainer(Colors.grey, Icons.insert_drive_file);
//   }
// }

// /// Contenedor de iconos con color de fondo
// Widget _iconContainer(Color color, IconData icon) {
//   return Container(
//     decoration: BoxDecoration(
//       color: color.withOpacity(0.3),
//       borderRadius: BorderRadius.circular(20),
//     ),
//     padding: EdgeInsets.all(10),
//     child: Icon(
//       icon,
//       size: 30,
//       color: color,
//     ),
//   );
// }


  Widget _buildBudgetCardFiles(String title, String subTitle, String data) {
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
                ContainerIcon(const Color.fromARGB(255, 92, 205, 195), Icons.attach_money, 20),
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
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 69, 155, 148)),
                    ),
                    Row(
                      children: [
                        Text(
                          'Sugerencia de ',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Huoon',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 69, 155, 148)),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                data,
                style: TextStyle(fontSize: 10, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container ContainerIcon(Color colorContainerIcon, IconData icon, double paddingIcon) {
    return Container(
      decoration: BoxDecoration(
        color: colorContainerIcon.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(paddingIcon),
      child: Icon(
        icon,
        size: 30,
        color: colorContainerIcon,
      ),
    );
  }
}
