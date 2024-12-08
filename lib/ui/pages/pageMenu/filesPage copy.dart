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
    {'name': 'Cumpleaños de Juan.mp4', 'type': 'video'},
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
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Archivos', style: TextStyle(fontSize: 18, color: Colors.black)),
            Text('Administra tus documentos y medios',
                style: TextStyle(fontSize: 10, color: Color.fromARGB(150, 0, 0, 0))),
          ],
        ),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.upload_file, color: Colors.black),
        //     onPressed: () {
        //       // Acción para subir archivos
        //       showDialog(
        //         context: context,
        //         builder: (context) {
        //           String name = '';
        //           String type = 'document';
        //           return AlertDialog(
        //             title: const Text('Subir Archivo'),
        //             content: Column(
        //               mainAxisSize: MainAxisSize.min,
        //               children: [
        //                 TextField(
        //                   onChanged: (value) => name = value,
        //                   decoration: const InputDecoration(labelText: 'Nombre del archivo'),
        //                 ),
        //                 DropdownButtonFormField<String>(
        //                   value: type,
        //                   items: [
        //                     DropdownMenuItem(value: 'document', child: Text('Documento')),
        //                     DropdownMenuItem(value: 'image', child: Text('Imagen')),
        //                     DropdownMenuItem(value: 'video', child: Text('Video')),
        //                   ],
        //                   onChanged: (value) => type = value!,
        //                   decoration: const InputDecoration(labelText: 'Tipo de archivo'),
        //                 ),
        //               ],
        //             ),
        //             actions: [
        //               TextButton(
        //                 onPressed: () => Navigator.of(context).pop(),
        //                 child: const Text('Cancelar'),
        //               ),
        //               ElevatedButton(
        //                 onPressed: () {
        //                   if (name.isNotEmpty) {
        //                     _addFile(name, type);
        //                     Navigator.of(context).pop();
        //                   }
        //                 },
        //                 child: const Text('Subir'),
        //               ),
        //             ],
        //           );
        //         },
        //       );
        //     },
        //   ),
        // ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(height: 1.0, thickness: 2.0, color: Color.fromARGB(50, 158, 158, 158)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _files.length,
                itemBuilder: (context, index) {
                  final file = _files[index];
                  return FadeIn(
                    child: Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        leading: Icon(_getIcon(file['type']!), color: Color.fromARGB(255, 93, 137, 233)),
                        title: Text(file['name']!),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Color.fromARGB(255, 218, 113, 113)),
                          onPressed: () => _deleteFile(index),
                        ),
                        onTap: () {
                          // Acción para previsualizar el archivo
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(file['name']!),
                              content: const Text('Aquí se puede previsualizar el archivo.'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Cerrar'),
                                ),
                              ],
                            ),
                          );
                        },
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
