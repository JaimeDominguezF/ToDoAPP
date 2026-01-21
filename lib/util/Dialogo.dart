import 'package:flutter/material.dart';
import 'package:todoapp/util/Boton.dart';

class Dialogo extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;



   Dialogo({super.key, required this.controller, required this.onCancel, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //textfield con hint
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Agrega una nueva tarea"
              ),
            ),
            //botones de envio y cancelar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              //boton salvar
              Boton(text: "Guardar", onPressed: onSave),


              //boton cancelar
              Boton(text: "Cancelar", onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}