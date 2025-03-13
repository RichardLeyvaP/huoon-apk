import 'package:flutter/material.dart';
import 'package:huoon/ui/pages/usserPage/Task/bootStoreTask.dart';
import 'package:huoon/ui/pages/usserPage/Task/secondTaskPage.dart';
import 'package:huoon/ui/pages/usserPage/Task/startTaskPage.dart';

class TaskUpdate extends StatefulWidget {
  final int? id; // ID opcional que se recibe

  TaskUpdate({this.id});

  @override
  _TaskUpdateState createState() => _TaskUpdateState();
}

class _TaskUpdateState extends State<TaskUpdate> {
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
         StartTaskPage(pageController: _pageController, id: widget.id),         
         SecondTaskPage(pageController: _pageController, id: widget.id),
        ],
      ),
    );
  }
}
