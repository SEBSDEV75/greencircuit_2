// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers, use_build_context_synchronously, dead_code

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:greencircuit/data/firebase_service/firebase_auth.dart';
import 'package:greencircuit/util/dialog.dart';
import 'package:greencircuit/util/imagepicker.dart';

class SignupScreen extends StatefulWidget {
  final VoidCallback show;
  const SignupScreen(this.show, {Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final email = TextEditingController();
  final email_F = FocusNode();
  final password = TextEditingController();
  final password_F = FocusNode();
  final passwordConfirme = TextEditingController();
  final passwordConfirme_F = FocusNode();
  final username = TextEditingController();
  final username_F = FocusNode();
  final bio = TextEditingController();
  final bio_F = FocusNode();
  File? _imageFile;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
    passwordConfirme.dispose();
    username.dispose();
    bio.dispose();
    email_F.dispose();
    password_F.dispose();
    passwordConfirme_F.dispose();
    username_F.dispose();
    bio_F.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const _emailPattern = r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$";
    const _passwordPattern = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{7,}$";
    bool _isPasswordHidden = true;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: 80.0),
                  InkWell(
                    onTap: () async {
                      File _imagefilee =
                          await ImagePickerr().uploadImage('gallery');
                      setState(() {
                        _imageFile = _imagefilee;
                      });
                    },
                    child: CircleAvatar(
                      radius: 36.0,
                      backgroundColor: Colors.grey,
                      child: _imageFile == null
                          ? CircleAvatar(
                              radius: 34.0,
                              backgroundImage:
                                  const AssetImage('images/person.png'),
                              backgroundColor: Colors.grey.shade200,
                            )
                          : CircleAvatar(
                              radius: 34.0,
                              backgroundImage: Image.file(
                                _imageFile!,
                                fit: BoxFit.cover,
                              ).image,
                              backgroundColor: Colors.grey.shade200,
                            ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: email,
                    focusNode: email_F,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Correo Electrónico',
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su correo electrónico';
                      }
                      if (!RegExp(_emailPattern).hasMatch(value)) {
                        return 'Por favor ingrese un correo electrónico válido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    controller: username,
                    focusNode: username_F,
                    decoration: const InputDecoration(
                      labelText: 'Nombre',
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Por favor ingrese su nombre';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    controller: bio,
                    focusNode: bio_F,
                    decoration: const InputDecoration(
                      labelText: 'Biografía',
                      prefixIcon: Icon(Icons.description),
                    ),
                    validator: (value) {
                      if (value == null || value.length < 5) {
                        return 'La biografía debe tener al menos 5 caracteres';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    controller: password,
                    focusNode: password_F,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(_isPasswordHidden
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isPasswordHidden = !_isPasswordHidden;
                          });
                        },
                      ),
                    ),
                    obscureText: _isPasswordHidden,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su contraseña';
                      }
                      if (value.length < 7) {
                        return 'La contraseña debe tener al menos 7 caracteres';
                      }
                      if (!RegExp(_passwordPattern).hasMatch(value)) {
                        return 'La contraseña debe contener al menos una letra mayúscula, una letra minúscula y un número';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    controller: passwordConfirme,
                    focusNode: passwordConfirme_F,
                    decoration: const InputDecoration(
                      labelText: 'Confirmar Contraseña',
                      prefixIcon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value != password.text) {
                        return 'Las contraseñas no coinciden';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          await Authentication().Signup(
                            email: email.text,
                            password: password.text,
                            passwordConfirme: passwordConfirme.text,
                            username: username.text,
                            bio: bio.text,
                            profile: _imageFile ?? File(''),
                          );
                          _showVerificationMessage();
                        } on Exception catch (e) {
                          dialogBuilder(context, e.toString());
                        }
                      }
                    },
                    child: const Text('Registrarse'),
                  ),
                  const SizedBox(height: 20.0),
                  Have(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showVerificationMessage() {
    if (context.mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Correo de Verificación Enviado'),
            content: const Text(
                'Un correo de verificación ha sido enviado a tu correo electrónico. Por favor revisa tu bandeja de entrada.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Aceptar'),
              ),
            ],
          );
        },
      );
    }
  }

  Widget Have() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            "No tienes cuenta?",
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
            ),
          ),
          GestureDetector(
            onTap: widget.show,
            child: const Text(
              "Iniciar Sesión",
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
