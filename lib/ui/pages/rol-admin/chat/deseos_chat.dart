

import 'package:flutter/material.dart';
import 'package:huoon/ui/pages/rol-admin/Task/deseosChatBoot.dart';


class DeseosPage extends StatefulWidget {
  const DeseosPage({super.key});

  @override
  _DeseosPageState createState() => _DeseosPageState();
}

class _DeseosPageState extends State<DeseosPage> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: BouncingScrollPhysics(),
        children: [
          //1 Página
          DeseosChatPage(conversationSteps: [
    
  {
  'key': 'boot_promt1_travel', 
  'message': '¡Hola! Cuéntame, ¿cuál es tu deseo o meta principal?', 
  'hint': 'Ejemplo: Rusia, Japón, París'
},

  ],title: 'Viajes',module: 'chatIaTravel',),
        ],
      ),
    );
  }
}
