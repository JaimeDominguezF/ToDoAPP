import 'package:flutter/material.dart';

class Todotile extends StatelessWidget {

  final String nombreTarea;
  final bool tareaCompletada;
  Function(bool?)? onChanged;

   Todotile({
    super.key,
    required this.nombreTarea,
    required this.tareaCompletada,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        padding: EdgeInsets.all(18),
        child: Row(
          children: [
            //checkbox
            Checkbox(value: tareaCompletada, onChanged: onChanged),

            //Nombre de la tarea
            Text(nombreTarea),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(12),
          ),
      ),
    );
  }
}