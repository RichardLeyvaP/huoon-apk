import 'package:huoon/data/models/login/login_model.dart';
import 'package:huoon/data/repository/auth_repository.dart';
import 'package:huoon/data/services/authGoogle_service.dart';
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

// Método para hacer login
Future<bool> loginGoogle(String id,String? name,String email, String? image) async {
  isLoadingLG.value = true; // Indicamos que está cargando
  isLoginErrorLG.value = false; // Indicamos inicialmente que no hay error
  isLoggedInLG.value = null; // Indicamos inicialmente que es null

  try {
    final result = await authRepository.loginWithGoogle(id,name??'Sin Nombre',email,image??'');
    isLoadingLG.value = false; // Detenemos el loading

    if (result is String) {
      loginMessageLG.value = result; // Si es un mensaje de error
      isLoggedInLG.value = false;
      return false;
    } else if (result is Login) {
      currentUserLG.value = result; // Guardamos el usuario
      isLoggedInLG.value = true; // El usuario ha iniciado sesión correctamente
      loginMessageLG.value = "Login successful";
      return true;
    }
    else//dio otro resultado no esperado
    {
       isLoggedInLG.value = null; 
    isLoginErrorLG.value = true;
    isLoadingLG.value = false;
    loginMessageLG.value = "Error: Resultado inesperado: ${result.runtimeType}"; // Si ocurre un error
return false;
    }
  } catch (e) {
    
     isLoggedInLG.value = null; 
    isLoginErrorLG.value = true;
    isLoadingLG.value = false;
    loginMessageLG.value = "Error: ${e.toString()}"; // Si ocurre un error
    return false;
  }
}


// Método para hacer Registr
Future<void> register(String name,String email, String password,String language,String usser) async {
  isLoadingLG.value = true; // Indicamos que está cargando
  isLoginErrorLG.value = false; // Indicamos inicialmente que no hay error
  isLoggedInLG.value = null; // Indicamos inicialmente que es null

  try {
    final result = await authRepository.register( name, email,  password, language, usser);
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
    isLoggedInLG.value = null;
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



Future<bool> logoutApk()
async {
  try {
   // final result = await authRepository.logout();
    if(true == true)
    {     
      signOutFromGoogle();
logoutAndClearSignals();
return true;
    }
    else
    {
      return false;
    }    
    

  } catch (e) {
    return false;
  }

}

void logoutAndClearSignals() {
  print('saliendo de la aplicacion- CORECTAMENTE');
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
   isLoggedInLG.value = null;
}
