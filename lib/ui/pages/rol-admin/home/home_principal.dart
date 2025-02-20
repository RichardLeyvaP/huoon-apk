import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:huoon/domain/blocs/configuration_bloc/configuration_service.dart';
import 'package:huoon/domain/blocs/configuration_bloc/configuration_signal.dart';
import 'package:huoon/ui/util/utils_class_apk.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePrincipal extends StatefulWidget {
  const HomePrincipal({super.key});

  @override
  _HomePrincipalState createState() => _HomePrincipalState();
}

class _HomePrincipalState extends State<HomePrincipal> {
  Future<void>? _futureConfiguration;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (configurationCF.value == null) {
      _futureConfiguration = requestConfiguration();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _futureConfiguration,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child:
                    CircularProgressIndicator()); // Muestra un loader mientras carga
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
                    'Error: ${snapshot.error}')); // Muestra un mensaje de error
          } else {
            return Scaffold(
              body: Stack(
                children: [
                  // Fondo con degradado que ocupa toda la pantalla
                  Container(
                    height: MediaQuery.of(context)
                        .size
                        .height, // Ocupa toda la altura de la pantalla
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 158, 223, 224),
                          Color.fromARGB(255, 226, 202, 201)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                  // Contenido de la pantalla, sobre el degradado
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        // Contenedor del título y avatar (simula el AppBar)
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 40, left: 16, right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Título
                              Text(
                                'huoon',
                                style: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold,
                                  color: StyleGlobalApk.colorPrimary,
                                ),
                              ),
                              // Avatar
                              CircleAvatar(
                                radius: 25,
                                backgroundImage: NetworkImage(
                                  'https://plus.unsplash.com/premium_photo-1683121366070-5ceb7e007a97?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D',
                                ),
                                backgroundColor: Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                        // Card con sugerencias
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 20),
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Sugerencias diarias',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundImage: AssetImage(
                                            'assets/images/icon-Huoon.jpg'),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Aun no tienes planes para hoy.\n¡Organiza tu día y aprobecha al máximo!',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Fila de iconos
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.calendar_month_outlined,
                              ),
                              SizedBox(width: 10),
                              Icon(Icons.lightbulb_outline, color: Colors.black),
                              SizedBox(width: 10),
                              Icon(Icons.favorite_outline, color: Colors.black),
                              SizedBox(width: 10),
                              Icon(Icons.message_outlined, color: Colors.black),
                              SizedBox(width: 10),
                              InkWell(
                                  onTap: () {
                                    GoRouter.of(context).push('/RankingPage');
                                  },
                                  child: Icon(MdiIcons.trophy,
                                      color: Colors.black)),
                            ],
                          ),
                        ),
                        // Fila de texto
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Lo más importante de hoy',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Ver todos',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Card principal con 4 sub-card
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 20),
                            child: Container(
                              padding: const EdgeInsets.all(
                                  0), // Añadido un padding alrededor de todo
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        // Card 1 (Cuadrado más grande)
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom:
                                                  16), // Márgenes entre las tarjetas
                                          child: CustomCard(
                                            color: Colors
                                                .orangeAccent, // Color de fondo
                                            topIcon: Icons
                                                .calendar_month, // Icono de arriba
                                            bottomIcon: Icons
                                                .calendar_month_outlined, // Icono de abajo
                                            title: "Tareas", // Título
                                            width: 200, // Ancho personalizado
                                            height: 200, // Alto personalizado
                                          ),
                                        ),
                                        // Card 2 (Más largo)
                                        CustomCard(
                                          color:
                                              Colors.purple, // Color de fondo
                                          topIcon:
                                              Icons.favorite, // Icono de arriba
                                          bottomIcon: Icons
                                              .favorite_outline, // Icono de abajo
                                          title: "Salud", // Título
                                          width: 200, // Ancho personalizado
                                          height: 260, // Alto personalizado
                                          top: 120,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          16), // Separador entre las columnas
                                  Expanded(
                                    child: Column(
                                      children: [
                                        // Card 3 (Más largo)
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom:
                                                  16), // Márgenes entre las tarjetas
                                          child: CustomCard(
                                            color: Colors
                                                .lightBlue, // Color de fondo
                                            topIcon: Icons
                                                .lightbulb, // Icono de arriba
                                            bottomIcon: Icons
                                                .lightbulb_outline, // Icono de abajo
                                            title: "Sugerencias", // Título
                                            width: 200, // Ancho personalizado
                                            height: 260, // Alto personalizado
                                            top: 120,
                                          ),
                                        ),
                                        // Card 4 (Cuadrado más pequeño)

                                        CustomCard(
                                          color: Colors
                                              .greenAccent, // Color de fondo
                                          topIcon:
                                              Icons.message, // Icono de arriba
                                          bottomIcon: Icons
                                              .message_outlined, // Icono de abajo
                                          title: "Mensajes", // Título
                                          width: 200, // Ancho personalizado
                                          height: 200, // Alto personalizado
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}

class CustomCard extends StatelessWidget {
  final Color color;
  final IconData topIcon;
  final IconData bottomIcon;
  final String title;
  final double width;
  final double height;
  final double top;
  final double left;
  final double right;

  const CustomCard({
    required this.color,
    required this.topIcon,
    required this.bottomIcon,
    required this.title,
    this.width = 190,
    this.height = 190,
    this.top = 50,
    this.left = 10,
    this.right = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color.withOpacity(0.7),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Stack(
        children: [
          // Icono grande en la parte superior con desvanecimiento
          Positioned(
            top: top, //,50,
            left: left, //10,
            right: right, //0,
            child: Transform.rotate(
              angle: 0.3, // Girar a la izquierda
              child: Opacity(
                opacity: 0.2,
                child: Icon(
                  topIcon,
                  size: 140, // Tamaño grande del icono
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // Título en la parte superior izquierda
          Positioned(
            top: 16,
            left: 16,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          // Icono en la parte inferior derecha
          Positioned(
            bottom: 16,
            right: 16,
            child: Container(
  padding: EdgeInsets.all(8), // Espaciado interno
  decoration: BoxDecoration(
    color: color, // Cambia este color según tu necesidad
    borderRadius: BorderRadius.circular(12), // Bordes redondeados
  ),
  child: Icon(
    bottomIcon,
    size: 30,
    color: Colors.black,
  ),
)
,
          ),
        ],
      ),
    );
  }
}
