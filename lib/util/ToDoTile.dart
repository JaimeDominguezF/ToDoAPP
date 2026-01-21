import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todotile extends StatelessWidget {

  final String nombreTarea;
  final bool tareaCompletada;
  Function(bool?)? onChanged;
  Function(BuildContext)? borrarFuncion;

   Todotile({
    super.key,
    required this.nombreTarea,
    required this.tareaCompletada,
    required this.onChanged,
    required this.borrarFuncion,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: borrarFuncion,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
            ),
          child: Row(
            children: [
              //checkbox
              Checkbox(value: tareaCompletada, onChanged: onChanged),
        
              //Nombre de la tarea
              Text(
                nombreTarea,
                style: TextStyle(decoration: tareaCompletada ? TextDecoration.lineThrough : TextDecoration.none),
           
                ),
            ],
          ),
        ),
      ),
    );
  }
}