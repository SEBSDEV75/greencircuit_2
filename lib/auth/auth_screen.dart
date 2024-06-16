import 'package:flutter/material.dart';
import 'package:greencircuit/register/login_screen.dart';
import 'package:greencircuit/register/signup.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool showLogin = true;

  void toggleScreens() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showLogin ? LoginScreen(toggleScreens) : SignupScreen(toggleScreens);
  }
}
