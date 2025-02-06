import 'dart:io';

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:huoon/data/services/files/fileService.dart';
import 'package:huoon/domain/blocs/filesUsser_signal/fileUsser_service.dart';
import 'package:huoon/domain/blocs/filesUsser_signal/fileUsser_signal.dart';
import 'package:huoon/domain/blocs/homeHouse_signal/homeHouse_signal.dart';
import 'package:huoon/ui/components/cacheImageWidget.dart';
import 'package:huoon/ui/pages/env.dart';
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
                      debugPrint('este es el archivo : ${listFileElementFU.value![index].archive}');
                      return FadeIn(
                        child: _buildBudgetCardFiles(
                          listFileElementFU.value![index].id!,
                          listFileElementFU.value![index].name!,
                          listFileElementFU.value![index].type!,
                          DateFormat('yyyy-MM-dd').format(listFileElementFU.value![index].date!), // Formatea la fecha
                          listFileElementFU.value![index].archive!,
                          listFileElementFU.value![index].type!,
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
            ContainerIcon(const Color.fromARGB(255, 92, 205, 195), 20, 'business_center', false),
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


  Widget _buildBudgetCardFiles(int id,String title, String subTitle, String data,String archive,String type) {
bool isImage = false;
if (type.toLowerCase() == 'image' || 
    type.toLowerCase() == 'jpg' || 
    type.toLowerCase() == 'jpeg' || 
    type.toLowerCase() == 'png') {
  // Lógica para manejar imágenes
  isImage = true;
}
 else if (type.toLowerCase() == 'pdf') {
    archive = 'pdf';
    // Lógica para manejar archivos PDF
  } else if (type.toLowerCase() == 'doc' || type.toLowerCase() == 'docx') {
    // Lógica para manejar documentos de Word
    archive = 'doc';
  } else if (type.toLowerCase() == 'xls' || type.toLowerCase() == 'xlsx') {
    // Lógica para manejar archivos de Excel
    archive = 'xls';
  } else if (type.toLowerCase() == 'txt') {
    // Lógica para manejar archivos de texto
    archive = 'txt';
  } else {
    archive = 'different';
    // Lógica para manejar otros tipos de archivos
  }

    
    return InkWell(
      onTap: () {
        print('este es mi Archivo: $archive');
        print('este es mi Archivo-2: ${Env.apiEndpoint}/images/$archive');
        FileService.handleFile(context, '${Env.apiEndpoint}/images/$archive',id);
      },
      child: Card(
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
                  // (Color colorContainerIcon, IconData icon, double paddingIcon, String image, bool isImage)
                  ContainerIcon(const Color.fromARGB(255, 92, 205, 195), 20, '${Env.apiEndpoint}/images/$archive', isImage),
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
      ),
    );
  }

  Container ContainerIcon(Color colorContainerIcon, double paddingIcon, String archive, bool isImage) {
    IconData iconType;

if (isImage) {
  iconType = Icons.image;
} else if (archive == 'pdf') {
  iconType = Icons.picture_as_pdf;
} else if (archive == 'doc') {
  iconType = Icons.description;
} else if (archive == 'xls') {
  iconType = Icons.table_chart;
} else if (archive == 'txt') {
  iconType = Icons.text_snippet;
} else if (archive == 'business_center') {
  iconType = Icons.business_center;
}
 else {
  iconType = Icons.insert_drive_file;
}

    return Container(
      decoration: BoxDecoration(
        color: colorContainerIcon.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(1),
      child: 
      isImage ?
      ClipRRect(
          borderRadius: BorderRadius.circular(20), // Aplica el redondeo a la imagen
          child: cacheImageWidget(image: archive),
        ):
                                        Icon(
        iconType,
        size: 30,
        color: colorContainerIcon,
      )
    );

    
  }
}
