import 'package:file_picker/file_picker.dart';
import 'dart:io';

class FilePickerResultData {
  final List<File> files;
  final String? errorMessage;

  FilePickerResultData({required this.files, this.errorMessage});
}

class FilePickerService {
  static bool isFilePickerActive = false; // Bandera para controlar si el FilePicker está activo

  static Future<FilePickerResultData> pickFiles({
    List<String>? allowedExtensions,
    int maxSizeMB = 5,
    int maxFiles = 1, // Número máximo de archivos permitidos
  }) async {
    // Si el FilePicker ya está activo, no hacer nada
    if (isFilePickerActive) {
      return FilePickerResultData(files: [], errorMessage: "El FilePicker ya está en uso.");
    }

    isFilePickerActive = true; // Marcar el FilePicker como activo

    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: maxFiles > 1, // Si maxFiles > 1, permite selección múltiple
        type: allowedExtensions == null ? FileType.any : FileType.custom,
        allowedExtensions: allowedExtensions,
      );

      if (result == null) {
        return FilePickerResultData(files: [], errorMessage: "No se seleccionaron archivos.");
      }

      List<File> files = result.files.map((f) => File(f.path!)).toList();
      
      // Filtrar archivos por tamaño
      List<File> validFiles = [];
      for (var file in files) {
        int fileSizeInMB = file.lengthSync() ~/ (1024 * 1024);
        if (fileSizeInMB > maxSizeMB) {
          return FilePickerResultData(
            files: [],
            errorMessage: "El archivo '${file.path.split('/').last}' supera los $maxSizeMB MB.",
          );
        }
        validFiles.add(file);
      }

      // Limitar la cantidad de archivos seleccionados
      if (validFiles.length > maxFiles) {
        return FilePickerResultData(
          files: [],
          errorMessage: "Solo puedes seleccionar hasta $maxFiles archivos.",
        );
      }

      return FilePickerResultData(files: validFiles);
    } catch (e) {
      return FilePickerResultData(files: [], errorMessage: "Error al seleccionar archivos: $e");
    } finally {
      isFilePickerActive = false; // Marcar el FilePicker como inactivo
    }
  }
}
