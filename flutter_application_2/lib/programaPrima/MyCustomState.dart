import 'package:flutter/material.dart';

class MyButtonState extends StatefulWidget
 {
  const MyButtonState({super.key});

  @override
  State<MyButtonState> createState() => _MyButtonState();

 }

 class _MyButtonState extends State<MyButtonState> {

  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        ElevatedButton(
          onPressed: (){
            setState((){
              contador++;
            });
          },
          child: const Text("Sumar")
        ),
        ElevatedButton(
          onPressed: (){
            setState((){
              contador--;
            });
          },
          child: const Text("Retsar")
        ),
        Text("Contador: $contador")
      ]
    );
  }
 }
 