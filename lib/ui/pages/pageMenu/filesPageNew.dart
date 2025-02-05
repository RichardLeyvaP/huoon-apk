import 'dart:io';
import 'package:flutter/material.dart';
import 'package:huoon/ui/components/file_upload_button.dart';

class FilesPageNew extends StatefulWidget {
  @override
  _FilesPageNewState createState() => _FilesPageNewState();
}

class _FilesPageNewState extends State<FilesPageNew> {
  List<File> selectedFiles = [];

  void _handleFilesSelected(List<File> files) {
    if (files.isNotEmpty) {
      setState(() {
        selectedFiles.addAll(files);
      });
      _showFilesModal(); // Mostrar el modal después de seleccionar archivos
    }
  }

  void _removeFile(int index) {
    setState(() {
      selectedFiles.removeAt(index);
    });
  }

  void _showFilesModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Permite que el modal ocupe más espacio
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5, // 50% de la pantalla
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Archivos Seleccionados",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: selectedFiles.length,
                  itemBuilder: (context, index) {
                    File file = selectedFiles[index];
                    String fileName = file.path.split('/').last;
                    String fileExtension = fileName.split('.').last.toLowerCase();

                    Widget fileIcon;
                    if (["jpg", "jpeg", "png"].contains(fileExtension)) {
                      fileIcon = Image.file(file, width: 50, height: 50, fit: BoxFit.cover);
                    } else if (fileExtension == "pdf") {
                      fileIcon = Icon(Icons.picture_as_pdf, size: 50, color: Colors.red);
                    } else {
                      fileIcon = Icon(Icons.insert_drive_file, size: 50, color: Colors.grey);
                    }

                    return ListTile(
                      leading: fileIcon,
                      title: Text(fileName, style: TextStyle(fontSize: 14)),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          _removeFile(index);
                          if (selectedFiles.isEmpty) Navigator.pop(context); // Cierra el modal si no hay archivos
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print("Subiendo archivos: ${selectedFiles.map((f) => f.path).toList()}");
                      Navigator.pop(context);
                    },
                    child: Text("Cancelar"),
                  ),
                  ElevatedButton(
                onPressed: () {
                  print("Subiendo archivos: ${selectedFiles.map((f) => f.path).toList()}");
                  Navigator.pop(context);
                },
                child: Text("Subir Archivos"),
              ),
                ],
              ),
              
              
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Subir Archivos')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FileUploadButton(
              buttonText: "Seleccionar Archivos",
              allowedExtensions: ["jpg", "png", "pdf"],
              maxFiles: 5, // Permite hasta 5 archivos
              maxSizeMB: 10,
              onFilesSelected: _handleFilesSelected,
            ),
            SizedBox(height: 20),
            if (selectedFiles.isNotEmpty)
              ElevatedButton(
                onPressed: _showFilesModal,
                child: Text("Ver Archivos Seleccionados"),
              ),
          ],
        ),
      ),
    );
  }
}
