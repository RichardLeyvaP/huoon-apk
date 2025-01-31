


import 'package:flutter/material.dart';
import 'package:huoon/ui/pages/rol-admin/Task/bootStoreTask.dart';

class HomeHouseCreation extends StatefulWidget {
  const HomeHouseCreation({super.key});

  @override
  _HomeHouseCreationState createState() => _HomeHouseCreationState();
}

class _HomeHouseCreationState extends State<HomeHouseCreation> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: BouncingScrollPhysics(),
        children: const [
          TaskChatPage(
            conversationSteps: [

              //estos son los selectores de la conversación
              //home_type_id_homeHouse
              //status_id_homeHouse
              //people_homeHouse

              {'key': 'name_homeHouse', 'message': '¿Cuál es el nombre del hogar?', 'hint': 'Nombre del hogar'},
              
              {'key': 'home_type_id_homeHouse', 'message': '¿Qué tipo de hogar es?', 'hint': 'Ejemplo: Casa, Apartamento'},

              {'key': 'residents_homeHouse', 'message': '¿Cuántos residentes viven en el hogar?', 'hint': 'Número de residentes'},

              {'key': 'status_id_homeHouse', 'message': '¿Cuál es el estado del hogar? (Activa, Desocupada, etc.)', 'hint': 'Estado del hogar'},

             // {'key': 'people_homeHouse', 'message': '¿Quiénes serán los residentes del hogar? (IDs y roles)', 'hint': 'Lista de personas con roles'},
              
              {'key': 'address_homeHouse', 'message': '¿Cuál es la dirección del hogar?', 'hint': 'Dirección del hogar'},
              
             // {'key': 'geo_location_homeHouse', 'message': '¿Cuál es la ubicación geográfica del hogar?', 'hint': 'Latitud, Longitud'},
             // {'key': 'timezone_homeHouse', 'message': '¿En qué zona horaria está ubicado el hogar?', 'hint': 'Ejemplo: America/New_York'},              
          //    {'key': 'image_homeHouse', 'message': 'Por favor, proporciona una imagen del hogar.', 'hint': 'URL o archivo de imagen'},              
              {'key': 'done', 'message': '¡Genial! He registrado todos los datos. ¿Quieres guardar el nuevo hogar?', 'hint': 'Confirmar hogar'}
            ],
            title: 'Crear Hogar',
            module: 'storeHomeHouse',
          ),
        ],
      ),
    );
  }
}
