import 'package:flutter/material.dart';

import 'MyHomePage.dart';

void main() {
  runApp(const MyApp());
}
  class MyApp extends StatelessWidget {
  const MyApp({super.key});//construtor

  @override//sobrescreve o metodo
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: MyHomePage(),);
  }
} 
