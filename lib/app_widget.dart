
import 'package:exercicio02/app/screens/sprint/sprint_module.dart';
import 'package:flutter/material.dart';


class AppWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: SprintModule(),
    );
  }
}