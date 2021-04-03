import 'package:flutter/material.dart';

class TextFormFieldsCadastro extends StatelessWidget {

  TextFormFieldsCadastro({this.controller, this.texto, this.tipo, this.onChanged});

  final TextEditingController controller;
  final TextInputType tipo;
  final String texto;
  final ValueChanged onChanged;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        onChanged: (value) {
          onChanged;
        },
        keyboardType: tipo,
        textCapitalization: TextCapitalization.characters,
        controller: controller,
        style: TextStyle(color: Colors.blue),
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
          labelText: texto,
          labelStyle: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }
}
