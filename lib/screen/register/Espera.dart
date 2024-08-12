// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../widgets/navigation.dart';

class WelcomeDialog extends StatelessWidget {
  const WelcomeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Bienvenido a GreenCircuit'),
      content: const Text(
          'Estamos emocionados de tenerte con nosotros. ¡Gracias por unirte a nuestra comunidad!'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const Navigations_Screen()),
            );
          },
          child: const Text('Continuar'),
        ),
      ],
    );
  }
}
