import 'package:huoon/data/models/login/login_model.dart';
import 'package:huoon/data/repository/authRepository.dart';
import 'package:huoon/data/services/globalApiService.dart';
import 'package:huoon/domain/signals/configuration_signals/configuration_service.dart';
import 'package:huoon/domain/signals/products_signals/products_service.dart';
import 'package:huoon/domain/signals/store_signals/store_service.dart';
import 'package:huoon/domain/signals/task_cat_state_prior_signals/task_cat_state_prior_service.dart';
import 'package:huoon/domain/signals/tasks_signals/tasks_service.dart';
import 'package:huoon/domain/signals/user_activity_signals/user_activity_service.dart';
import 'login_signal.dart';

// Este es el servicio que maneja la lógica de login

final authRepository = AuthRepository(authService: ApiService());
// Método para hacer login
Future<void> login(String email, String password) async {
  isLoadingLG.value = true; // Indicamos que está cargando
  isLoginErrorLG.value = false; // Indicamos inicialmente que no hay error
  isLoggedInLG.value = null; // Indicamos inicialmente que es null

  try {
    final result = await authRepository.login(email, password);
    

    if (result is String) {
      loginMessageLG.value = result; // Si es un mensaje de error
      isLoggedInLG.value = false;
      isLoadingLG.value = false; // Detenemos el loading
    } else if (result is Login) {
      currentUserLG.value = result; // Guardamos el usuario
      isLoggedInLG.value = true; // El usuario ha iniciado sesión correctamente
      loginMessageLG.value = "Login successful";
      isLoadingLG.value = false; // Detenemos el loading
    }
  } catch (e) {
    
    isLoginErrorLG.value = true;
    isLoadingLG.value = false;
    loginMessageLG.value = "Error: ${e.toString()}"; // Si ocurre un error
  }
}

void clearLoginSignals() {
  // Restablecer las señales a sus valores predeterminados
  isLoggedInLG.value = null;
  loginMessageLG.value = "";
  currentUserLG.value = null;
  isLoadingLG.value = false;
  isLoginErrorLG.value = false;
}

void logoutAndClearSignals() {
  // Limpiar señales de login
  clearLoginSignals();

  // Limpiar señales de configuración
  clearConfigurationSignals();

  // Limpiar señales de categorías y prioridades
  clearCategoryStatusPrioritySignals();

  // Limpiar señales de productos
  clearProductSignals();

  // Limpiar señales de tienda
  clearStoreSignals();

  // Limpiar señales de tareas
  clearTaskSignals();

  // Limpiar señales de la acción del usuario
  clearUserActionSignals();
}
