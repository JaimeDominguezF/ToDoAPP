import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/data/db.dart';
import 'package:todoapp/util/ToDoTile.dart';
import 'package:todoapp/util/Dialogo.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //referencia la caja de Hive
  final _miCaja = Hive.box('micaja');
  DB db = DB();

  @override
  void initState() {
    // TODO: implement initState
    if(_miCaja.get("TODOLIST") == null) {
      db.createInitialData();
    }else{
      db.loadData();
    }




    super.initState();
  }
  
  //controller
  final _controller = TextEditingController();


  // Checkbox clickado

  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  //Crear nueva tarea

  void crearNuevaTarea(){
    showDialog(
      context: context, 
      builder: (context){
        return Dialogo(
          controller: _controller,
          onSave: Guardar,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }
    //guardar la tarea
    void Guardar(){

    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();

  }

  //borrar la tarea

  void borrar(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("Para hacer"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          crearNuevaTarea();
        },
        backgroundColor: Colors.yellow,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return Todotile(
            nombreTarea: db.toDoList[index][0], 
            tareaCompletada: db.toDoList[index][1], 
            onChanged: (value) => checkBoxChanged(value,index),
            borrarFuncion: (context) => borrar(index),
          );
        },
      ),
    );
  }
}