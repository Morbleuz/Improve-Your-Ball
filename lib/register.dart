import 'package:flutter/material.dart';
import 'package:flutter_improve_your_ball/menu.dart';
import 'package:flutter_improve_your_ball/main.dart';

import 'package:flutter_improve_your_ball/model/local.dart';
import 'package:flutter_improve_your_ball/modelView/ContainerButtonIYP.dart';
import 'package:flutter_improve_your_ball/modelView/appbarIYP.dart';
import 'package:flutter_improve_your_ball/modelView/containerIYP.dart';

import 'model/api.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<StatefulWidget> createState() => _Register();
}

class _Register extends State<Register> {
  late TextEditingController _controllerUsername;
  late TextEditingController _controllerPassword;
  late TextEditingController _controllerPassword2;

  String errorMsg = "";
  @override
  void initState() {
    super.initState();
    _controllerUsername = TextEditingController();
    _controllerPassword = TextEditingController();
    _controllerPassword2 = TextEditingController();
  }

  bool valide() {
    if (_controllerUsername.text.isEmpty) {
      errorMsg = 'Le nom d\'utilisateur est vide';
      return true;
    }
    if (_controllerPassword.text.isEmpty) {
      errorMsg = 'Le mot de passe est vide';
    }
    return false;
  }

//bouton inscription
  void goToMenu() {
    setState(() {
      if (valide() == false) {
        Navigator.popAndPushNamed(context, '/menu');
      }
    });
  }

//bouton retour
  void goToLogin() {
    setState(() {
      Navigator.popAndPushNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: MediaQuery.of(context).size.width - 20,
            height: MediaQuery.of(context).size.height / 3,
            color: Colors.white,
          ),
          ContainerButtonIYP(couleur: Colors.white, children: [
            const Text(
              'Bienvenue !',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Veuillez vous créer un compte pour continuer',
            ),
            TextField(
              controller: _controllerUsername,
              decoration: const InputDecoration(
                hintText: 'Nom d\'utilisateur',
                icon: Icon(Icons.person),
              ),
            ),
            TextField(
              obscureText: true,
              controller: _controllerPassword,
              decoration: const InputDecoration(
                hintText: 'Mot de passe',
                icon: Icon(Icons.lock),
              ),
            ),
            TextField(
              obscureText: true,
              controller: _controllerPassword2,
              decoration: const InputDecoration(
                hintText: 'Confirmation du mot de passe',
                icon: Icon(Icons.lock),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
              child: Text(
                errorMsg,
                style: const TextStyle(color: Colors.red),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              TextButton(
                onPressed: goToLogin,
                child: const Text("Retour"),
              ),
              ElevatedButton(
                onPressed: goToMenu,
                child: const Text('Inscription'),
              )
            ]),
          ])
        ],
      )),
    );
  }
}
