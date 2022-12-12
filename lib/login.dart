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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerUsername = TextEditingController();
    _controllerPassword = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBarIYP(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const ContainerIYP(
              text: Text(
                'Veuillez vous connecter pour accèder à Improve Your Ball.',
                textAlign: TextAlign.center,
              ),
              couleur: Colors.orange),
          ContainerButtonIYP(children: [
            const Text(
              'Username',
            ),
            TextField(
              controller: _controllerUsername,
            ),
            Text(
              'Mot de passe',
            ),
            TextField(
              obscureText: true,
              controller: _controllerPassword,
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text('Connexion'),
            )
          ], couleur: Colors.orange)
        ],
      )),
    );
  }
}
