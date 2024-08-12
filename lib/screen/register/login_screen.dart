// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api, use_build_context_synchronously, dead_code

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greencircuit/data/firebase_service/firebase_auth.dart';
import 'package:greencircuit/util/dialog.dart';

import '../../core/constants.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback showSignup;
  const LoginScreen(this.showSignup, {Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final emailFocus = FocusNode();
  final password = TextEditingController();
  final passwordFocus = FocusNode();
  bool _isPasswordHidden = true;

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 80.h),
                Text(
                  'Iniciar Sesión',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: secondary,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40.h),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: email,
                          focusNode: emailFocus,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese su correo electrónico';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.h),
                        TextFormField(
                          controller: password,
                          focusNode: passwordFocus,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese su contraseña';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                ElevatedButton(
                  onPressed: () async {
                    if (email.text.isEmpty || password.text.isEmpty) {
                      dialogBuilder(
                          context, 'Por favor complete todos los campos');
                    } else {
                      try {
                        await Authentication().login(
                          email: email.text,
                          password: password.text,
                        );
                      } on Exception catch (e) {
                        dialogBuilder(context, e.toString());
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: white,
                    backgroundColor: secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Text(
                      'Iniciar Sesión',
                      style: TextStyle(
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: widget.showSignup,
                  child: Text(
                    '¿No tienes una cuenta? Regístrate',
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
    );
  }
}
