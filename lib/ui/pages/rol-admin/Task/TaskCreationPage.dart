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
    
  {'key': 'title', 'message': 'Empecemos, ¿me puedes dar el título de la tarea? ✍️', 'hint': 'Título de la tarea'},
  {'key': 'description', 'message': 'Perfecto. Ahora, ¿puedes darme una breve descripción? 📝', 'hint': 'Descripción de la tarea'},
  {'key': 'category', 'message': '¿A qué categoría pertenece esta tarea? 📂', 'hint': ''},
  {'key': 'status', 'message': '¿Qué estado tendría? ✅', 'hint': ''},
  {'key': 'priority', 'message': '¡Muy bien! ¿Ahora qué prioridad le das a esta tarea? 🔥⬆️', 'hint': ''},
  {'key': 'frequencie', 'message': 'Escoge la Frecuencia que deseas darle 📝', 'hint': ''},

  {'key': 'family', 'message': '¡Ya estamos terminando! ¿Qué familiar va a participar en la tarea? 👨‍👩‍👧‍👦', 'hint': ''},
  {'key': 'calendar', 'message': '¡Solo falta la fecha de Inicio y Final! 👏👏', 'hint': ''},


    

    {'key': 'done', 'message': '¡Genial! He registrado todos los datos. ¿Quieres guardar la tarea?', 'hint': 'Confirmar tarea'}
    //ENVIANDO A INSERTAR
        // await storeTask();
  ],title: 'Crear tarea',module: 'storeTask',),
          SecondTaskPage(pageController: _pageController, id: widget.id),
        ],
      ),
    );
  }
}
