import 'package:huoon/data/models/homeHouseCategory/homeHouseCategory_model.dart';
import 'package:huoon/data/models/homeHouseUsser/homeHouseUsser_model.dart';
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


Future<void> fetchHomeHouseUsser() async {

  try {
    final jsonResponse = await homeHouseRepository.getHomeHouseUsser(); //todo esta fijo el homeId

    // Mapeamos los resultados y los actualizamos en las señales
    List<Home> homeHouseUsserList = [];
    if (jsonResponse['homes'] != null) {
  homeHouseUsserList = (jsonResponse['homes'] as List<dynamic>).map((typeJson) {
    return Home(
      id: typeJson['id'],
      statusId: typeJson['statusId'],
      homeStatusId: typeJson['homeStatusId'],
      name: typeJson['name'],
      address: typeJson['address'],
      homeTypeId: typeJson['homeTypeId'],
      homeHomeTypeId: typeJson['homeHomeTypeId'],
      nameHomeType: typeJson['nameHomeType'],
      residents: typeJson['residents'],
      geoLocation: typeJson['geoLocation'],
      homeGeoLocation: typeJson['homeGeoLocation'],
      timezone: typeJson['timezone'],
      nameStatus: typeJson['nameStatus'],
      image: typeJson['image'],
      people: typeJson['people'] != null
          ? (typeJson['people'] as List<dynamic>).map((personJson) {
              return PersonHomeUsser(
                id: personJson['id'],
                name: personJson['name'],
                image: personJson['image'],
                roleId: personJson['roleId'],
                roleName: personJson['roleName'],
              );
            }).toList()
          : [],
    );
  }).toList();
}


      homeHouseUsserHH.value = homeHouseUsserList;  
      if(homeSelectHH.value == null)
      {
        if (homeHouseUsserList[0].id != null) {
          setHomeSelectHH(homeHouseUsserList[0].id!);
        }
      }
    
  
  } catch (error) {
    print('error al cargar los hogares:$error');
 
  } finally {

  }
}

setHomeSelectHH (int? homeId){
  homeSelectHH.value = homeId;
}

getHomeSelectHH (){
  return homeSelectHH.value;
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

