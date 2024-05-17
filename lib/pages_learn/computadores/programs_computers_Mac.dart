// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ProgramsMacPage extends StatelessWidget {
  const ProgramsMacPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reciclar MacBook Pro de forma segura'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reciclar MacBook Pro de forma segura',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Si tienes una MacBook Pro vieja y estás buscando la mejor manera de deshacerte de ella de manera responsable, tienes varias opciones disponibles. En este artículo, te daremos información sobre cómo reciclar tu MacBook Pro de forma adecuada y segura.',
            ),
            SizedBox(height: 20.0),
            Text(
              'Temas de los que Hablaremos',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '- ¿Qué puedo hacer con una MacBook vieja?',
            ),
            Text(
              '- ¿Cómo borrar todo de mi Mac para venderla?',
            ),
            SizedBox(height: 20.0),
            Text(
              '¿Qué puedo hacer con una MacBook vieja?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'En estos casos, hay dos caminos posibles sobre los que actuar: acudir a una Apple Store para que realice el proceso de reciclaje, pero también acudir a un punto limpio. En todos estos puntos se consigue separar todos los componentes de un MacBook.',
            ),
            SizedBox(height: 10.0),
            Text(
              'Reciclar tu MacBook Pro en una Apple Store:',
            ),
            Text(
              '- Visita una Apple Store cercana.',
            ),
            Text(
              '- Explícales que deseas reciclar tu MacBook Pro.',
            ),
            Text(
              '- El personal de la tienda te indicará los pasos a seguir.',
            ),
            Text(
              '- Ellos se encargarán de separar y reciclar correctamente todos los componentes de tu MacBook Pro.',
            ),
            SizedBox(height: 10.0),
            Text(
              'Reciclar tu MacBook Pro en un punto limpio:',
            ),
            Text(
              '- Busca un punto limpio o centro de reciclaje cercano.',
            ),
            Text(
              '- Lleva tu MacBook Pro y explícales que deseas reciclarlo.',
            ),
            Text(
              '- El personal del punto limpio te indicará cómo proceder.',
            ),
            Text(
              '- Asegúrate de que el punto limpio cumpla con las regulaciones ambientales para el reciclaje de dispositivos electrónicos.',
            ),
            SizedBox(height: 20.0),
            Text(
              '¿Cómo borrar todo de mi Mac para venderla?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Si estás pensando en vender tu MacBook Pro, es importante que borres toda la información personal y restablezcas la configuración de fábrica. A continuación, te mostramos cómo hacerlo:',
            ),
            SizedBox(height: 10.0),
            Text(
              'Borrar todo el contenido de tu Mac en macOS Ventura o versiones posteriores:',
            ),
            Text(
              '- Abre el menú Apple  en la esquina de la pantalla y selecciona preferencias del sistema .',
            ),
            Text(
              '- Haz clic en general en la barra lateral.',
            ),
            Text(
              '- Haz clic en restablecer en la parte derecha de la ventana.',
            ),
            Text(
              '- Selecciona borrar todo el contenido y configuración .',
            ),
            SizedBox(height: 10.0),
            Text(
              'Borrar todo el contenido de tu Mac en versiones anteriores a macOS Ventura:',
            ),
            Text(
              '- Selecciona el menú Apple  y haz clic en preferencias del sistema .',
            ),
            Text(
              '- Haz clic en general en la barra lateral (es posible que tengas que desplazarte hacia abajo).',
            ),
            Text(
              '- Haz clic en restaurar en la parte derecha de la ventana y elige borrar contenido y configuración .',
            ),
            SizedBox(height: 10.0),
            Text(
              'Recuerda que al borrar todo el contenido de tu Mac, se eliminarán todos tus archivos y configuraciones. Asegúrate de hacer una copia de seguridad de tus datos importantes antes de realizar este proceso.',
            ),
          ],
        ),
      ),
    );
  }
}
