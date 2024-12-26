// store_signal.dart
import 'package:huoon/data/repository/chat_ia_repository.dart';
import 'package:huoon/data/services/globalCallApi/apiService.dart';
import 'package:huoon/domain/blocs/store_bloc/store_signal.dart';

// Repositorio de configuración (se asume que ya está inicializado en otro lugar)
final ChatIRepository chatIRepository = ChatIRepository(authService: ApiService());

// Método para obtener tiendas
Future<String> requestChatIa(String question,String issue) async {
  isUpdateST.value = false; //esto solo va  atener true cuando se de para modificar
  isStoreLoadingST.value = true;
  storeErrorST.value = null;
  storeEmpyST.value = null;
  storeDataST.value = null;
  int homeId = 1;

  try {
    final result = await chatIRepository.getAnswerIA( question, issue);

    storeEmpyST.value = result;
    storeDataST.value = null;
    return result;
    } catch (error) {
      storeErrorST.value = "Error: ${error.toString()}";
      return 'Error al conectar con la IA, vuelva a intentarlo.';
    
  } finally {
    isStoreLoadingST.value = false;
  }
}






