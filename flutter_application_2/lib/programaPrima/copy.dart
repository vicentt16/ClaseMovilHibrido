import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mi primera app'),
          backgroundColor: const Color.fromARGB(255, 239, 177, 69),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                style: TextStyle(color: Colors.black, fontSize: 18),
                "Formulario de alumno",
              ),
              const SizedBox(height: 16),
              const TextField(
                style: TextStyle(color: Color.fromARGB(255, 240, 165, 60), fontSize: 18),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nombre',
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                style: TextStyle(color: Color.fromARGB(255, 240, 165, 60), fontSize: 18),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Apellido',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 240, 165, 60),
                  foregroundColor: Colors.white,
                ),
                child: Text('Guardar'),
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Icon(
                        Icons.ac_unit_rounded,
                        color: Color.fromARGB(255, 240, 165, 60),
                        size: 50.0,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.add_moderator_rounded, color: Color.fromARGB(255, 232, 153, 74), size: 50.0),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(
                        Icons.accessibility_new_sharp,
                        color: Color.fromARGB(255, 232, 153, 74),
                        size: 50.0,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                style: TextStyle(color: Colors.black, fontSize: 18),
                "Esta es mi imagen",
              ),
              const SizedBox(height: 16),
              const Image(
                image: NetworkImage(
                  'https://recetasdecocina.elmundo.es/wp-content/uploads/2022/08/zanahorias.jpg',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}