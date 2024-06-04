import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/constants.dart';
import '../core/validator.dart';
import '../data/firebase_service/control.dart';
import '../widgets/note_back_button.dart';
import '../widgets/note_button.dart';
import '../widgets/note_form_field.dart';

class RecoverPasswordpage extends StatefulWidget {
  const RecoverPasswordpage({super.key});

  @override
  State<RecoverPasswordpage> createState() => _RecoverPasswordpageState();
}

class _RecoverPasswordpageState extends State<RecoverPasswordpage> {
  late final TextEditingController emailController;

  GlobalKey<FormFieldState> emailKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    // Inicializa el controlador de texto para el campo de correo electrónico
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    // Libera los recursos del controlador de texto cuando el widget se destruye
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const NoteBackButton(),
        title: const Text('Recuperar contraseña'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'No te preocupes! Nosotros te enviamos un enlace para recuperar tu contraseña!',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              NoteFormField(
                key: emailKey,
                controller: emailController,
                fillColor: white,
                filled: true,
                labelText: 'Correo electronico',
                validator: Validator
                    .emailValidator, // Utiliza el validador de correo electrónico
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 48,
                child: Selector<RegistrationController, bool>(
                  selector: (_, controller) => controller.isLoading,
                  builder: (_, isLoading, __) => NoteButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            // Si el formulario es válido, llama al método para restablecer la contraseña
                            if (emailKey.currentState?.validate() ?? false) {
                              context
                                  .read<RegistrationController>()
                                  .resetPassword(
                                    context: context,
                                    email: emailController.text.trim(),
                                  );
                            }
                          },
                    child: isLoading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(color: white),
                          )
                        : const Text('Enviar enlace de recuperación'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
