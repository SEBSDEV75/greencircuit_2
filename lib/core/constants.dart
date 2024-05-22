// App-wide colors
import 'package:flutter/material.dart';

//Theme.of(context).primaryColor
//color: const Color.fromARGB(255, 160, 119, 179)
const Color primary = Color.fromARGB(255, 233, 238, 233);
const Color secondary = Color.fromARGB(255, 32, 34, 32);
const Color gray900 = Color.fromARGB(255, 33, 33, 33);
const Color gray700 = Color.fromARGB(255, 64, 68, 60);
const Color gray500 = Color.fromARGB(255, 47, 39, 56);
const Color icons = Color.fromARGB(255, 160, 140, 196);
const Color icons2 = Color.fromARGB(255, 167, 117, 177);

const Color backgroundlight = Color.fromARGB(255, 217, 214, 223);
const Color backgrounddark = Color.fromARGB(255, 217, 214, 223);

const Color black = Colors.black;
const Color white = Colors.white;

const Map<String, String> authExceptionMapper = {
  'El correo ya existe.':
      'Este correo electrónico ya está ocupado. Inténtalo con un nuevo correo electrónico o inicia sesión con el correo electrónico proporcionado!',
  'invalid-email':
      'La dirección de correo electrónico proporcionada no es válida!',
  'weak-password':
      'Tu contraseña es demasiado débil. Inténtalo con una contraseña segura!',
  'user-disabled':
      'La cuenta con esta dirección de correo electrónico está deshabilitada!',
  'user-not-found':
      'No hay ninguna cuenta con esta dirección de correo electrónico!',
  'wrong-password': 'La contraseña proporcionada no es correcta!',
  'INVALID_LOGIN_CREDENTIALS':
      'El correo electrónico o la contraseña proporcionados no son correctos!',
  'too-many-requests': 'Demasiadas solicitudes. Vuelva a intentarlo más tarde!',
  'network-request-failed':
      'No se ha podido avanzar. Compruebe su conexión a Internet!',
  'user-mismatch': 'Las credenciales proporcionadas no coinciden!',
  'invalid-credential': 'Las credenciales de tu proveedor no son válidas!',
};
