import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final Color? backgroundColor; // Color de fondo opcional
  final Color? textColor; // Color del texto opcional
  final double? width; // Ancho opcional
  final double? height; // Altura opcional

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.backgroundColor = Colors.white, // Valor predeterminado
    this.textColor = const Color.fromARGB(255, 43, 44, 49), // Valor predeterminado
    this.width, // Valor opcional
    this.height = 60, // Valor predeterminado
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width * 0.9, // Valor predeterminado si no se proporciona
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all<Color>(textColor!),
          backgroundColor: WidgetStateProperty.all<Color>(backgroundColor!),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 17,
            letterSpacing: -.5,
          ),
        ),
      ),
    );
  }
}
