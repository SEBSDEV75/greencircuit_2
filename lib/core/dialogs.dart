import 'package:flutter/material.dart';

import '../widgets/confirmation_dialog.dart';
import '../widgets/message_dialog.dart';
import '../widgets/new_tag_dialog.dart';

// Función para mostrar un diálogo para ingresar una nueva etiqueta
Future<String?> showNewTagDialog({
  required BuildContext context,
  String? tag,
}) {
  return showDialog<String?>(
    context: context,
    builder: (context) => NewTagDialog(
        tag: tag), // Utiliza el NewTagDialog para construir el diálogo
  );
}

// Función para mostrar un diálogo de confirmación con un título dado
Future<bool?> showConfirmationDialog({
  required BuildContext context,
  required String title,
}) {
  return showDialog<bool?>(
    context: context,
    builder: (_) => ConfirmationDialog(
        title:
            title), // Utiliza el ConfirmationDialog para construir el diálogo
  );
}

// Función para mostrar un diálogo de mensaje con un mensaje dado
Future<bool?> showMessageDialog({
  required BuildContext context,
  required String message,
}) {
  return showDialog<bool?>(
    context: context,
    builder: (_) => MessageDialog(
        message: message), // Utiliza el MessageDialog para construir el diálogo
  );
}
