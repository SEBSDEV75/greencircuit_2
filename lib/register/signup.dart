// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers, use_build_context_synchronously, dead_code

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greencircuit/data/firebase_service/firebase_auth.dart';
import 'package:greencircuit/util/dialog.dart';
import 'package:greencircuit/util/imagepicker.dart';

import '../core/constants.dart'; // Asegúrate de importar las constantes

class SignupScreen extends StatefulWidget {
  final VoidCallback showLogin;
  const SignupScreen(this.showLogin, {Key? key}) : super(key: key);

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
  bool _isPasswordHidden = true;

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
    const _passwordPattern =
        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@\$!%*?&])[A-Za-z\d@$!%*?&]{7,}$";

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 80.h),
                  InkWell(
                    onTap: () async {
                      File _imagefilee =
                          await ImagePickerr().uploadImage('gallery');
                      setState(() {
                        _imageFile = _imagefilee;
                      });
                    },
                    child: CircleAvatar(
                      radius: 36.r,
                      backgroundColor: Colors.grey,
                      child: _imageFile == null
                          ? CircleAvatar(
                              radius: 34.r,
                              backgroundImage:
                                  const AssetImage('images/person.png'),
                              backgroundColor: Colors.grey.shade200,
                            )
                          : CircleAvatar(
                              radius: 34.r,
                              backgroundImage: Image.file(
                                _imageFile!,
                                fit: BoxFit.cover,
                              ).image,
                              backgroundColor: Colors.grey.shade200,
                            ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  TextFormField(
                    controller: email,
                    focusNode: email_F,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Correo Electrónico',
                      prefixIcon: const Icon(Icons.email, color: icons),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: const BorderSide(
                          color: gray900,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: const BorderSide(
                          color: gray900,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su correo electrónico';
                      } else if (!RegExp(_emailPattern).hasMatch(value)) {
                        return 'Por favor ingrese un correo electrónico válido';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.h),
                  TextFormField(
                    controller: password,
                    focusNode: password_F,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      prefixIcon: const Icon(Icons.lock, color: icons),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordHidden
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: icons,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordHidden = !_isPasswordHidden;
                          });
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: const BorderSide(
                          color: gray900,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: const BorderSide(
                          color: gray900,
                        ),
                      ),
                    ),
                    obscureText: _isPasswordHidden,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su contraseña';
                      } else if (value.length <= 6) {
                        return 'La contraseña debe tener más de 6 caracteres';
                      } else if (!RegExp(_passwordPattern).hasMatch(value)) {
                        return 'La contraseña debe tener una mayúscula, una minúscula, un número y un carácter especial';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.h),
                  TextFormField(
                    controller: passwordConfirme,
                    focusNode: passwordConfirme_F,
                    decoration: InputDecoration(
                      labelText: 'Confirme su contraseña',
                      prefixIcon: const Icon(Icons.lock, color: icons),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: const BorderSide(
                          color: gray900,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: const BorderSide(
                          color: gray900,
                        ),
                      ),
                    ),
                    obscureText: _isPasswordHidden,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor confirme su contraseña';
                      } else if (value != password.text) {
                        return 'Las contraseñas no coinciden';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.h),
                  TextFormField(
                    controller: username,
                    focusNode: username_F,
                    decoration: InputDecoration(
                      labelText: 'Nombre de usuario',
                      prefixIcon: const Icon(Icons.person, color: icons),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: const BorderSide(
                          color: gray900,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: const BorderSide(
                          color: gray900,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su nombre de usuario';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.h),
                  TextFormField(
                    controller: bio,
                    focusNode: bio_F,
                    decoration: InputDecoration(
                      labelText: 'Bio',
                      prefixIcon: const Icon(Icons.info, color: icons),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: const BorderSide(
                          color: gray900,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: const BorderSide(
                          color: gray900,
                        ),
                      ),
                    ),
                    maxLines: 3,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese una breve bio';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.h),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Usar context de la función build del widget padre
                        var parentContext = context;
                        try {
                          await Authentication().Signup(
                            email: email.text,
                            password: password.text,
                            passwordConfirme: passwordConfirme.text,
                            username: username.text,
                            bio: bio.text,
                            profile: _imageFile ?? File(''),
                          );

                          showDialog(
                            context: parentContext,
                            builder: (context) => AlertDialog(
                              title: Text(
                                'Correo de Verificación Enviado',
                                style: TextStyle(fontSize: 24.sp),
                              ),
                              content: Text(
                                'Por favor, revisa tu bandeja de entrada y sigue las instrucciones para verificar tu correo electrónico.',
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text(
                                    'OK',
                                    style: TextStyle(fontSize: 18.sp),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } on Exception catch (e) {
                          dialogBuilder(parentContext, e.toString());
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: white,
                      backgroundColor: primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      'Registrarse',
                      style: TextStyle(
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: widget.showLogin,
                    child: Text(
                      '¿Ya tienes una cuenta? Inicia sesión',
                      style: TextStyle(
                        color: gray700,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
