

import 'package:flutter/material.dart';
import 'package:huoon/ui/pages/rol/admin/task/bootStoreTask.dart';


class ChatPageFinancePage extends StatefulWidget {
  const ChatPageFinancePage({super.key});

  @override
  _ChatPageFinancePageState createState() => _ChatPageFinancePageState();
}

class _ChatPageFinancePageState extends State<ChatPageFinancePage> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: BouncingScrollPhysics(),
        children: const [
          //1 Página
         TaskChatPage(
  conversationSteps: [
    {
      'key': 'boot_promt1_finance',
      'message': '¡Hola! Comencemos, ¿cuál es tu objetivo financiero principal? 💰',
      'hint': 'Ejemplo: Ahorrar para una casa, planificar mi retiro, pagar deudas'
    },
    {
      'key': 'boot_promt2_finance',
      'message': '¿Cuál es tu ingreso mensual promedio? Esto ayudará a dar mejores recomendaciones. 📈',
      'hint': 'Ejemplo: 2000, 5000'
    },
    {
      'key': 'boot_promt3_finance',
      'message': '¿Cuáles son tus principales gastos mensuales? (alquiler, comida, transporte, etc.) 💳',
      'hint': 'Ejemplo: Alquiler 800, comida 400, transporte 200'
    },
    {
      'key': 'boot_promt4_finance',
      'message': '¿Tienes algún ahorro o inversión actualmente? Si es así, ¿en qué formato? 🏦',
      'hint': 'Ejemplo: Cuenta de ahorro 3000, fondos de inversión 5000'
    },
    {
      'key': 'boot_promt5_finance_fin',
      'message': '¿Qué nivel de riesgo estás dispuesto a asumir en inversiones? 📊',
      'hint': 'Ejemplo: Bajo (prefiero seguridad), Medio, Alto (busco grandes ganancias)'
    },
  ],
  title: 'Finanzas',
  module: 'chatIaFinance',
),

        ],
      ),
    );
  }
}
