import 'package:flutter/material.dart';

class NonEditableTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final VoidCallback? onTap; // Callback para manejar el clic

  const NonEditableTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.onTap, // Callback opcional
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Llama al callback al hacer clic
      child: AbsorbPointer( // Evita que se pueda escribir directamente en el campo
        child: TextFormField(
          controller: controller,
          readOnly: true, // Asegura que no se pueda editar
          decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
          ),
          style: TextStyle(
            fontSize: 16,
            color: Colors.black, // Texto normal sin opacidad
          ),
        ),
      ),
    );
  }
}
