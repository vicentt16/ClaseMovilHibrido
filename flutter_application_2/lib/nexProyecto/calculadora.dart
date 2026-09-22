import 'package:flutter/material.dart';
import 'package:flutter_application_2/nexProyecto/config.dart';
import 'package:flutter_application_2/nexProyecto/appbar.dart';

class CalculadoraScreen extends StatefulWidget {
  const CalculadoraScreen({super.key});

  @override
  State<CalculadoraScreen> createState() =>
      _CalculadoraScreenState();
}

class _CalculadoraScreenState
    extends State<CalculadoraScreen> {

  String resultado = '0';

  void agregarNumero(String numero) {
    setState(() {
      if (resultado == '0') {
        resultado = numero;
      } else {
        resultado += numero;
      }
    });
  }

  void limpiar() {
    setState(() {
      resultado = '0';
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Calculadora',
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            // Pantalla de la calculadora
            Container(
              width: double.infinity,
              height: 130,

              padding: const EdgeInsets.all(20),

              alignment: Alignment.bottomRight,

              decoration: BoxDecoration(
                color: AppColors.primary,
                border: Border.all(
                  color: AppColors.border,
                ),
                borderRadius: BorderRadius.circular(15),
              ),

              child: Text(
                resultado,
                style: const TextStyle(
                  fontSize: 40,
                  color: AppColors.text,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Botones
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,

                children: [

                  _calcButton(
                    '7',
                    () => agregarNumero('7'),
                  ),

                  _calcButton(
                    '8',
                    () => agregarNumero('8'),
                  ),

                  _calcButton(
                    '9',
                    () => agregarNumero('9'),
                  ),

                  _calcButton(
                    '/',
                    () {},
                  ),

                  _calcButton(
                    '4',
                    () => agregarNumero('4'),
                  ),

                  _calcButton(
                    '5',
                    () => agregarNumero('5'),
                  ),

                  _calcButton(
                    '6',
                    () => agregarNumero('6'),
                  ),

                  _calcButton(
                    '*',
                    () {},
                  ),

                  _calcButton(
                    '1',
                    () => agregarNumero('1'),
                  ),

                  _calcButton(
                    '2',
                    () => agregarNumero('2'),
                  ),

                  _calcButton(
                    '3',
                    () => agregarNumero('3'),
                  ),

                  _calcButton(
                    '-',
                    () {},
                  ),

                  _calcButton(
                    '0',
                    () => agregarNumero('0'),
                  ),

                  _calcButton(
                    'C',
                    limpiar,
                  ),

                  _calcButton(
                    '=',
                    () {},
                  ),

                  _calcButton(
                    '+',
                    () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _calcButton(
    String text,
    VoidCallback function,
  ) {
    return OutlinedButton(
      onPressed: function,

      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.text,
        backgroundColor: AppColors.primary,

        side: const BorderSide(
          color: AppColors.border,
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),

      child: Text(
        text,
        style: const TextStyle(
          fontSize: 22,
        ),
      ),
    );
  }
}