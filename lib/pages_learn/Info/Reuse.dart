// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ResuePage extends StatelessWidget {
  const ResuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beneficios del Reciclaje Electrónico'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(
                'Descubre todos los beneficios del reciclaje electrónico'),
            _buildSectionText(
              '¿Sabías que en Latinoamérica se produce el 9% de la basura electrónica mundial? Por eso el reciclaje electrónico es clave para la sostenibilidad en nuestra región. Este proceso permite recuperar materiales y reinsertarlos al sistema productivo. También logra reducir el impacto ambiental de desechar residuos contaminantes y tóxicos (Dinero, 2018).',
            ),
            _buildSectionText(
              'Antes de desechar tus aparatos electrónicos conviene que revises las siguientes acciones: intentar repararlos, reutilizarlos o donarlos a organizaciones sociales. Y si nada de eso es posible, también podrías reciclarlos, completa o parcialmente (Arias, 2018).',
            ),
            _buildSectionTitle('¿En qué consiste el reciclaje electrónico?'),
            _buildSectionText(
              'Es un proceso que se lleva a cabo en dispositivos electrónicos. Implica el desmontaje y separación de sus componentes y la recuperación de sus materias primas: plásticos, metales, entre otros (SGS, s.f.; Dinero, 2018).',
            ),
            // Agregar más secciones aquí si es necesario
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
