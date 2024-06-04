import 'package:flutter/material.dart';

class Programsque extends StatelessWidget {
  const Programsque({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido a GreenCircuit'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Es muy importante saber cómo reciclar pilas y baterías usadas, ya que son elementos muy contaminantes que a menudo no se reciclan de forma correcta. Si nos paramos a pensar la de cosas que llevan batería podríamos hacernos una idea de la cantidad de ellas que gastamos y generalmente tiramos en nuestra vida cotidiana.',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            '¿Qué son y cómo reciclar pilas?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Tanto el nombre de Pila como el de Batería proviene de la manera original de fabricación de este invento, en el cual ponían celdillas eléctricas “apiladas” o “en batería”.',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Las baterías, pilas, acumuladores eléctricos o simplemente acumuladores, son el dispositivo que almacenan energía eléctrica usando procedimientos electroquímicos y que posteriormente devuelven casi en su totalidad. Generalmente entendemos que las pilas son una fuente de energía finita, ya que se agota y no es recargable. Por el contrario, las baterías si solemos recargarlas.',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Estas pilas o baterías contienen metales pesados y compuestos químicos, muchos de ellos perjudiciales para el medio ambiente. Es muy importante no tirarlas a la basura (en la mayoría de los países eso no está permitido), y llevarlas a un centro de reciclado. Actualmente, la mayoría de los proveedores y tiendas especializadas también se hacen cargo de las baterías gastadas. Algunas de las sustancias nocivas para el medio ambiente dependen del tipo de pila utilizada. Estas son algunas de ellas:',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Pilas secas',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          Text(
            'También llamadas “salinas” o de “zinc-carbón”, contienen muy poco mercurio (0,01%). Grado de toxicidad: Muy bajo.',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Pilas alcalinas',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          Text(
            'Tienen un contenido en mercurio del 0,5%. Grado de toxicidad: Tóxicas.',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Pilas recargables',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          Text(
            'Contienen cadmio. No contienen mercurio. Grado de toxicidad: Tóxicas.',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Pilas de botón',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          Text(
            'Algunas contienen hasta un 30% de mercurio. Grado de toxicidad: Muy alto.',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Pilas “verdes”',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          Text(
            'Carecen de cadmio y mercurio, aunque se desconocen parte de sus componentes. Grado de toxicidad: Desconocido.',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Cómo reciclar pilas',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'El proceso de destrucción de estas suele ser el mismo. Una vez utilizadas, las pilas se convierten en un residuo tóxico. En nuestro país, siguen los cauces habituales de la basura común. Es decir: basurero, relleno sanitario o incineración. Cualquiera que sea el camino, causa enormes problemas ambientales. A modo de ejemplo, una sola pila botón puede contaminar más de 600.000 litros de agua. El mercurio y el cadmio, junto a otros metales, no se destruyen con la incineración: se emiten a la atmósfera.',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            '¿Qué hacer con las pilas usadas?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Es sencillo colaborar. Lo fundamental es conocer cómo es el proceso para reciclar pilas y baterías:',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'El proceso de reciclaje empieza por deshacernos de las pilas usadas usando los contenedores de recogida selectiva que existen. Si realizamos una recogida selectiva, las pilas usadas se llevan a una planta de reciclaje, donde el mercurio se separa de otros metales y el resto de materiales que constituyen las pilas usadas pueden ser recuperados.',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Recuerda, cada pila debe ir a su sitio y el cuidado del medio ambiente comienza en el hogar. De no ser así… la naturaleza se resentirá.',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16.0,
            ),
          ),
        ]),
      ),
    );
  }
}
