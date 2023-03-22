import 'package:flutter/material.dart';
import 'package:flutter_improve_your_ball/menu.dart';
import 'package:flutter_improve_your_ball/main.dart';
import 'package:flutter_improve_your_ball/model/constant.dart';

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
  late TextEditingController _controllerPasswordVerif;
  late TextEditingController _controllerNom;

  late TextEditingController _controllerPrenom;

  // late TextEditingController _controllerPassword2;

  ///Permet de savoir si l'utilisateur est rentré dans le champs Username
  bool clickOnUsername = false;
  bool clickOnPassword = false;

  ///Les vérifications du Username
  String? _errorUsername = null;

  ///Les vérifications du password
  String? get _errorPassord {
    final text = _controllerPassword.value.text;
    if (text.isEmpty && clickOnPassword) {
      return 'Ce champ ne doit pas être vide';
    }
    if (clickOnPassword && !Constant.regexStrongPassword.hasMatch(text)) {
      return 'Mot de passe non valide';
    }
    // return null if the text is valid
    return null;
  }

  String errorMsg = "";
  String? _errormdp = null;

  String? _errormdpverif = null;

  String? _errorusername = null;
  String? _errornom = null;

  String? _errorprenom = null;

  @override
  void initState() {
    super.initState();
    _controllerUsername = TextEditingController();
    _controllerPassword = TextEditingController();
    _controllerPasswordVerif = TextEditingController();

    _controllerNom = TextEditingController();
    _controllerPrenom = TextEditingController();
  }

  bool valide() {
    if (_controllerUsername.text.isEmpty) {
      errorMsg = 'Le nom d\'utilisateur est vide';
      return true;
    }
    if (_controllerPassword.text.isEmpty) {
      errorMsg = 'Le mot de passe est vide';
    }
    if (_controllerPasswordVerif.text.isEmpty) {
      errorMsg = 'Le mot de passe est vide';
    }
    if (_controllerNom.text.isEmpty) {
      errorMsg = 'Le mot de passe est vide';
    }
    if (_controllerPrenom.text.isEmpty) {
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

  ///Permet de se connecter à l'API
  void connect() async {
    //Vérification du formulaire
    if (_errorUsername == null && _errorPassord == null) {
      //On stocker les variables localement
      Local.LocalUsername = _controllerUsername.text;
      Local.LocalPassword = _controllerPassword.text;
    }
    await API.sendUser(_controllerUsername.text, _controllerPassword.text,
        _controllerNom.text, _controllerPrenom.text);
    if (API.responseCode == 201) {
      goToLogin();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange,
        body: SingleChildScrollView(
          child: Center(
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
                //Username
                TextField(
                  controller: _controllerUsername,
                  decoration: InputDecoration(
                    hintText: 'Nom d\'utilisateur',
                    errorText: _errorusername,
                    icon: const Icon(Icons.person),
                  ),
                  onChanged: (text) => setState(() {
                    if (text.isEmpty) {
                      _errorusername =
                          "Le nom d\'utilisateur peut pas être vide";
                    }
                    if (text.isNotEmpty) {
                      _errorusername = null;
                    }
                  }),
                ),
                //Nom
                TextField(
                  controller: _controllerNom,
                  decoration: InputDecoration(
                    hintText: 'Nom',
                    errorText: _errornom,
                    icon: const Icon(Icons.person),
                  ),
                  onChanged: (text) => setState(() {
                    if (text.isEmpty) {
                      _errornom = "Nom peut pas être vide";
                    }
                    if (text.isNotEmpty) {
                      _errornom = null;
                    }
                  }),
                ),
                //Prénom
                TextField(
                  controller: _controllerPrenom,
                  decoration: InputDecoration(
                    hintText: 'Prénom',
                    errorText: _errorprenom,
                    icon: const Icon(Icons.person),
                  ),
                  onChanged: (text) => setState(() {
                    if (text.isEmpty) {
                      _errorprenom = "Prénom peut pas être vide";
                    }
                    if (text.isNotEmpty) {
                      _errorprenom = null;
                    }
                  }),
                ),
                TextField(
                  obscureText: true,
                  controller: _controllerPassword,
                  decoration: InputDecoration(
                    hintText: 'Mot de passe',
                    errorText: _errormdp,
                    icon: const Icon(Icons.lock),
                  ),
                  onChanged: (text) => setState(() {
                    if (!Constant.regexStrongPassword.hasMatch(text)) {
                      _errormdp = "mot de passe non valide";
                    } else {
                      _errormdp = null;
                    }
                    if (text.isEmpty) {
                      _errormdp = null;
                    }
                  }),
                ),
                TextField(
                  obscureText: true,
                  controller: _controllerPasswordVerif,
                  decoration: InputDecoration(
                    hintText: 'Confirmation du mot de passe',
                    errorText: _errormdpverif,
                    icon: const Icon(Icons.lock),
                  ),
                  onChanged: (text) => setState(() {
                    if (!Constant.regexStrongPassword.hasMatch(text)) {
                      _errormdpverif = "mot de passe non valide";
                    } else {
                      _errormdpverif = null;
                    }
                    if (text.isEmpty) {
                      _errormdpverif = null;
                    }
                    if (_controllerPassword.text != text) {
                      _errormdp = "Les mot de passe sont pas identique";
                      _errormdpverif = "Les mot de passe sont pas identique";
                    } else if (_controllerPassword.text == text) {
                      _errormdp = null;
                      _errormdpverif = null;
                    }
                  }),
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
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: goToLogin,
                        child: const Text("Retour"),
                      ),
                      ElevatedButton(
                        onPressed: connect,
                        child: const Text('Inscription'),
                      )
                    ]),
              ])
            ],
          )),
        ));
  }
}
