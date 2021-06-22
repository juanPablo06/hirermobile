import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  const Editor(
      {Key? key,
      required this.controller,
      required this.hint,
      required this.label})
      : super(key: key);

  final TextEditingController controller;
  final String hint;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 8, 8, 8),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 16),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.red[800]),
            hintText: hint,
            labelText: label,
            focusColor: Colors.red[900],
            hoverColor: Colors.red[900],
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent),
            )),
      ),
    );
  }
}
