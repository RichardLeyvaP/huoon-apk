import 'package:huoon/data/models/homeHouseCategory/homeHouseCategory_model.dart';
import 'package:huoon/data/repository/homeHouse_repository.dart';
import 'package:huoon/data/services/globalCallApi/apiService.dart';
import 'package:huoon/domain/blocs/homeHouse_signal/homeHouse_signal.dart';

final HomeHouseRepository homeHouseRepository = HomeHouseRepository(authService: ApiService());
// Método para solicitar categorías, prioridades y otras informaciones
Future<void> fetchCategoriesStatusHomeHouse() async {

  try {
    final jsonResponse = await homeHouseRepository.getCategoriesStatusHomeHouse(); //todo esta fijo el homeId

    // Mapeamos los resultados y los actualizamos en las señales
     List<Hometype> taskTypeList = (jsonResponse['hometypes'] as List<dynamic>).map((typeJson) {
        return Hometype(
          id: typeJson['id'],
          name: typeJson['name'],
          description: typeJson['description'],
        );
      }).toList();  

      taskTypeListHH.value = taskTypeList;  

    List<Homeperson> taskpersonList = (jsonResponse['homepeople'] as List<dynamic>).map((personJson) {
      return Homeperson(
        id: personJson['id'],
        namePerson: personJson['namePerson'],
        imagePerson: personJson['imagePerson'],
      );
    }).toList();

    taskpersonListHH.value = taskpersonList;    

    List<Homerole> rolesList = (jsonResponse['homeroles'] as List<dynamic>).map((roleJson) {
      return Homerole(
        id: roleJson['id'],
        nameRol: roleJson['nameRol'],
        descriptionRol: roleJson['descriptionRol'],
      );
    }).toList();

    rolesListHH.value = rolesList;

    List<Homestatus> statusList = (jsonResponse['homestatus'] as List<dynamic>).map((statusJson) {
      return Homestatus(
        id: statusJson['id'],
        nameStatus: statusJson['nameStatus'],
        iconStatus: statusJson['iconStatus'],
        colorStatus: statusJson['colorStatus'],
        descriptionStatus: statusJson['descriptionStatus'],
      );
    }).toList();

    statusListHH.value = statusList;
     
    List<Homewarehouse> warehouseList = (jsonResponse['homewarehouses'] as List<dynamic>).map((warehouseJson) {
      return Homewarehouse(
        id: warehouseJson['id'],
        nameWarehouses: warehouseJson['nameWarehouses'],
        descriptionWarehouses: warehouseJson['descriptionWarehouses'],
        locationWarehouses: warehouseJson['locationWarehouses'],
      );
    }).toList();

    warehouseListHH.value = warehouseList;


    
  
  } catch (error) {
    
 
  } finally {

  }
}

// Método para enviar homeHouse a la API
Future<void> submitHomeHouse() async {
  isLoadingHH.value = true;
  try {
    await homeHouseRepository.addHomeHouse();
    isLoadingHH.value = false;
    isHomeErrorHH.value = false;
    homeMessageHH.value = "HomeHouse enviado con éxito";
  } catch (error) {
    isLoadingHH.value = false;
    isHomeErrorHH.value = true;
    homeMessageHH.value = "Error al enviar HomeHouse: ${error.toString()}";
  }
}

