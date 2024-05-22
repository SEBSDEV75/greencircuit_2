import 'package:flutter/material.dart';

import '../../core/constants.dart';
import 'programs_Samsung.dart';
import 'programs_Xiaomi.dart';
import 'programs_iPhone.dart';

class MovilesPage extends StatelessWidget {
  const MovilesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = MediaQuery.of(context).size.width * 0.9;

    return GestureDetector(
      // Habilitar el desplazamiento vertical
      behavior: HitTestBehavior.translucent,
      onVerticalDragUpdate: (details) {},
      child: Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              Text('GreenCircuit'),
              Spacer(),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton(
                  context,
                  'Reciclaje para telefonos Samsung',
                  Icons.phone_android,
                  () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return const ProgramsSamsungPage();
                      },
                    );
                  },
                  buttonWidth,
                ),
                _buildButton(
                  context,
                  'Reciclaje para telefonos Xiaomi',
                  Icons.phone_android_rounded,
                  () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return const ProgramsXiaomiPage();
                      },
                    );
                  },
                  buttonWidth,
                ),
                _buildButton(
                  context,
                  'Reciclaje para telefonos iPhone',
                  Icons.phone_iphone,
                  () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return const ProgramsiPhonePage();
                      },
                    );
                  },
                  buttonWidth,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Método para construir los botones
  Widget _buildButton(BuildContext context, String title, IconData icon,
      VoidCallback onPressed, double width) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 9.0),
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(17.0),
          backgroundColor: gray500,
          elevation: 7.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(45.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 30.0,
              color: Colors.white,
            ),
            const SizedBox(height: 6.0),
            Text(
              title,
              style: theme.textTheme.bodyMedium!.copyWith(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
