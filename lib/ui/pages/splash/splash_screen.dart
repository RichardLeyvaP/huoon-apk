// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();

//     // Inicializa el AnimationController
//     _controller = AnimationController(
//       duration: const Duration(seconds: 3), // Duración de la animación
//       vsync: this,
//     )..repeat(); // Hace que la animación sea repetitiva mientras se carga

//     // Navega a la pantalla de Login después de 3 segundos
//     Timer(const Duration(milliseconds: 3120), () {
//       _controller.dispose(); // Limpia el controlador
//       GoRouter.of(context).go(
//         //mando a la vista de Login
//         '/LoginFormPage',
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: RotationTransition(
//           turns: _controller,
//           child: Image.asset(
//             'assets/splash/huoon_splash.jpg',
//             fit: BoxFit.cover,
//             width: 200, // Ajusta el tamaño si es necesario
//             height: 200, // Ajusta el tamaño si es necesario
//           ),
//         ),
//       ),
//     );
//   }
// }

//TODO CODIGO SENSILLO
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Simula una carga inicial y navega después de 3 segundos
    Timer(const Duration(seconds: 3), () {
      GoRouter.of(context).go(
        //mando a la vista de Login
        '/LoginFormPage',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/splash/huoon_splash.jpg',
          fit: BoxFit.cover,
          width: 200, // Ajusta el tamaño si es necesario
          height: 200, // Ajusta el tamaño si es necesario
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}
