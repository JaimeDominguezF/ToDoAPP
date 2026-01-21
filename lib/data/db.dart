import 'package:hive_flutter/hive_flutter.dart';

class DB{

  List toDoList = [];

  final _miCaja = Hive.box('micaja');

  void createInitialData(){
    toDoList = [
      ["prueba", false]
    ];
  }


  void loadData() {
    toDoList = _miCaja.get("TODOLIST");
  }

  void updateData() {
    _miCaja.put("TODOLIST", toDoList);
  }

}


