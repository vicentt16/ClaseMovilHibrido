import 'package:flutter/material.dart';

class Input2 extends StatefulWidget{
  final TextEditingController input;
  final String labelText;
  final bool readOnly;

  const Input2({super.key, required this.input, this.labelText = "", this.readOnly = false});

  @override
  State<Input2> createState() => _Input2();
}

class _Input2 extends State<Input2>{
  @override
  Widget build(BuildContext context){
    return TextField(
      readOnly: widget.readOnly,
      controller: widget.input,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: widget.labelText,
      ),
    );
  }
}