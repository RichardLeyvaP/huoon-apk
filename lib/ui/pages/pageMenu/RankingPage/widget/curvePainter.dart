import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  final ui.Image? image;

  CurvePainter(this.image);

  @override
  void paint(Canvas canvas, Size size) {
    if (image != null) {
      final paintImage = Paint()
        ..colorFilter = ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken);

      final imageRect = Rect.fromLTRB(0, 0, size.width, size.height);
      final srcRect = Rect.fromLTRB(0, 0, image!.width.toDouble(), image!.height.toDouble());

      canvas.drawImageRect(image!, srcRect, imageRect, paintImage);
    }

    // Pintar la capa azul
    final paint = Paint()
      ..color = const Color.fromARGB(255, 12, 59, 130).withOpacity(0.9)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height)
      ..quadraticBezierTo(
        size.width / 2, size.height * 1.2,
        size.width, size.height,
      )
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
