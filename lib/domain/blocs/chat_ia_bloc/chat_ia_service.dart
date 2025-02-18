// store_signal.dart
import 'dart:convert';

import 'package:huoon/data/repository/chat_ia_repository.dart';
import 'package:huoon/data/services/globalCallApi/apiService.dart';
import 'package:huoon/domain/blocs/chat_ia_bloc/chat_ia_signal.dart';

// Repositorio de configuración (se asume que ya está inicializado en otro lugar)
final ChatIRepository chatIRepository = ChatIRepository(authService: ApiService());

// Método para obtener tiendas

Map<String, dynamic> handleResponse(String response) {
  try {
    // Limpiar posibles bloques de código Markdown
    response = response.trim();
    if (response.startsWith("```json")) {
      response = response.replaceAll("```json", "").replaceAll("```", "").trim();
    }

    // Reemplazar las comillas simples por comillas dobles
    response = response.replaceAll("'", '"');

    // Intentamos decodificar la respuesta como JSON
    final parsedJson = json.decode(response);

    if (parsedJson is Map<String, dynamic>) {
      print("📦 Es un JSON:");
      print(parsedJson);
      return parsedJson;
    } else {
      print("⚠️ No es un JSON válido.");
      return {};
    }
  } catch (e) {
    // Si falla la conversión, asumimos que es una palabra
    print("🔤 Es una palabra: $response");
    return {};
  }
}



Future<String> requestChatIa(String question,String issue) async {
  isUpdateIA.value = false; //esto solo va  atener true cuando se de para modificar
  isChatIaLoadingIA.value = true;
  chatiaErrorIA.value = null;
  chatiaEmpyIA.value = null;
  int homeId = 1;

  try {
    final result = await chatIRepository.getAnswerIA(question, issue);
    
    Map<String, dynamic> jsonResponse = handleResponse(result);

  // Verificar si el JSON es vacío
  if (jsonResponse.isEmpty) {
    chatiaEmpyIA.value = result;//result es una palabra
  } else {
    chatiaEmpyIA.value = jsonEncode(jsonResponse); // Se guarda como JSON válido en String
  }
    
    return chatiaEmpyIA.value!;
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





