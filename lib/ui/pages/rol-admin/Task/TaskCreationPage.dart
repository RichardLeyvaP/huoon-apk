import 'package:flutter/material.dart';
import 'package:huoon/ui/pages/rol-admin/Task/bootStoreTask.dart';
import 'package:huoon/ui/pages/rol-admin/Task/secondTaskPage.dart';
import 'package:huoon/ui/pages/rol-admin/Task/startTaskPage.dart';

class TaskCreation extends StatefulWidget {
  final int? id; // ID opcional que se recibe

  TaskCreation({this.id});

  @override
  _TaskCreationState createState() => _TaskCreationState();
}

class _TaskCreationState extends State<TaskCreation> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        // physics: BouncingScrollPhysics(),//activa el deslizamiento con el dedo
        physics: NeverScrollableScrollPhysics(), // Desactiva el deslizamiento con el dedo
        children: [
          // Pasar el ID a las páginas
         // StartTaskPage(pageController: _pageController, id: widget.id),
         TaskChatPage(conversationSteps: [
     {'key': 'typeTask', 'message': '¡Que deseas crear?', 'hint': ''},
     
     {'key': 'frequencie', 'message': '¡Solo falta escoger la Frecuencia que deseas darle!', 'hint': ''},

  {'key': 'title', 'message': '¿Me puedes decir qué titulo quieres ponerle?', 'hint': 'Escriba el Título'},
  {'key': 'description', 'message': 'Perfecto. Ahora  dame una breve descripción ', 'hint': 'Escriba la descripción '},
  {'key': 'calendar', 'message': 'Que fecha de Inicio y Final tendría?', 'hint': ''},
  {'key': 'frequencie', 'message': 'La Frecuencia que deseas darle', 'hint': ''},
  {'key': 'category', 'message': '¿A qué categoría pertenece? ', 'hint': ''},
  //{'key': 'status', 'message': '¿Qué estado tendría? ', 'hint': ''},
  {'key': 'priority', 'message': '¡Muy bien! ¿Ahora qué prioridad le das?', 'hint': ''},
  {'key': 'family', 'message': '¡Ya estamos terminando! ¿Qué familiar va a participar?', 'hint': ''}, 
    {'key': 'done', 'message': '¡Genial! He registrado todos los datos. ¿Quieres guardarlo', 'hint': 'Confirmar'}
    //ENVIANDO A INSERTAR
        // await storeTask();
  ],title: 'Crear tarea',module: 'storeTask',),
          SecondTaskPage(pageController: _pageController, id: widget.id),
        ],
      ),
    );
  }
}
