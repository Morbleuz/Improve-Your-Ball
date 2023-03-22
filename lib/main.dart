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
<<<<<<< HEAD
        '/register': (context) => const Register(),
        '/match': (context) => const RencontreScreen()
=======
        '/match': (context) => const RencontreScreen(),
        '/classementTroisPoints': (context) => const ClassementTroisPoint(),
        '/classementDeuxPoints': (context) => const ClassementDeuxPoint(),
        '/classementVictoire': (context) => const ClassementVictoire(),
>>>>>>> 9bab01bee2cd7b34a7b7b983ab2e10c6c9ea32a8
      },
    );
  }
}
