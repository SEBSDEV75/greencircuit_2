class Validator {
  Validator._(); // Constructor privado para evitar instancias de esta clase

  // Validador para el nombre
  static String? nameValidator(String? name) {
    name =
        name?.trim() ?? ''; // Elimina espacios en blanco alrededor del nombre

    // Devuelve un mensaje de error si el nombre está vacío, de lo contrario, devuelve null
    return name.isEmpty ? 'Nombre no proporcionado!' : null;
  }

  // Patrón de expresión regular para validar correos electrónicos
  static const String _emailPattern =
      r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';

  // Validador para el correo electrónico
  static String? emailValidator(String? email) {
    email = email?.trim() ??
        ''; // Elimina espacios en blanco alrededor del correo electrónico

    // Devuelve un mensaje de error si el correo electrónico está vacío o no cumple con el formato, de lo contrario, devuelve null
    return email.isEmpty
        ? 'Correo no proporcionado!'
        : !RegExp(_emailPattern).hasMatch(email)
            ? 'El correo proporcionado no es válido!'
            : null;
  }

  // Validador para la contraseña
  static String? passwordValidator(String? password) {
    password =
        password ?? ''; // Si la contraseña es null, asigna una cadena vacía

    String errorMessage = ''; // Mensaje de error inicial vacío

    // Verifica si la contraseña cumple con los requisitos y agrega mensajes de error según sea necesario
    if (password.isEmpty) {
      errorMessage = 'Contraseña no proporcionada!';
    } else {
      if (password.length < 6) {
        errorMessage = 'La contraseña debe tener al menos 6 caracteres!';
      }

      if (!password.contains(RegExp(r'[a-z]'))) {
        errorMessage =
            '$errorMessage\nLa contraseña debe tener al menos una letra minuscula';
      }

      if (!password.contains(RegExp(r'[A-Z]'))) {
        errorMessage =
            '$errorMessage\nLa contraseña debe tener al menos una letra mayúscula';
      }

      if (!password.contains(RegExp(r'[0-9]'))) {
        errorMessage =
            '$errorMessage\nLa contraseña debe tener al menos un número';
      }
    }

    // Devuelve el mensaje de error si existe, de lo contrario, devuelve null
    return errorMessage.isNotEmpty ? errorMessage.trim() : null;
  }
}
