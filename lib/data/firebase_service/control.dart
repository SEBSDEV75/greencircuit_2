// ignore_for_file: use_build_context_synchronously, deprecated_member_use
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../../widgets/navigation.dart';
import 'firebase_auth.dart';

class RegistrationController extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isPasswordHidden = true;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String _username = '';
  set username(String value) {
    _username = value;
    notifyListeners();
  }

  String get username => _username.trim();

  String _email = '';
  set email(String value) {
    _email = value;
    notifyListeners();
  }

  String get email => _email.trim();

  String _password = '';
  set password(String value) {
    _password = value;
    notifyListeners();
  }

  String get password => _password;

  FirebaseAuth get auth => _auth;

  Future<void> authenticateWithEmailAndPassword({
    required BuildContext context,
    File? profileImage,
  }) async {
    isLoading = true;
    try {
      // Registro de usuario
      await Authentication().signup(
        username: username,
        email: email,
        password: password,
      );
      // Verificación del correo electrónico
      if (!context.mounted) return;
      showMessageDialog(
        context: context,
        message:
            'Un correo de verificación ha sido enviado a tu correo, por favor revisa tu bandeja de entrada.',
      );

      // Actualizar el usuario hasta que el correo electrónico esté verificado
      while (!Authentication().isEmailVerified) {
        await Future.delayed(
          const Duration(seconds: 5),
          () => Authentication().user?.reload(),
        );
      }

      // Mostrar mensaje de bienvenida una vez verificado
      if (context.mounted) {
        showWelcomeDialog(context);
      }
    } on FirebaseAuthException catch (e) {
      if (!context.mounted) return;
      showMessageDialog(
        context: context,
        message: authExceptionMapper[e.code] ?? 'A ocurrido un error!',
      );
    } catch (e) {
      if (!context.mounted) return;
      showMessageDialog(
        context: context,
        message: 'A ocurrido un error!',
      );
    } finally {
      isLoading = false;
    }
  }

  void showMessageDialog({
    required BuildContext context,
    required String message,
    String? actionLabel,
    VoidCallback? action,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              action?.call();
            },
            child: Text(actionLabel ?? 'Aceptar'),
          ),
        ],
      ),
    );
  }

  void showWelcomeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¡Bienvenido a GreenCircuit!'),
        content: const Text(
            'Gracias por verificar tu correo. ¡Bienvenido a la comunidad GreenCircuit!'),
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
      ),
    );
  }

  // Método para restablecer la contraseña
  Future<void> resetPassword({
    required BuildContext context,
    required String email,
  }) async {
    isLoading = true;
    notifyListeners();
    try {
      await Authentication().resetPassword(email: email);
      if (!context.mounted) return;
      showMessageDialog(
          context: context,
          message:
              'Un correo de verificación ha sido enviado a $email. Asegúrate de revisar tu bandeja de entrada.');
    } on FirebaseAuthException catch (e) {
      if (!context.mounted) return;
      showMessageDialog(
        context: context,
        message: authExceptionMapper[e.code] ?? 'A ocurrido un error!',
      );
    } catch (e) {
      if (!context.mounted) return;
      showMessageDialog(
        context: context,
        message: 'A ocurrido un error!',
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
