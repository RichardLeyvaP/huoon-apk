

//TODO CODIGO SENSILLO
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:huoon/ui/util/utilsStyleGlobalApk.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _iconTimer;
  late Timer _navigationTimer;
  int _currentIconIndex = 0;

  @override
  void initState() {
    super.initState();

    // Cambia los íconos cada 300 ms
    _iconTimer = Timer.periodic(Duration(milliseconds: 300), (Timer timer) {
      if (mounted) {
        setState(() {
          _currentIconIndex = (_currentIconIndex + 1) % icons.length;
        });
      }
    });

    // Navega después de 3 segundos
    _navigationTimer = Timer(const Duration(seconds: 3), () {
      if (mounted) {
        GoRouter.of(context).go('/LoginFormPage');
      }
    });
  }

  @override
  void dispose() {
    // Cancela los timers cuando el widget se elimina
    _iconTimer.cancel();
    _navigationTimer.cancel();
    super.dispose();
  }
  
  List<IconData> icons = [
    Icons.home,
    Icons.settings,
    Icons.notifications,
    Icons.calendar_today,
    Icons.stacked_line_chart,
    Icons.message,
    Icons.auto_mode_sharp
  ]; // Lista de iconos a mostrar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            // Círculo blanco con los iconos
            Stack(
              alignment: Alignment.center,
              children: [
                // Indicador de carga alrededor del círculo
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(const Color.fromARGB(255, 238, 4, 4)),
                  strokeWidth: 4, // Grosor del borde de la carga
                ),
                // Círculo blanco con los iconos
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      icons[_currentIconIndex], // Icono actual en base al índice
                      color: StyleGlobalApk.colorPrimary,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            // Animación de carga sutil (opcional)
            SpinKitFadingCircle(
              color: StyleGlobalApk.colorPrimary,
              size: 40,
            ),
          ],
        ),
      ),
    );
  }
}
