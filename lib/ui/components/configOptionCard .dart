import 'package:flutter/material.dart';
import 'package:huoon/ui/util/utils_class_apk.dart';

class ConfigOptionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Widget? trailing; // Puede ser un botón, switch, ícono, etc.

  const ConfigOptionCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    this.trailing, // Puede ser null si no se necesita
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blueGrey[100],
              child: Icon(icon, size: 30, color: Colors.blueGrey[700]),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style:  TextStyle(
                      fontSize: 14,
                      color: StyleGlobalApk.colorPrimary,
                    ),
                  ),
                ],
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
