// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ProgramsWindowsPage extends StatelessWidget {
  const ProgramsWindowsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido a GreenCircuit'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Estas son las mejores formas de reciclar un PC o sus componentes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Breixo Gómez 29 agosto, 2021 7 minutos de lectura aproximada.',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'El reciclaje de un PC es un proceso que afortunadamente se ha vuelto muy sencillo, y a la vez se está volviendo mucho más necesario que antes. Los ordenadores ya llevan varias décadas entre nosotros, así que lo más probable es que tengas uno o varios ordenadores viejos por casa que necesites reciclar, ya que obviamente el espacio en un hogar o en un trastero no es infinito, y los ordenadores pueden ser bastante aparatosos.',
            ),
            SizedBox(height: 20.0),
            Text(
              'En este artículo, repasaremos a fondo cuáles son las mejores maneras de reciclar un PC, ya sea completo o algunos de sus componentes, o cualquier otro tipo de residuos electrónicos. Esperamos que sea una guía muy útil, ya que reciclar es imprescindible para el planeta. ¡Vamos allá!',
            ),
            SizedBox(height: 20.0),
            Text(
              'Antes de nada, ¡al contenedor o a la vía pública NO!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Tenemos que comenzar este artículo de una forma que para casi todos será más que obvia: avisando de que un ordenador nunca debe tirarse a ningún contenedor.',
            ),
            SizedBox(height: 10.0),
            Text(
              'Reciclaje PC Todos sabemos que hay distintos tipos de contenedores, entre ellos el amarillo (plásticos y envases) y el gris (desechos en general), y alguien puede llegar a pensar que algún aparato electrónico puede tirarse ahí. La realidad es que no, se trata de una irresponsabilidad muy grave que acarrea riesgos ambientales importantes.',
            ),
            SizedBox(height: 10.0),
            Text(
              'Por tanto, olvídate completamente de los contenedores: el único contenedor urbano donde se podría llegar a tirar algo electrónico es el contenedor de pilas, que se puede encontrar como «complemento» de algún otro contenedor, y donde te recomendamos que dejes todas las pilas agotadas que tengas por casa.',
            ),
            SizedBox(height: 10.0),
            Text(
              'Otro lugar donde no deberías intentar «reciclar» tu ordenador es en la vía pública. Es más común de lo que parece dejar tirado un PC en la calle esperando que alguien lo recoja. No solo no tiene por qué ser así, sino que puedes estar incurriendo en una ilegalidad. Así que, dicho esto, vamos a ver cuáles son los métodos a los que sí debes recurrir para el reciclaje de un PC.',
            ),
            SizedBox(height: 20.0),
            Text(
              'Tu ordenador y componentes son RAEE: sitios donde hacer el reciclaje de un PC',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Basura electronica o RAEE Ahora que vamos a ver lo que sí merece la pena para reciclar un PC, debes saber ante qué tipo de residuos estás tratando. Un ordenador, como cualquier otro aparato electrónico doméstico, es un AEE, o Aparato Eléctrico y Electrónico.',
            ),
            SizedBox(height: 10.0),
            Text(
              'Por tanto, en cuanto se convierte en un residuo a reciclar, debido a que ha finalizado su vida útil, entonces hablamos de RAEE, que son las siglas de Residuos de Aparatos Eléctricos y Electrónicos. También podemos encontrar otras denominaciones más modernas como «e-waste» o «basura electrónica», pero hablaremos de RAEE a lo largo del artículo.',
            ),
            SizedBox(height: 10.0),
            Text(
              'Pues bien, hay un montón de posibilidades para reciclar un RAEE, y vamos a presentártelas.',
            ),
            SizedBox(height: 20.0),
            Text(
              'Puntos limpios municipales',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Punto limpio La verdadera clave para el reciclaje de PC o de piezas es, sin duda, acudir al punto limpio más cercano a tu localidad. Los puntos limpios son recintos situados cerca de los núcleos de población pensados para depositar voluntariamente residuos tales como:',
            ),
            SizedBox(height: 10.0),
            Text(
              '- Electrodomésticos y RAEE',
            ),
            Text(
              '- Muebles y enseres',
            ),
            Text(
              '- Pilas y baterías',
            ),
            Text(
              '- Lámparas fluorescentes, LED y de bajo consumo',
            ),
            Text(
              '- Aerosoles',
            ),
            Text(
              '- Radiografías',
            ),
            Text(
              '- Pinturas, disolventes…',
            ),
            Text(
              '- Tóner y cartuchos de tinta',
            ),
            Text(
              '- … Y muchos más residuos, incluyendo los de los contenedores normales (vidrio, papel, cartón, envases…)',
            ),
            SizedBox(height: 10.0),
            Text(
              'Ojo, porque además de residuos admisibles también hay otros que no se admiten en un punto limpio. Hablamos de:',
            ),
            SizedBox(height: 10.0),
            Text(
              '- Materias sin clasificar.',
            ),
            Text(
              '- Restos clínicos.',
            ),
            Text(
              '- Residuos radiactivos.',
            ),
            Text(
              '- Materia orgánica.',
            ),
            Text(
              '- Neumáticos.',
            ),
            Text(
              '- Animales muertos.',
            ),
            Text(
              '- Recipientes voluminosos.',
            ),
            Text(
              '- Residuos procedentes de empresas.',
            ),
            SizedBox(height: 10.0),
            Text(
              'Desde luego, se trata del lugar ideal para reciclar un ordenador viejo que se ha convertido en un residuo. Que conste que la lista que dejamos arriba depende de cada punto limpio, aunque debería servir de referencia.',
            ),
            SizedBox(height: 10.0),
            Text(
              '¿Y a qué punto limpio tengo que dirigirme? En España, prácticamente cualquier municipio cuenta con un punto limpio, y puedes buscar el más cercano aprovechando herramientas como la de la OCU.',
            ),
            SizedBox(height: 10.0),
            Text(
              'Conste que también hay puntos limpios móviles, que se sitúan en sitios concretos temporalmente, además de puntos limpios «mini», que están mucho más cerca de la población. Pueden servir para tirar componentes de PC, pero normalmente no para un ordenador completo.',
            ),
            SizedBox(height: 10.0),
            Text(
              'Entonces, la gran desventaja de los puntos limpios está en el necesario desplazamiento para tirar los residuos. Si tenemos acumulados muchos RAEE entonces tiene todo el sentido del mundo, pero si solo vamos a tirar una pieza o un equipo puede ser algo tedioso. Pero no te preocupes, porque hay más alternativas.',
            ),
            SizedBox(height: 20.0),
            Text(
              'Tiendas colaboradoras con Ecolec',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Ecolec es una fundación española sin ánimo de lucro destinada a la recogida y tratamiento de RAEE, generalmente pensando en la economía circular, es decir, la reutilización de los residuos para intentar aprovechar todos los materiales que contienen.',
            ),
            SizedBox(height: 10.0),
            Text(
              'Pues bien, Ecolec cuenta con muchísimos establecimientos colaboradores, tanto tiendas físicas como online, que ofrecen la recogida de este tipo de residuos. La cuestión es que lo que hacen es que, cuando compramos un nuevo aparato, se llevan el anterior para reciclarlo.',
            ),
            SizedBox(height: 10.0),
            Text(
              'Realmente, esto solo es interesante cuando estemos hablando de electrodomésticos, más que el reciclaje de un PC o sus componentes. La excepción podría ser que comprásemos un equipo nuevo y el anterior fuese un residuo.',
            ),
            SizedBox(height: 10.0),
            Text(
              'Podemos consultar dónde están todos estos establecimientos, que se reparten por toda España, en la web oficial de Ecolec.',
            ),
            SizedBox(height: 20.0),
            Text(
              'Recogida de RAEE a domicilio',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Reciclaje PC antiguo La última modalidad de reciclaje de PC que te vamos a presentar es una de las más interesantes, y estamos hablando de la recogida a domicilio de RAEE. Dependiendo de dónde vivas, es posible que haya la posibilidad de solicitar que acudan a tu casa a recoger este tipo de residuos, siendo entonces la forma más cómoda de hacerlo.',
            ),
            SizedBox(height: 10.0),
            Text(
              'Indicamos que depende de dónde vivas, ya que normalmente estos servicios dependen del ayuntamiento, en España son muchos los que lo ofrecen y suele consistir en que una empresa especializada o personal del ayuntamiento pase una vez al mes por todos los domicilios que le hayan solicitado la recogida de estos residuos.',
            ),
            SizedBox(height: 10.0),
            Text(
              'Infórmate en la web de tu Ayuntamiento, en redes sociales, o contacta directamente con ellos.',
            ),
            SizedBox(height: 10.0),
            Text(
              'Entonces, el procedimiento suele consistir en llamar al ayuntamiento y solicitar la recogida de RAEE, donde quedarás anotado para ello, y te informarán del día en el que pasarán a hacer todas las recogidas.',
            ),
            SizedBox(height: 10.0),
            Text(
              'Por ejemplo, personalmente vivo «algo lejos» de un punto limpio, lo que hace menos atractivo el reciclaje de algún ordenador viejo que tenga por casa. Pero gracias a este tipo de servicio no tengo ningún inconveniente en reciclarlos.',
            ),
            SizedBox(height: 20.0),
            Text(
              'Otra forma de reciclaje de PC es vender o donar tus componentes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Naturalmente, una idea muy interesante es la de no convertir el PC o los componentes en residuos, sino que podemos optar por venderlos o donar ordenadores.',
            ),
            SizedBox(height: 10.0),
            Text(
              'Si tienes un PC funcional, a lo mejor reciclarlo no es necesario, pues alguien podría estar interesado en llevárselo. Anunciándolo en las principales plataformas de segunda mano, como Wallapop, eBay o Milanuncios, podrías encontrar un comprador interesado.',
            ),
            SizedBox(height: 10.0),
            Text(
              'Lo mismo ocurre con los componentes concretos, sobre todo si se trata de piezas muy duraderas como los módulos de memoria RAM, que casi nunca se estropean, y aunque un stick de memoria DDR2 te parezca totalmente inútil es posible que puedas vendérselo a alguien que busque expandir un PC viejo. ¡Inténtalo!',
            ),
            SizedBox(height: 20.0),
            Text(
              'El mejor residuo es el que no se genera',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Naturalmente, lo mejor que podemos hacer no es reciclar, sino encontrar la manera de reutilizar el PC o los componentes antiguos. Si podemos encontrarle alguna aplicación razonable (incluyendo la venta o donación que acabamos de describir) entonces es preferible a hacer que el equipo se convierta un residuo.',
            ),
            SizedBox(height: 10.0),
            Text(
              'En todo caso, no cabe duda de que la solución de reciclar es perfectamente razonable cuando por cualquier motivo, ya sea por falta de tiempo para buscar una alternativa, porque el aparato está estropeado o simplemente porque no consideramos que pueda cubrir ninguna necesidad correctamente. Por eso os hemos dado todas las claves necesarias para el reciclaje de PC en este artículo.',
            ),
            SizedBox(height: 10.0),
            Text(
              'Aquí volvemos a insistir en la importancia de no recurrir a tirar electrónica en contenedores ni dejarlos tirados en la vía pública. Son grandes irresponsabilidades que, además de innecesarias y dañinas, pueden ser ilegales.',
            ),
            SizedBox(height: 20.0),
            Text(
              'Palabras finales y conclusión sobre el reciclaje de PC y RAEE',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'RAEE residuos de aparatos eléctricos y electrónicos Cada vez es más común tener un montón de residuos electrónicos acumulados en casa, teniendo en cuenta que ya llevamos más de dos décadas con los ordenadores introducidos al ámbito doméstico. Por tanto, a muchísima gente le interesa conocer la forma correcta de hacer reciclaje de un PC o de componentes de ordenador sueltos.',
            ),
            SizedBox(height: 10.0),
            Text(
              'En este artículo, hemos comenzado incidiendo en lo importante que es no tirar nunca al contenedor de basura ni a la vía pública este tipo de residuos. Para su correcto reciclaje es imprescindible optar por otros métodos.',
            ),
            SizedBox(height: 10.0),
            Text(
              'Te recomendamos la lectura de otros artículos de nuestra web:',
            ),
            SizedBox(height: 5.0),
            Text(
              '- Como reutilizar tus viejos discos duros con un dock',
            ),
            Text(
              '- ¿Por qué ya apenas hay chasis con bahías de 5,25 y 3,5″?',
            ),
            Text(
              '- Mi portátil hace mucho ruido, así puede ser más silencioso y con mejores temperaturas',
            ),
            Text(
              '- ¿La GPU más potente para gaming? Modelos para cada presupuesto',
            ),
            Text(
              '- Cuántos GB o TB necesito de SSD para juegos en un PC Gaming',
            ),
            SizedBox(height: 10.0),
            Text(
              'En concreto, estos son los métodos de reciclaje de PC que recomendamos:',
            ),
            SizedBox(height: 5.0),
            Text(
              '- Acudir al punto limpio municipal, ya sea fijo o móvil, aunque en un punto limpio móvil o reducido podría no caber un ordenador entero.',
            ),
            Text(
              '- Aprovechar la posibilidad de que se lleven nuestros residuos antiguos al hacer una compra en un establecimiento colaborador de Ecolec. Aunque esto está más destinado a la retirada de un electrodoméstico viejo al comprar uno que lo reemplace.',
            ),
            Text(
              '- Contactar con nuestro Ayuntamiento para solicitar una recogida a domicilio de RAEE (Residuos de Aparatos Electrónicos y Eléctricos). En muchos ayuntamientos de España se ofrece este servicio, por el que alguien pasa a recoger los residuos una vez al mes, después de que los ciudadanos lo soliciten.',
            ),
            Text(
              '- Evitar que el ordenador se convierta en un residuo, ya sea reutilizándolo, donándolo o vendiéndolo, siempre y cuando sea funcional o útil de alguna forma.',
            ),
          ],
        ),
      ),
    );
  }
}
