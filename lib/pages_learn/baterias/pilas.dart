import 'package:flutter/material.dart';

class Programspilas extends StatelessWidget {
  const Programspilas({super.key});

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
            'Las pilas y baterías hoy en día son de gran utilidad en nuestra vida cotidiana, se utilizan en linternas, controles remotos, relojes, calculadoras, celulares y un sinfín de dispositivos, por ello, debemos tomar en cuenta que un mal manejo termina con residuos muy peligrosos, mismos que comúnmente quedan a la deriva una vez que termina su vida útil. Dentro de estos componentes, se encuentran metales y otras sustancias que provocan daños graves a la salud, no sólo humana, sino a la de casi todas las especies, plantas y animales, además de un daño considerable al ambiente.',
          ),
          SizedBox(height: 10.0),
          Text(
            'Los principales metales que contienen las pilas y baterías son: plomo que es un metal blando; cadmio, mercurio y níquel, estos denominados metales de transición; litio que es un metal alcalino y, también contienen otras sustancias tóxicas en forma de polímeros. Se calcula que en nuestro país se consumen anualmente un promedio de 10 pilas por persona. Por esta razón, es muy importante el trato que se les da después de utilizarlas; no es nada recomendable tirar las pilas y baterías en el bote de basura junto con los residuos domésticos. Te sorprenderá saber que una sola pila como las utilizadas en un reloj de pulsera, puede llegar a contaminar toda el agua de una alberca tamaño olímpico. Los daños que provocan a la salud van desde ceguera, cambios de personalidad, pérdida de memoria, daños en riñones y en pulmones, cáncer e incluso a altas exposiciones, la muerte.',
          ),
          SizedBox(height: 10.0),
          Text(
            'Sólo imagina que año con año, son toneladas de pilas y baterías que se desechan, la mayoría de ellas van a parar a vertederos, a rellenos sanitarios o a acuíferos, contaminando los mantos freáticos por filtración y en consecuencia las afluentes de agua requerida para infinidad de plantas y animales, también amenazando directamente a las comunidades humanas asentadas en el camino.',
          ),
          SizedBox(height: 10.0),
          Text(
            'Cuando conocemos el grado de toxicidad de las pilas y baterías, así como el daño que producen al ambiente y la salud si no se desechan adecuadamente, nos damos cuenta de que es urgente que la sociedad tome consciencia de las acciones con las cuales puede colaborar para evitar la degradación de nuestro entorno. Es claro que es casi imposible vivir aislados de la tecnología, pero un manejo adecuado nos permitirá convivir con la naturaleza y gozar de los beneficios tecnológicos simultáneamente.',
          ),
          SizedBox(height: 10.0),
          Text(
            '¿Cuál es la diferencia entre una pila y una batería?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Una pila es un generador portátil de energía eléctrica, la cual se obtiene a partir de la transformación de energía química. Una pila no pierde la carga eléctrica salvo por la degradación física de sus componentes y este proceso es irreversible.',
          ),
          SizedBox(height: 10.0),
          Text(
            'Una batería, almacena carga eléctrica previamente producida por un generador, y va perdiendo su carga eléctrica constantemente en el tiempo, se utilice o no. Una batería se puede volver a cargar cuantas veces sea necesario, hasta que su estructura se degrade por el uso.',
          ),
          SizedBox(height: 10.0),
          Text(
            '¿Entonces cuales son contaminantes, las pilas o las baterías?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Las dos son contaminantes una vez que termina su vida útil, sobre todo si se desechan al ambiente. La diferencia es que las baterías se pueden reciclar para fabricar nuevas baterías, mientras que las pilas se deben destruir con un proceso especial que evite la contaminación.',
          ),
          SizedBox(height: 10.0),
          Text(
            'Existen dos procesos principales para desechar las pilas y baterías correctamente: técnicas hidrometalúrgica y pirometalúrgicas.',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Ambos son procesos muy laboriosos y requieren de todo un sistema, de equipo y de metódicas actividades, así como un amplio conocimiento en el manejo de sustancias y sus efectos.',
          ),
          SizedBox(height: 10.0),
          Text(
            'La técnica hidrometalúrgica, consiste en triturar; separar componentes, entre ellos los metales, para que den la fracción de polvos finos mediante tratamiento ácido y posteriormente se neutralizan para separar las sales metálicas; purificar separando sustancias acompañantes e impurezas por extracción sólido-líquido, precipitando los componentes en forma de hidróxidos. Por último, la separación electrolítica del metal con ánodos insolubles (Zn, Cu) y solubles (Cu, Pb). Entre estos procesos aparecerán sustancias peligrosas para el ambiente: Agua residual con metales pesados tóxicos; gases de escape (niebla ácida y ácido sulfúrico) y xerosina; fango lleno de plata y plomo; así como compuestos metálicos disueltos en hierro, níquel, arsénico y cobalto. Todas estas son sustancias altamente dañinas para los seres vivos.',
          ),
          SizedBox(height: 10.0),
          Text(
            'En el caso de la técnica pirometalúrgica, consiste en el tratamiento de estos componentes por medio de temperatura, la cual como la anterior, implica procesos exactos que consisten en la calcinación; rotación del horno; fusión; soplado; refinación pirometalúrgica y empobrecimiento de escorias. En estas etapas habrá gases de escape de origen diverso: plomo, cinc, cadmio, mercurio y sus derivados después del enfriamiento. También agua residual, escorias finales con metales, sulfatos y sulfuros. Esta técnica implica costos muy altos, por lo que no cualquier empresa los puede realizar.',
          ),
          SizedBox(height: 10.0),
          Text(
            'Tercera opción: La realidad es que cuando la tecnología para realizar estos reciclados como en los dos procesos anteriores no está disponible, se utilizan procesos físico-químicos para disminuir el impacto y movilidad de los metales pesados. En estas técnicas se incluyen la estabilización por agregado de agentes químicos que son solubles con los metales, el confinamiento en envases herméticos y encapsulamiento con cemento, posteriormente la vitrificación a altas temperaturas.',
          ),
          SizedBox(height: 10.0),
          Text(
            'Gran parte de los componentes de estas se pueden reciclar para hacer más pilas y baterías. Si hacemos una comparación sobre la eficacia de la recuperación de diversos desechos, el de las baterías y pilas es el más complejo, pero el más eficaz (Figura 1).',
          ),
          SizedBox(height: 10.0),
          Text(
            '¿Cómo podemos contribuir nosotros los usuarios de pilas y baterías para disminuir su impacto y qué hacer cuando estas ya no sirven? Por un lado, tratar de disminuir el uso de ellas, de preferencia optando por utilizar en lo posible aparatos mecánicos o eléctricos, es decir, optar por la versión de los que se conectan por cable a la corriente de casa u oficina. Un ejemplo sería utilizar un molino de manivela en vez de uno de baterías; o bien una rasuradora eléctrica con cable a la corriente, en vez de una de baterías, aunque sean recargables; lo mismo un taladro de cable en vez de uno inalámbrico que tarde o temprano sus baterías dejarán de funcionar.',
          ),
          SizedBox(height: 10.0),
          Text(
            'Claro, cuando ello no es posible (en el caso de que se tengan que utilizar pilas o baterías), cuando se desechen, lo hagamos en los sitios especificados para su recolección. ¡Jamás se deben tirar en la basura!',
          ),
          SizedBox(height: 10.0),
          Text(
            'Ten un bote en casa que te sirva como repositorio de pilas y baterías usadas. Cuando éste se llene, espera la convocatoria de acopio para el reciclaje de desechos electrónicos, el cual se realiza en tu ciudad aproximadamente cada tres meses. Apunta la fecha en que se llevará a cabo y lleva tu envase para entregarlo en el lugar indicado. También existen centros de acopio que reciben cotidianamente estos desechos para procesarlos de la forma más adecuada.',
          ),
        ]),
      ),
    );
  }
}
