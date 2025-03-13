

import 'package:flutter/material.dart';
import 'package:huoon/ui/pages/usserPage/Task/bootStoreTask.dart';


class ChatHealthPage extends StatefulWidget {
  const ChatHealthPage({super.key});

  @override
  _ChatHealthPageState createState() => _ChatHealthPageState();
}

class _ChatHealthPageState extends State<ChatHealthPage> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: BouncingScrollPhysics(),
        children: [
          //1 Página
         TaskChatPage(
  conversationSteps: [
    {
      'key': 'boot_promt1_health',
      'message': '¿Cuál es tu principal objetivo de salud? (ej. bajar de peso, aumentar masa muscular, bienestar general, etc.) 💪',
      'hint': 'Ejemplo: Bajar de peso, bienestar general'
    },
    {
      'key': 'boot_promt2_health',
      'message': '¿Cuál es tu nivel actual de actividad física? (sedentario, moderado, activo) 🏃‍♂️',
      'hint': 'Ejemplo: Sedentario, hago ejercicio 2 veces a la semana'
    },
   
    {
      'key': 'boot_promt4_health',
      'message': '¿Cuántas horas de sueño tienes normalmente por noche? 🌙',
      'hint': 'Ejemplo: 6 horas, 8 horas'
    },
    {
      'key': 'boot_promt5_health_fin',
      'message': '¿Tienes alguna preocupación o condición médica específica que debamos considerar? 🏥',
      'hint': 'Ejemplo: Hipertensión, diabetes, ninguna'
    },
  ],
  title: 'Salud',
  module: 'chatIaHealth',
),

        ],
      ),
    );
  }
}
