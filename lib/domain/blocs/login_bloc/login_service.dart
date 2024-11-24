import 'package:huoon/data/models/login/login_model.dart';
import 'package:huoon/data/repository/auth_repository.dart';
import 'package:huoon/data/services/globalCallApi/apiService.dart';
import 'package:huoon/domain/blocs/configuration_bloc/configuration_service.dart';
import 'package:huoon/domain/blocs/products_bloc/products_service.dart';
import 'package:huoon/domain/blocs/store_bloc/store_service.dart';
import 'package:huoon/domain/blocs/task_cat_state_prior.dart/task_cat_state_prior_service.dart';
import 'package:huoon/domain/blocs/tasks/tasks_service.dart';
import 'package:huoon/domain/blocs/user_activity_bloc/user_activity_service.dart';
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
    isLoadingLG.value = false; // Detenemos el loading

    if (result is String) {
      loginMessageLG.value = result; // Si es un mensaje de error
      isLoggedInLG.value = false;
    } else if (result is Login) {
      currentUserLG.value = result; // Guardamos el usuario
      isLoggedInLG.value = true; // El usuario ha iniciado sesión correctamente
      loginMessageLG.value = "Login successful";
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
