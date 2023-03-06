import 'package:flutter/material.dart';
import 'package:flutter_improve_your_ball/model/constant.dart';
import 'package:flutter_improve_your_ball/model/local.dart';
import 'package:flutter_improve_your_ball/modelView/ContainerButtonIYP.dart';
import 'package:flutter_improve_your_ball/modelView/appbarIYP.dart';
import 'package:flutter_improve_your_ball/modelView/containerIYP.dart';

import 'model/api.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() => _Login();
}

class _Login extends State<Login> {
  late TextEditingController _controllerUsername;
  late TextEditingController _controllerPassword;

  ///Permet de savoir si l'utilisateur est rentré dans le champs Username
  bool clickOnUsername = false;
  bool clickOnPassword = false;

  ///Les vérifications du Username
  String? get _errorUsername {
    final text = _controllerUsername.value.text;
    if (text.isEmpty && clickOnUsername) {
      return 'Ce champ ne doit pas être vide';
    }
    // return null if the text is valid
    return null;
  }

  ///Les vérifications du Password
  String? get _errorPassord {
    final text = _controllerPassword.value.text;
    if (text.isEmpty && clickOnPassword) {
      return 'Ce champ ne doit pas être vide';
    }

    // return null if the text is valid
    return null;
  }

  String errorMsg = "";
  @override
  void initState() {
    super.initState();
    _controllerUsername = TextEditingController();
    _controllerPassword = TextEditingController();
  }

  ///Permet de naviguer jusqu'au menu
  void goToMenu() {
    setState(() {
      Navigator.popAndPushNamed(context, "/menu");
    });
  }

  ///Permet de se connecter à l'API
  void connect() async {
    //Vérification du formulaire
    if (_errorUsername == null && _errorPassord == null) {
      //On stocker les variables localement
      Local.LocalUsername = _controllerUsername.text;
      Local.LocalPassword = _controllerPassword.text;
      await API.recupToken(_controllerUsername.text, _controllerPassword.text);
      if (Local.localToken.isNotEmpty) {
        errorMsg = "";
        goToMenu();
      } else {
        errorMsg = API.getMessage();
      }
    }

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
              decoration: InputDecoration(
                labelText: 'Username',
                errorText: _errorUsername,
                icon: const Icon(
                  Icons.person,
                ),
                suffixStyle: const TextStyle(color: Colors.green),
              ),
              onChanged: (text) => setState(() {
                clickOnUsername = true;
              }),
            ),
            TextField(
              obscureText: true,
              controller: _controllerPassword,
              decoration: InputDecoration(
                labelText: 'Mot de passe',
                errorText: _errorPassord,
                icon: const Icon(Icons.lock),
              ),
              onChanged: (text) => setState(() {
                clickOnPassword = true;
              }),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 2),
              child: Text(
                errorMsg,
                style: const TextStyle(color: Colors.red),
              ),
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
