import 'package:flutter/material.dart';
import 'package:todo/Screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'todo App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),

    );
  }
}
