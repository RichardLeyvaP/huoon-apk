import 'package:huoon/data/models/filesUsser/filesUsser_model.dart';
import 'package:huoon/data/repository/filesUsser_repository.dart';
import 'package:huoon/data/services/globalCallApi/apiService.dart';
import 'package:huoon/domain/blocs/filesUsser_signal/fileUsser_signal.dart';

// Repositorio de configuración (se asume que ya está inicializado en otro lugar)
final FilesUsserRepository filesUsserRepository = FilesUsserRepository(authService: ApiService());

// Funciones para manejar las acciones y actualizar las señales

// Solicitar configuración
Future<void> requestFilesUsser() async {
  isLoadingFU.value = true;
  errorDescriptionFU.value = null;
try {
    final result = await filesUsserRepository.getFilesUsser();

    print('Tipo de result: ${result.runtimeType}');
    print('Contenido de result: $result');

    if (result is Map<String, dynamic>) { 
      final filesModel = FilesModel.fromJson(result); // Convertimos a FilesModel
      listFileElementFU.value = filesModel.files ?? []; // Asignamos la lista de archivos
    } else {
      print('El resultado no es un Map<String, dynamic>, revisar la API.');
    }
} catch (error) {
    print('Error: $error');
    errorDescriptionFU.value = error.toString();
}

 finally {
    isLoadingFU.value = false;
  }
}


// Enviar configuración actualizada a la API
Future<void> submitFilesUsser(FileElement fileElement ,String sendFilePath) async {
 
    try {
      await filesUsserRepository.storeFilesUsser(fileElement, sendFilePath);
    } catch (error) {
      print('error al intentar subir el archivo: $error');
      errorDescriptionFU.value = error.toString();
    }
  }




void clearConfigurationSignals() {
  // Restablecer las señales a sus valores predeterminados
  fileElementFU.value = null;
  isLoadingFU.value = false;
  updatefileElementFU.value = null;
  errorDescriptionFU.value = null;
}
