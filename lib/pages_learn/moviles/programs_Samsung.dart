// ignore_for_file: file_names
import 'package:flutter/material.dart';

class ProgramsSamsungPage extends StatelessWidget {
  const ProgramsSamsungPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galaxy Upcycling'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Galaxy Upcycling, el programa para reutilizar smartphones Galaxy y convertirlos en dispositivos domésticos inteligentes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '26-04-2021',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'La iniciativa promueve el reciclaje de productos electrónicos viejos como una solución creativa para el combate a los desechos electrónicos y brinda comodidad a los consumidores en la vida cotidiana.',
            ),
            SizedBox(height: 20.0),
            Text(
              'Samsung anunció la expansión de su programa Galaxy Upcycling con Galaxy Upcycling at Home, una iniciativa que ofrece vida nueva a los teléfonos inteligentes Galaxy más antiguos al convertirlos en una variedad de dispositivos IoT (Internet de las Cosas) a través de una simple actualización de software.',
            ),
            SizedBox(height: 20.0),
            Text(
              'Samsung implementó el servicio beta para Galaxy Upcycling at Home en Estados Unidos, Reino Unido y Corea del Sur. Con Galaxy Upcycling at Home, los usuarios pueden convertir fácilmente sus dispositivos usados[1] Galaxy en dispositivos domésticos inteligentes, como un monitor de cuidado infantil, una solución para el cuidado de mascotas y otras herramientas que satisfagan las necesidades individuales de sus estilos de vida.',
            ),
            SizedBox(height: 20.0),
            Text(
              'Convierta su casa en un hogar inteligente',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Galaxy Upcycling at Home proporciona recursos perfeccionados de control de luz y sonido al reutilizar los sensores incorporados. Los usuarios pueden transformar sus dispositivos antiguos a través de SmartThings Labs – una función dentro de la aplicación SmartThings.',
            ),
            SizedBox(height: 20.0),
            Text(
              'Con una solución perfeccionada de inteligencia artificial (IA), los dispositivos Galaxy pueden distinguir con mayor precisión los sonidos en el entorno cotidiano, lo que permite que los usuarios elijan por guardar determinadas grabaciones de sonido. Por ejemplo, si el dispositivo detecta sonidos como el llanto de un bebé, el ladrido de un perro, el maullido de un gato o un golpe, éste enviará una alerta directamente al teléfono inteligente del usuario, que podrá escuchar el sonido grabado.\nLos dispositivos también pueden utilizarse como sensor de luz para medición del nivel de brillo de la habitación. Los usuarios podrán configurar fácilmente el dispositivo para que encienda automáticamente las luces o el televisor a través de SmartThings si la habitación se vuelve más oscura que el estándar de luz preestablecido.',
            ),
            SizedBox(height: 20.0),
            Text(
              'Para que un dispositivo detecte continuamente el sonido y la luz, éste debe funcionar activamente durante largos períodos de tiempo. Por esta razón, Samsung ha equipado la actualización Galaxy Upcycle at Home con soluciones de optimización de la batería para minimizar su uso. Los dispositivos también podrán conectarse sin esfuerzo al SmartThings, lo que les permitirá interactuar con innumerables otros dispositivos de IoT en el ecosistema SmartThings.',
            ),
            SizedBox(height: 20.0),
            Text(
              'Un futuro sostenible con tecnología reutilizada',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '“Hemos creado Galaxy Upcycling at Home para habilitar a más personas a que reutilicen sus dispositivos antiguos, transformándolos en herramientas útiles, y permitiendo que tanto Samsung, como nuestros usuarios sean conscientes del impacto que tenemos en el medio ambiente. Estamos reconsiderando cómo usamos los recursos existentes y creemos que la clave del reciclaje es que habilitemos soluciones que transformen la tecnología antigua en algo nuevo agregando valor”, destacó Sung-Koo Kim, vicepresidente de la Oficina de Gestión de Sustentabilidad de los Negocios de Comunicaciones Móviles en Samsung Electronics.\n\nEsta innovadora solución es parte del compromiso continuo de Samsung en apoyo a la Agenda 2030 para el Desarrollo Sostenible, un plan global para que el mundo logre un futuro más sostenible y próspero para todos en 2030 a través de 17 Objetivos de Desarrollo Sostenible. Galaxy Upcycling at Home se enfoca específicamente en el Objetivo #12 – Consumo y Producción Responsables, al reducir los desechos y promover prácticas más sostenibles de producción y comportamientos de los consumidores.\n\nGalaxy Upcycling at Home ofrece una amplia gama de soluciones que ayuda a hacer la vida diaria un poco más fácil mientras promueve hábitos más sostenibles que benefician al planeta. Al ofrecer a los consumidores una forma de reciclar sus productos con nuevas funciones y propósitos alternativos, Samsung está ayudando a extender el ciclo de vida de sus productos mientras evita que sus usuarios contribuyan al e-waste (desecho electrónico) global.\n\nSamsung está incorporando la sustentabilidad medioambiental, que incluye la toma de medidas dedicadas en cada etapa del ciclo de vida del producto para ayudar a la transición mundial a una economía circular que haga un mayor uso de materiales sostenibles, extienda la longevidad del producto y reutilice los recursos. A través de programas como Galaxy Upcycling, Samsung tiene la intención de ofrecer tecnologías innovadoras que remodelen las experiencias de los consumidores al paso que los empodera a desempeñar un papel en las prácticas sostenibles.',
            ),
          ],
        ),
      ),
    );
  }
}
