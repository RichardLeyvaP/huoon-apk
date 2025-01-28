import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String body;
  final VoidCallback onCancel;
  final VoidCallback onAccept;

  const ConfirmationDialog({
    Key? key,
    required this.title,
    required this.body,
    required this.onCancel,
    required this.onAccept,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title,style: TextStyle(fontSize: 14),),
      content: Text(body),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: onAccept,
          child: const Text('Aceptar'),
        ),
      ],
    );
  }
}
