import 'package:flutter/material.dart';
import 'package:flutter_improve_your_ball/classement.dart';
import 'package:flutter_improve_your_ball/login.dart';
import 'package:flutter_improve_your_ball/register.dart';
import 'package:flutter_improve_your_ball/rencontre.dart';
import 'package:flutter_improve_your_ball/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Improve Your Ball',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      initialRoute: '/login',
      routes: {
        '/menu': (context) => const Menu(),
        '/login': (context) => const Login(),
        '/match': (context) => const RencontreScreen(),
        '/register': (context) => const Register(),
        '/classementTroisPoints': (context) => const ClassementTroisPoint(),
        '/classementDeuxPoints': (context) => const ClassementDeuxPoint(),
        '/classementVictoire': (context) => const ClassementVictoire(),
      },
    );
  }
}
