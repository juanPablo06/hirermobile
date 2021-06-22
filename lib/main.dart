import 'package:flutter/material.dart';
import 'package:hirermobile/database/app_database.dart';
import 'package:hirermobile/models/curriculo.dart';
import 'package:hirermobile/screens/curriculo/lista.dart';

void main() {
  runApp(HirerApp());
}

class HirerApp extends StatelessWidget {
  const HirerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red[900],
        accentColor: Colors.redAccent[700],
        fontFamily: 'Poppins',
      ),
      home: Scaffold(
        body: ListaCurriculos(),
      ),
    );
  }
}
