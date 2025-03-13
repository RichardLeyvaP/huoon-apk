

import 'package:flutter/material.dart';
import 'package:huoon/ui/pages/usserPage/Task/bootStoreTask.dart';


class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
    
  {
  'key': 'boot_promt1_travel', 
  'message': '¡Hola! Empecemos, ¿a dónde deseas viajar? 🌍', 
  'hint': 'Ejemplo: Rusia, Japón, París'
},
{
  'key': 'boot_promt2_travel', 
  'message': '¿Cuál es el motivo principal de tu viaje? (vacaciones, negocios, etc.) ✈️', 
  'hint': 'Ejemplo: Vacaciones en familia, reunión de trabajo'
},
{
  'key': 'boot_promt3_travel', 
  'message': '¿Cuánto tiempo planeas quedarte en tu destino? ⏳', 
  'hint': 'Ejemplo: 7 días, 2 semanas'
},
{
  'key': 'boot_promt4_travel', 
  'message': '¿Viajarás solo, en pareja, con amigos o en familia? 👨‍👩‍👧‍👦', 
  'hint': 'Ejemplo: Con mi pareja, con mi familia'
},
{
  'key': 'boot_promt5_travel_fin', 
  'message': '¿Tienes algún interés especial para el viaje? (conocer, historia, naturaleza, etc.) 🗺️', 
  'hint': 'Ejemplo: Historia y cultura, paisajes naturales'
},


  ],title: 'Viajes',module: 'chatIaTravel',),
        ],
      ),
    );
  }
}
