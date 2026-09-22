import 'package:flutter/material.dart';
import 'package:flutter_application_2/newCalculadora/InputClass.dart';
import 'package:flutter_application_2/newCalculadora/actionButton2.dart';
import 'package:flutter_application_2/newCalculadora/input2.dart';
import 'package:flutter_application_2/newCalculadora/numberInput.dart';

class Calculadora extends StatefulWidget {
  final String? nombre;

  const Calculadora({super.key, this.nombre});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  late final TextEditingController inputIzq;
  late final TextEditingController inputDer;
  late final TextEditingController inputRespuesta;

  @override
  void initState() {
    super.initState();
    inputIzq = TextEditingController();
    inputDer = TextEditingController();
    inputRespuesta = TextEditingController();
  }

  @override
  void dispose() {
    inputIzq.dispose();
    inputDer.dispose();
    inputRespuesta.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ?? {};
    final String nombreParams = widget.nombre ?? args['nombre'] as String? ?? 'No hay Nombre';
    final String apellidoParams = args['apellido'] as String? ?? 'No hay Apellido';

    return Scaffold(
      appBar: AppBar(
        title: Text('Hola $nombreParams $apellidoParams'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Input2(input: inputIzq, labelText: 'Input Izq'),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Input2(input: inputDer, labelText: 'Input Der'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Input2(
                input: inputRespuesta,
                labelText: 'Input Respuesta',
                readOnly: true,
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: NumberInput2(
                    input: inputIzq,
                    input2: inputDer,
                    labelNumber: '1',
                  ),
                ),
                Expanded(
                  child: NumberInput2(
                    input: inputIzq,
                    input2: inputDer,
                    labelNumber: '4',
                  ),
                ),
                Expanded(
                  child: NumberInput2(
                    input: inputIzq,
                    input2: inputDer,
                    labelNumber: '7',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Expanded(
                  child: NumberInput2(
                    input: inputIzq,
                    input2: inputDer,
                    labelNumber: '2',
                  ),
                ),
                Expanded(
                  child: NumberInput2(
                    input: inputIzq,
                    input2: inputDer,
                    labelNumber: '5',
                  ),
                ),
                Expanded(
                  child: NumberInput2(
                    input: inputIzq,
                    input2: inputDer,
                    labelNumber: '8',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Expanded(
                  child: NumberInput2(
                    input: inputIzq,
                    input2: inputDer,
                    labelNumber: '3',
                  ),
                ),
                Expanded(
                  child: NumberInput2(
                    input: inputIzq,
                    input2: inputDer,
                    labelNumber: '6',
                  ),
                ),
                Expanded(
                  child: NumberInput2(
                    input: inputIzq,
                    input2: inputDer,
                    labelNumber: '9',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ActionButton(
                inputClass: Inputclass(
                  inputIzq: inputIzq,
                  inputDer: inputDer,
                  inputRespuesta: inputRespuesta,
                  labelAction: 'CLEAR',
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Expanded(
                  child: ActionButton(
                    inputClass: Inputclass(
                      inputIzq: inputIzq,
                      inputDer: inputDer,
                      inputRespuesta: inputRespuesta,
                      labelAction: 'SUMA',
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: ActionButton(
                    inputClass: Inputclass(
                      inputIzq: inputIzq,
                      inputDer: inputDer,
                      inputRespuesta: inputRespuesta,
                      labelAction: 'RESTA',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: SizedBox(),
            ),
            ListTile(
              title: Text('Item 1'),
            ),
            ListTile(
              title: Text('Item 2'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
