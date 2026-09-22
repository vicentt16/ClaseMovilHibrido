import 'package:flutter/material.dart';
import 'package:flutter_application_2/nexProyecto/config.dart';
import 'package:flutter_application_2/nexProyecto/mainscreen.dart';
import 'package:flutter_application_2/nexProyecto/calculadora.dart';
import 'package:flutter_application_2/nexProyecto/pantalla2.dart';
import 'package:flutter_application_2/nexProyecto/pantalla3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi aplicación',

      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'Arial',
        colorScheme: const ColorScheme.dark(
          primary: AppColors.accent,
        ),
      ),

      initialRoute: '/',

      routes: {
        '/': (context) => const HomeScreen(),
        '/calculadora': (context) => const CalculadoraScreen(),
        '/pantalla2': (context) => const Pantalla2Screen(),
        '/pantalla3': (context) => const Pantalla3Screen(),
      },
    );
  }
}


class Producto {
  final String nombre;
  final String descripcion;
  final double precio;
  final String imagen;

  Producto({
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.imagen,
  });
}

