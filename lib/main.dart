import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/pages/HomePage.dart';

void main() async{

  //inicializar Hive

  await Hive.initFlutter();

  //abrir una caja

  var box = await Hive.openBox('micaja');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}