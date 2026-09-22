import 'package:flutter/material.dart';
import 'package:flutter_application_2/newCalculadora/InputClass.dart';

class ActionButton extends StatefulWidget {
  final Inputclass inputClass;

  const ActionButton({
    super.key,
    required this.inputClass,
  });

  @override
  State<ActionButton> createState() => _ActionButton();
}

class _ActionButton extends State<ActionButton> {
  void setAction() {
    if (widget.inputClass.labelAction == 'CLEAR') {
      widget.inputClass.inputIzq.clear();
      widget.inputClass.inputDer.clear();
      widget.inputClass.inputRespuesta.clear();
      return;
    }

    final left = double.tryParse(widget.inputClass.inputIzq.text.trim()) ?? 0;
    final right = double.tryParse(widget.inputClass.inputDer.text.trim()) ?? 0;

    if (widget.inputClass.labelAction == 'SUMA') {
      widget.inputClass.inputRespuesta.text = (left + right).toString();
    } else if (widget.inputClass.labelAction == 'RESTA') {
      widget.inputClass.inputRespuesta.text = (left - right).toString();
    }
  }


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: setAction,
      child: Text(widget.inputClass.labelAction),
    );
  }
}