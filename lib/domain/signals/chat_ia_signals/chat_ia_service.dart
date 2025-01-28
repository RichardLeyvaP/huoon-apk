// store_signal.dart
import 'package:huoon/data/repository/chatIaRepository.dart';
import 'package:huoon/data/services/globalApiService.dart';
import 'package:huoon/domain/signals/chat_ia_signals/chat_ia_signal.dart';

// Repositorio de configuración (se asume que ya está inicializado en otro lugar)
final ChatIRepository chatIRepository = ChatIRepository(authService: ApiService());

// Método para obtener tiendas
Future<String> requestChatIa(String question,String issue) async {
  isUpdateIA.value = false; //esto solo va  atener true cuando se de para modificar
  isChatIaLoadingIA.value = true;
  chatiaErrorIA.value = null;
  chatiaEmpyIA.value = null;
  int homeId = 1;

  try {
    final result = await chatIRepository.getAnswerIA(question, issue);

    chatiaEmpyIA.value = result;
    return result;
    } catch (error) {
      chatiaErrorIA.value = "Error: ${error.toString()}";
      return 'Error al conectar con la IA, vuelva a intentarlo.';
    
  } finally {
    isChatIaLoadingIA.value = false;
  }
}

// Método para enviar el producto a la API
Future<void> submitChatIa(String module,String answerIa,String question) async {
  isChatIaLoadingIA.value = true;
  chatiaErrorIA.value = null;
  chatiaEmpyIA.value = null;
  isSubmittingIA.value = false;

  try {
    await chatIRepository.addChatIa(module,answerIa,question);
     isSubmittingIA.value = true;
   
  } catch (error) {
    chatiaErrorIA.value = error.toString();
     isSubmittingIA.value = false;
  } finally {
    isChatIaLoadingIA.value = false;
  }
}

updateAddCantAnswer()
{
cantAnswer.value ++;
}
int getCantAnswer()
{
return cantAnswer.value;
}

updateClearCantAnswer()
{
cantAnswer.value = 0;
}


//variable que guarda la respuesta de la ia y manda  la db a guardarla
updateSendAnswerApi(String sendAnswer)
{
sendAnswerApi.value = sendAnswer;
}

String? getSendAnswer()
{
return sendAnswerApi.value;
}





