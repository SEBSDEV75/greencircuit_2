// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ProgramsPage extends StatelessWidget {
  const ProgramsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Programas de Reciclaje'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(
                'Reciclaje, una nueva vida para la basura electrónica'),
            _buildSectionText(
              'Huawei está comprometido con la reducción, el reciclaje y la reutilización de residuos. Los reciclamos, los desmantelamos y extraemos recursos para aprovechar al máximo la basura electrónica reciclada. Todo requiere un poco de esfuerzo.',
            ),
            _buildSectionTitle('Seguridad de los datos'),
            _buildSectionText(
              'Los socios de reciclaje de HUAWEI desmagnetizan por completo, borran y destruyen físicamente los medios de almacenamiento en los desechos electrónicos para evitar que se divulguen tus datos personales.',
            ),
            _buildSectionText(
              '* Pautas: Antes de poner tus desechos electrónicos en la papelera de reciclaje, haz una copia de seguridad y elimina tus datos personales. HUAWEI y sus socios de reciclaje no son responsables de la pérdida de archivos o datos.',
            ),
            _buildSectionTitle('Desensamble profesional'),
            _buildSectionText(
              'Los socios de reciclaje de HUAWEI han obtenido las certificaciones ISO9001 e ISO14001 y todas las licencias ambientales para el cumplir con las leyes y normativas nacionales.',
            ),
            _buildSectionTitle('Procesamiento ecológico'),
            _buildSectionText(
              'Los desechos electrónicos reciclados son procesados ecológicamente, de ellos se separan las materias primas, como el cobre, sal de cobalto, hierro, aluminio, arena de cobre, oro, paladio, níquel, plata, polvo de resina y plástico, que finalmente se reutilizan en la fabricación de nuevos productos electrónicos u otros productos.',
            ),
            _buildSectionTitle('Alcance del reciclaje'),
            _buildSectionText(
              'Teléfonos móviles en desuso, tabletas, computadoras portátiles, relojes / bandas inteligentes, tarjetas de datos, hosts STB, servidores, impresoras, cables, cargadores, modems, simcards, memorias ssd, mouse, webcams, teclados, accesorios de cualquier marca, etc.',
            ),
            _buildSectionTitle('Cómo participar'),
            _buildSectionText(
              '1. Confirma la existencia de residuos electrónicos\n\n'
              'Pregunta a las personas que conoces si necesitan usar sus dispositivos electrónicos antiguos. Si nadie quiere usarlos, pueden convertirse en desechos electrónicos reciclables.\n\n'
              '2. Haz una copia de seguridad y elimina los datos personales\n\n'
              'Recuerda hacer una copia de seguridad y eliminar tus datos personales en dispositivos como tu teléfono y tableta, retira la tarjeta SIM y la tarjeta de memoria y utilízala hasta el nivel mínimo de batería.\n\n'
              '3. Lleva los dispositivos a un lugar de entrega de desechos electrónicos\n\n'
              'Envía los desechos electrónicos al lugar de entrega de desechos electrónicos de HUAWEI más cercano o a cualquier lugar público de entrega de desechos electrónicos autorizado por el gobierno.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
    );
  }

  Widget _buildSectionText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16.0),
      ),
    );
  }
}
