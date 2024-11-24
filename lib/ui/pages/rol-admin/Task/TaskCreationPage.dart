import 'package:flutter/material.dart';
import 'package:huoon/ui/pages/rol-admin/Task/secondTaskPage.dart';
import 'package:huoon/ui/pages/rol-admin/Task/startTaskPage.dart';

class TaskCreation extends StatefulWidget {
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
          //1 Página
          StartTaskPage(pageController: _pageController),
          //2 Página
          SecondTaskPage(pageController: _pageController),
        ],
      ),
    );
  }
}
