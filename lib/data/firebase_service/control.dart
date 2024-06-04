import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../../core/dialogs.dart';
import 'firebase_auth.dart';

class RegistrationController extends ChangeNotifier {
  bool _isRegisterMode = true;
  bool get isRegisterMode => _isRegisterMode;
  set isRegisterMode(bool value) {
    _isRegisterMode = value;
    notifyListeners();
  }

  bool _isPasswordHidden = true;
  bool get isPasswordHidden => _isPasswordHidden;
  set isPasswordHidden(bool value) {
    _isPasswordHidden = value;
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

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> authenticateWithEmailAndPassword({
    required BuildContext context,
  }) async {
    isLoading = true;
    try {
      if (_isRegisterMode) {
        await Authentication().signup(
          username: username,
          email: email,
          password: password,
        );

        if (!context.mounted) return;
        showMessageDialog(
          context: context,
          message:
              'Registro exitoso. Ahora puedes acceder a todo el contenido.',
        );
      } else {
        await Authentication().login(email: email, password: password);
      }
    } on FirebaseAuthException catch (e) {
      if (!context.mounted) return;
      showMessageDialog(
        context: context,
        message: authExceptionMapper[e.code] ?? '¡Ha ocurrido un error!1',
      );
    } catch (e) {
      if (!context.mounted) return;
      if (kDebugMode) {
        print(e.toString());
      }
      showMessageDialog(
        context: context,
        message: '¡Ha ocurrido un error!2',
      );
    } finally {
      isLoading = false;
    }
  }

  // Método para restablecer la contraseña
  Future<void> resetPassword({
    required BuildContext context,
    required String email,
  }) async {
    isLoading = true;
    try {
      await Authentication().resetPassword(email: email);
      if (!context.mounted) return;
      showMessageDialog(
          context: context,
          message:
              'Un correo de recuperación ha sido enviado a $email. Abre el link para cambiar tu contraseña.');
    } on FirebaseAuthException catch (e) {
      if (!context.mounted) return;
      showMessageDialog(
        context: context,
        message: authExceptionMapper[e.code] ?? '¡Ha ocurrido un error!3',
      );
    } catch (e) {
      if (!context.mounted) return;
      showMessageDialog(
        context: context,
        message: '¡Ha ocurrido un error!4',
      );
    } finally {
      isLoading = false;
    }
  }
}
