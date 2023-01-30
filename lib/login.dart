import 'package:flutter/material.dart';
import 'package:flutter_improve_your_ball/model/local.dart';
import 'package:flutter_improve_your_ball/modelView/ContainerButtonIYP.dart';
import 'package:flutter_improve_your_ball/modelView/appbarIYP.dart';
import 'package:flutter_improve_your_ball/modelView/containerIYP.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() => _Login();
}

class _Login extends State<Login> {
  late TextEditingController _controllerUsername;
  late TextEditingController _controllerPassword;
  String errorMsg = "";
  @override
  void initState() {
    super.initState();
    _controllerUsername = TextEditingController();
    _controllerPassword = TextEditingController();
  }

  void connect() {
    setState(() {});
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
              'Connectez-vous pour continuer',
            ),
            TextField(
              controller: _controllerUsername,
              decoration: const InputDecoration(
                hintText: 'Username',
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
            Text(
              errorMsg,
              style: const TextStyle(color: Colors.red),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            ElevatedButton(
              onPressed: connect,
              child: const Text('Connexion'),
            )
          ])
        ],
      )),
    );
  }
}
