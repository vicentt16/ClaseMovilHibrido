import 'package:flutter/material.dart';

class NumberInput2 extends StatefulWidget{
  final TextEditingController input;
  final TextEditingController? input2;
  final String labelNumber;

  const NumberInput2({
    super.key,
    required this.input,
    this.input2,
    this.labelNumber = '',
  });

  @override
  State<NumberInput2> createState() => _NumberInput2();
}

class _NumberInput2 extends State<NumberInput2>{

  @override
  void setNumber(){
    widget.input.text += widget.labelNumber;
  }

  Widget build(BuildContext context){
    return ElevatedButton(
      onPressed: setNumber,
      child: Text(widget.labelNumber),
    );
  }
}