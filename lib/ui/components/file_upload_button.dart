import 'package:flutter/material.dart';
import 'dart:io';
import 'package:huoon/data/services/file_upload_service.dart';

class FileUploadButton extends StatelessWidget {
  final String buttonText;
  final List<String>? allowedExtensions;
  final int maxSizeMB;
  final int maxFiles;
  final Function(List<File>) onFilesSelected;

  const FileUploadButton({
    Key? key,
    required this.buttonText,
    this.allowedExtensions,
    this.maxSizeMB = 5,
    this.maxFiles = 1, // Número máximo de archivos permitidos
    required this.onFilesSelected,
  }) : super(key: key);

  Future<void> _pickFiles() async {
    FilePickerResultData result = await FilePickerService.pickFiles(
    allowedExtensions: ["jpg", "png", "pdf"],
    maxSizeMB: 5,
    maxFiles: 1,
  );

    if (result.files.isNotEmpty) {
      onFilesSelected(result.files);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _pickFiles,
      child: Text(buttonText),
    );
  }
}
