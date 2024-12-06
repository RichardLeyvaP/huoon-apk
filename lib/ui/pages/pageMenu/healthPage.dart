import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:huoon/ui/util/utils_class_apk.dart';

class HealthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Explora tus opciones',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: StyleGlobalApk.getColorRedOpaque(),
                      size: 40,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Resumen de Salud',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: StyleGlobalApk.getColorGreenBlue(),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Buen estado general\nÚltima revisión: 10/11/2024',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildFeatureCard(
                    icon: Icons.chat,
                    title: 'Chatbot de Salud',
                    color: StyleGlobalApk.getColorOpaqueBlue(),
                    onTap: () {
                      // Navegar a la funcionalidad
                      GoRouter.of(context).push('/ChatPage');
                    },
                  ),
                  _buildFeatureCard(
                    icon: Icons.access_time,
                    title: 'Recordatorios',
                    color: StyleGlobalApk.getColorGreenBlue(),
                    onTap: () {
                      GoRouter.of(context).push('/RemindersPage');
                    },
                  ),
                  _buildFeatureCard(
                    icon: Icons.analytics,
                    title: 'Análisis de Datos',
                    color: StyleGlobalApk.getColorYellowBurnt(),
                    onTap: () {
                      //llamar a la ruta de /DataAnalysisPage
                      GoRouter.of(context).push('/DataAnalysisPage');
                    },
                  ),
                  _buildFeatureCard(
                    icon: Icons.health_and_safety,
                    title: 'Mi Salud',
                    color: StyleGlobalApk.getColorRedOpaque(),
                    onTap: () {
                      GoRouter.of(context).push('/MyHealthPage');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.health_and_safety), label: 'Mi Salud'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Colors.white),
            SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
