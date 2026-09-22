
import 'package:flutter/material.dart';
import 'package:flutter_application_2/nexProyecto/widgets.dart';
import 'package:flutter_application_2/nexProyecto/appbar.dart';

class Pantalla2Screen extends StatelessWidget {
  const Pantalla2Screen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Pantalla 2',
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const SizedBox(height: 20),

            CustomButton(
              text: 'Boton 1',
              onPressed: () {
                print('Botón 1');
              },
            ),

            const SizedBox(height: 15),

            CustomButton(
              text: 'Boton 2',
              onPressed: () {
                print('Botón 2');
              },
            ),

            const SizedBox(height: 15),

            CustomButton(
              text: 'Boton 3',
              onPressed: () {
                print('Botón 3');
              },
            ),

            const SizedBox(height: 15),

            CustomButton(
              text: 'Boton 4',
              onPressed: () {
                print('Botón 4');
              },
            ),

            const SizedBox(height: 15),

            CustomButton(
              text: 'Boton 5',
              onPressed: () {
                print('Botón 5');
              },
            ),

            const SizedBox(height: 30),

            // Ejemplo de botón de solo lectura
            CustomButton(
              text: 'Botón bloqueado',
              readOnly: true,
            ),
          ],
        ),
      ),
    );
  }
}