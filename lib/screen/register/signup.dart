// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers, use_build_context_synchronously, dead_code

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/constants.dart';
import '../../core/validator.dart';
import '../../data/firebase_service/control.dart';
import '../../util/imagepicker.dart';

class SignupScreen extends StatefulWidget {
  final VoidCallback showLogin;
  const SignupScreen(this.showLogin, {Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late final RegistrationController registrationController;
  late final GlobalKey<FormState> formKey;

  final email = TextEditingController();
  final email_F = FocusNode();
  final password = TextEditingController();
  final password_F = FocusNode();
  final passwordConfirme = TextEditingController();
  final passwordConfirme_F = FocusNode();
  final username = TextEditingController();
  final username_F = FocusNode();
  File? _imageFile;
  bool _isPasswordHidden = true;

  @override
  void initState() {
    super.initState();
    registrationController = context.read();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundlight,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 80.h),
                  Text(
                    'Crea tu cuenta',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: secondary,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  InkWell(
                    onTap: () async {
                      File _imagefilee =
                          await ImagePickerr().uploadImage('gallery');
                      setState(() {
                        _imageFile = _imagefilee;
                      });
                    },
                    child: CircleAvatar(
                      radius: 50.r,
                      backgroundColor: gray700,
                      child: _imageFile == null
                          ? CircleAvatar(
                              radius: 48.r,
                              backgroundImage:
                                  const AssetImage('images/person.png'),
                              backgroundColor: Colors.grey.shade200,
                            )
                          : CircleAvatar(
                              radius: 48.r,
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
                      prefixIcon: const Icon(Icons.email, color: icons2),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: const BorderSide(color: gray700),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: const BorderSide(color: primary),
                      ),
                    ),
                    validator: Validator.emailValidator,
                  ),
                  SizedBox(height: 10.h),
                  TextFormField(
                    controller: password,
                    focusNode: password_F,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      prefixIcon: const Icon(Icons.lock, color: icons2),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordHidden
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: icons2,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordHidden = !_isPasswordHidden;
                          });
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: const BorderSide(color: gray700),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: const BorderSide(color: primary),
                      ),
                    ),
                    obscureText: _isPasswordHidden,
                    validator: Validator.passwordValidator,
                  ),
                  SizedBox(height: 10.h),
                  TextFormField(
                    controller: passwordConfirme,
                    focusNode: passwordConfirme_F,
                    decoration: InputDecoration(
                      labelText: 'Confirma tu contraseña',
                      prefixIcon: const Icon(Icons.lock, color: icons2),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: const BorderSide(color: gray700),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: const BorderSide(color: primary),
                      ),
                    ),
                    obscureText: _isPasswordHidden,
                    validator: (value) {
                      if (value != password.text) {
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
                      labelText: 'Nombre de Usuario',
                      prefixIcon: const Icon(Icons.person, color: icons2),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: const BorderSide(color: gray700),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: const BorderSide(color: primary),
                      ),
                    ),
                    validator: Validator.nameValidator,
                  ),
                  SizedBox(height: 30.h),
                  Consumer<RegistrationController>(
                    builder: (context, controller, _) {
                      return ElevatedButton(
                        onPressed: controller.isLoading
                            ? null
                            : () async {
                                if (formKey.currentState?.validate() ?? false) {
                                  registrationController.username =
                                      username.text.trim();
                                  registrationController.email =
                                      email.text.trim();
                                  registrationController.password =
                                      password.text.trim();
                                  await registrationController
                                      .authenticateWithEmailAndPassword(
                                    context: context,
                                    profileImage: _imageFile,
                                  );
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                        ),
                        child: controller.isLoading
                            ? const CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              )
                            : Text(
                                'Registrarse',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: icons,
                                ),
                              ),
                      );
                    },
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '¿Ya tienes una cuenta?',
                        style: TextStyle(fontSize: 14.sp, color: gray700),
                      ),
                      TextButton(
                        onPressed: widget.showLogin,
                        child: Text(
                          'Inicia sesión',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: primary,
                          ),
                        ),
                      ),
                    ],
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
