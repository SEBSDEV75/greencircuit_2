import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

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
              '¿Qué hacer con los residuos electrónicos?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Seguramente es lo primero que se te viene a la cabeza cuando un electrodoméstico se avería en casa. No importa si es una lavadora, un televisor o un teléfono móvil, todos los electrodomésticos viejos pueden ser eliminados de forma ecológica y entregados en su centro de reciclaje de forma gratuita.',
            ),
            SizedBox(height: 10.0),
            Text(
              'Los minoristas también recuperan los aparatos viejos sin costo alguno. Porque reciclar las materias primas contenidas en los aparatos protege el medio ambiente y el clima. El «Día Internacional de los Desechos Electrónicos», el 14 de octubre, llama la atención sobre la correcta eliminación de los aparatos eléctricos.',
            ),
            SizedBox(height: 10.0),
            Text(
              '¿Qué son los residuos electrónicos?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Los residuos electrónicos (RAEE) son aquellos aparatos eléctricos y electrónicos que han dejado de ser utilizados y que, por lo tanto, se convierten en residuos. Los RAEE pueden contener sustancias peligrosas, como metales pesados, que pueden contaminar el medio ambiente si no se gestionan adecuadamente.',
            ),
            SizedBox(height: 10.0),
            Text(
              'Los RAEE incluyen una amplia gama de productos, como:',
            ),
            Text(
              '- Aparatos domésticos: televisores, lavadoras, secadoras, frigoríficos, congeladores, etc.',
            ),
            Text(
              '- Electrodomésticos: teléfonos móviles, ordenadores, tabletas, etc.',
            ),
            SizedBox(height: 10.0),
            Text(
              '¿Por qué no se pueden desechar los electrodomésticos viejos en la basura doméstica?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Los aparatos eléctricos contienen materias primas valiosas y a veces raras, como cobre, aluminio, oro o neodimio. Si estas materias primas se reciclan y se recuperan, se protegen los recursos naturales y el clima, además los aparatos eléctricos a veces contienen sustancias peligrosas para la salud o el medio ambiente, como el mercurio en las lámparas de bajo consumo o los refrigerantes que contienen CFC, los cuales son perjudiciales para el clima. Estas sustancias no deben liberarse en el medio ambiente de manera incontrolada y, por lo tanto, se eliminan adecuadamente mediante el reciclaje.',
            ),
          ],
        ),
      ),
    );
  }
}
