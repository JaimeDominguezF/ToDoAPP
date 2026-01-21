import 'package:flutter/material.dart';


class Boton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

   Boton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(text),
      color: Colors.yellow[200],
    );
  }
}