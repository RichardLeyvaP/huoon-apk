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
         TaskChatPage(),
          SecondTaskPage(pageController: _pageController, id: widget.id),
        ],
      ),
    );
  }
}
