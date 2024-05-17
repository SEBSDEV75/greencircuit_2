// App-wide colors
import 'package:flutter/material.dart';

const Color primary =
    Color.fromARGB(255, 178, 189, 165); // Verde suave para modo claro
const Color secondary =
    Color.fromARGB(255, 77, 119, 103); // Verde oscuro para modo oscuro
const Color gray900 =
    Color.fromARGB(255, 33, 33, 33); // Gris oscuro para botones
const Color icons =
    Color.fromARGB(255, 160, 140, 196); // Púrpura suave para íconos
const Color icons2 =
    Color.fromARGB(255, 167, 117, 177); // Otro tono de púrpura para íconos

const Color backgroundlight =
    Color.fromARGB(255, 217, 214, 223); // Color de fondo
const Color backgrounddark =
    Color.fromARGB(255, 217, 214, 223); // Color de fondo

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
