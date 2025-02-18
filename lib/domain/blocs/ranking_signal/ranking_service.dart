
// Repositorio de configuración (se asume que ya está inicializado en otro lugar)
import 'package:huoon/data/models/ranking/ranking_model.dart';
import 'package:huoon/data/repository/ranking_repository.dart';
import 'package:huoon/data/services/globalCallApi/apiService.dart';
import 'package:huoon/domain/blocs/ranking_signal/ranking_signals.dart';

final RankingRepository rankingRepository = RankingRepository(authService: ApiService());

// Método para cargar productos
Future<void> getRanking() async {
  isLoadingRK.value = true;
errorMessageRK.value = null;
empyMessageRK.value = null;

  try {
    final result = await rankingRepository.getRanking();

    if (result is String) {
      //está vacio
      empyMessageRK.value = result;
    } else if (result is Ranking) {
      //hay producto
      rankingSignalRK.value = result;
      print('resultado al devolver el rankingRK-$result');
    }
  } catch (error) {
    errorMessageRK.value = error.toString();
  } finally {
    isLoadingRK.value = false;
  }
}

// Método para enviar el producto a la API
Future<void> submitRanking(int taskId,List<Map<String, dynamic>> people) async {
  isLoadingRK.value = true;
errorMessageRK.value = null;
empyMessageRK.value = null;
rankingSubmittedSuccessRK.value = false;

  try {
    await rankingRepository.addRanking(taskId,people);
    rankingSubmittedSuccessRK.value = true;
  } catch (error) {
    errorMessageRK.value = error.toString();
    rankingSubmittedSuccessRK.value = false;
  } finally {
  }
}