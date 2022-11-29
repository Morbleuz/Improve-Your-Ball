import 'package:flutter/material.dart';
import 'package:flutter_improve_your_ball/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Improve Your Ball',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: Menu(),
    );
  }
}
