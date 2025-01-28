import 'package:flutter/material.dart';
import 'package:huoon/ui/components/confirmationDialogWidget%20.dart';


class DialogUtils {
  /// Muestra un modal de confirmación reutilizable
  static Future<bool?> showConfirmationDialog({
    required BuildContext context,
    required String title,
    required String body,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return ConfirmationDialog(
          title: title,
          body: body,
          onCancel: () => Navigator.of(context).pop(false), // Retorna false al cancelar
          onAccept: () => Navigator.of(context).pop(true), // Retorna true al aceptar
        );
      },
    );
  }
}
