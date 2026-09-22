import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/calculadora.dart';
import 'package:flutter_application_2/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.themeData,
      routes: {
        '/example': (context) => const Calculadora(nombre: 'Vicente'),
        '/calculadora': (context) => const Calculadora(nombre: 'Vicente'),
      },
      home: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú principal'),
      ),

      
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Calculadora(nombre: 'Vicente'),
                  ),
                );
              },
              child: const Text('Calculadora'),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/example',
                  arguments: {'nombre': 'Vicente'},
                );
              },
              child: const Text('Ruta ejemplo'),
            ),
          ],
        ),
      ),
    );
  }
}
