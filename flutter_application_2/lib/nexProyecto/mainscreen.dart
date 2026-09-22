import 'package:flutter/material.dart';
import 'package:flutter_application_2/nexProyecto/widgets.dart';
import 'package:flutter_application_2/nexProyecto/config.dart';
import 'package:flutter_application_2/nexProyecto/appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'App bar',
      ),

      body: Padding(
        padding: const EdgeInsets.all(
          AppSizes.screenPadding,
        ),

        child: Column(
          children: [

            const SizedBox(height: 50),

            CustomButton(
              text: 'Calculadora',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/calculadora',
                );
              },
            ),

            const SizedBox(height: 20),

            CustomButton(
              text: 'Pantalla 2',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/pantalla2',
                );
              },
            ),

            const SizedBox(height: 20),

            CustomButton(
              text: 'Pantalla 3',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/pantalla3',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
