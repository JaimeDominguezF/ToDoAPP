import 'package:flutter/material.dart';
import 'package:todoapp/util/ToDoTile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("Para hacer"),
      ),
      body: ListView(
        children: [
          Todotile(
            nombreTarea: "Prueba",
            tareaCompletada: true,
            onChanged: (p0) {},
          ),
        ],
      ),
    );
  }
}