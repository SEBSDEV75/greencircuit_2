// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names, unused_import

import 'dart:typed_data';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../core/constants.dart';
import '../core/dialogs.dart';
import '../core/validator.dart';
import '../data/firebase_service/control.dart';
import '../data/firebase_service/firebase_auth.dart';
import '../util/imagepicker.dart';
import '../widgets/note_button.dart';
import '../widgets/note_form_field.dart';
import 'register.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final email = TextEditingController();
  final email_F = FocusNode();
  final password = TextEditingController();
  final password_F = FocusNode();
  final username = TextEditingController();
  final username_F = FocusNode();
  File? _imageFile;

  late final RegistrationController registrationController;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    registrationController = context.read();
    formKey = GlobalKey();
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
    email_F.dispose();
    password_F.dispose();
  }

  void signUpUser() async {
    setState(() {});

    if (_imageFile == null) {
      showMessageDialog(
        context: context,
        message: 'Es obligatorio usar una imagen.',
      );
      setState(() {});
      return;
    }
  }

  void loginUser() async {
    setState(() {});

    try {
      await Authentication().login(
        email: email.text,
        password: password.text,
      );
    } catch (e) {
      showMessageDialog(
        context: context,
        message:
            'Correo o contraseña incorrectos. Por favor, inténtelo de nuevo.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Selector<RegistrationController, bool>(
                selector: (_, controller) => controller.isRegisterMode,
                builder: (_, isRegisterMode, __) => Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        isRegisterMode ? 'Registro' : 'Iniciar sesión',
                        textAlign: TextAlign.center,
                        style: textTheme.displayLarge?.copyWith(
                          fontSize: 48,
                          fontFamily: 'Fredoka',
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Encendiendo un futuro más verde',
                        textAlign: TextAlign.center,
                        style: textTheme.bodyLarge?.copyWith(
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 48),
                      if (isRegisterMode) ...[
                        const SizedBox(height: 8),
                        Center(
                          child: InkWell(
                            onTap: () async {
                              File imagefilee =
                                  await ImagePickerr().uploadImage('gallery');
                              setState(() {
                                _imageFile = imagefilee;
                              });
                            },
                            child: CircleAvatar(
                              radius: 40.0,
                              backgroundColor: theme.colorScheme.surface,
                              child: _imageFile == null
                                  ? const CircleAvatar(
                                      radius: 38.0,
                                      backgroundImage:
                                          AssetImage('images/person.png'),
                                      backgroundColor: icons,
                                    )
                                  : CircleAvatar(
                                      radius: 38.0,
                                      backgroundImage: Image.file(
                                        _imageFile!,
                                        fit: BoxFit.cover,
                                      ).image,
                                      backgroundColor: Colors.transparent,
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        NoteFormField(
                          controller: username,
                          labelText: 'Nombre de usuario',
                          fillColor: theme.colorScheme.surface,
                          filled: true,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.next,
                          validator: Validator.nameValidator,
                        ),
                        const SizedBox(height: 8),
                      ],
                      NoteFormField(
                        controller: email,
                        labelText: 'Correo electrónico',
                        fillColor: theme.colorScheme.surface,
                        filled: true,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validator: Validator.emailValidator,
                        onChanged: (newValue) {
                          registrationController.email = newValue;
                        },
                      ),
                      const SizedBox(height: 8),
                      Selector<RegistrationController, bool>(
                        selector: (_, controller) =>
                            controller.isPasswordHidden,
                        builder: (_, isPasswordHidden, __) => NoteFormField(
                          controller: password,
                          labelText: 'Contraseña',
                          fillColor: theme.colorScheme.surface,
                          filled: true,
                          obscureText: isPasswordHidden,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              registrationController.isPasswordHidden =
                                  !isPasswordHidden;
                            },
                            child: Icon(
                              isPasswordHidden
                                  ? FontAwesomeIcons.eye
                                  : FontAwesomeIcons.eyeSlash,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          validator: Validator.passwordValidator,
                          onChanged: (newValue) {
                            registrationController.password = newValue;
                          },
                        ),
                      ),
                      const SizedBox(height: 12),
                      if (!isRegisterMode) ...[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const RecoverPasswordpage(),
                              ),
                            );
                          },
                          child: Text(
                            '¿Olvidaste tu contraseña?',
                            style: textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                      SizedBox(
                        height: 48,
                        child: Selector<RegistrationController, bool>(
                          selector: (_, controller) => controller.isLoading,
                          builder: (_, isLoading, __) => NoteButton(
                            onPressed: isLoading
                                ? null
                                : (isRegisterMode ? signUpUser : loginUser),
                            child: isLoading
                                ? const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : Text(
                                    isRegisterMode
                                        ? 'Crear cuenta'
                                        : 'Iniciar sesión',
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text.rich(
                        TextSpan(
                          text: isRegisterMode
                              ? '¿Ya tienes una cuenta? '
                              : '¿No tienes una cuenta? ',
                          children: [
                            TextSpan(
                              text: isRegisterMode
                                  ? 'Iniciar sesión'
                                  : 'Registrarse',
                              style: textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  registrationController.isRegisterMode =
                                      !isRegisterMode;
                                },
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                        style: textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
