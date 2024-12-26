import 'package:flutter/material.dart';
import 'package:huoon/ui/pages/rol-admin/Task/bootStoreTask.dart';
import 'package:huoon/ui/pages/rol-admin/store/startStorePage.dart';

class StoreCreation extends StatefulWidget {
  const StoreCreation({super.key});

  @override
  _StoreCreationState createState() => _StoreCreationState();
}

class _StoreCreationState extends State<StoreCreation> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: BouncingScrollPhysics(),
        children: [
          //1 Página
          TaskChatPage(conversationSteps: [
    
  {'key': 'title_store', 'message': 'Empecemos, ¿me puedes dar el título del Almacén? ✍️', 'hint': 'Título del almacén'},
  {'key': 'description_store', 'message': 'Perfecto. Ahora, ¿puedes darme una breve descripción? 📝', 'hint': 'Descripción del Almacén'},
  {'key': 'place_store', 'message': '¿Qué lugar tendría? 📂', 'hint': ''},
  {'key': 'status_store', 'message': '¿Qué permiso vas asignar a este almacén? ', 'hint': ''},    

    {'key': 'done', 'message': '¡Genial! He registrado todos los datos. ¿Quieres guardar el nuevo Almacén?', 'hint': 'Confirmar Almacén'}
    //ENVIANDO A INSERTAR
        // await storeTask();
  ],title: 'Crear Almacén',module: 'storeStore',),
        ],
      ),
    );
  }
}
