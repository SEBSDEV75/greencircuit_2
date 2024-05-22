import 'package:flutter/material.dart';

import '../../core/constants.dart';
import 'programs_computers_Mac.dart';
import 'programs_computers_Windows.dart';

class ComputadoresPage extends StatelessWidget {
  const ComputadoresPage({super.key});

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
                  'Reciclaje para computadoras de Mac',
                  Icons.computer,
                  () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return const ProgramsMacPage();
                      },
                    );
                  },
                  buttonWidth,
                ),
                _buildButton(
                  context,
                  'Reciclaje para computadoras de Windows',
                  Icons.computer_sharp,
                  () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return const ProgramsWindowsPage();
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
