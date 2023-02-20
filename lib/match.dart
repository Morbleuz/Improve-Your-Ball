import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_improve_your_ball/extension.dart';
import 'package:flutter_improve_your_ball/model/api.dart';
import 'package:flutter_improve_your_ball/model/local.dart';
import 'package:flutter_improve_your_ball/model/rencontre.dart';
import 'package:flutter_improve_your_ball/model/user.dart';
import 'package:flutter_improve_your_ball/modelView/appbarIYP.dart';
import 'package:flutter_improve_your_ball/modelView/containerIYP.dart';

class RencontreScreen extends StatefulWidget {
  const RencontreScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RencontreScreen();
}

class _RencontreScreen extends State<RencontreScreen> {
  //Initialisation des diffèrents valeurs
  bool gagner = false;
  int nombreDeuxPoints = 0;
  int nombreTroisPoints = 0;
  int nombreRebonds = 0;
  int minuteJouer = 0;
  int nombreDeFautes = 0;

  List<Widget> listRencontres = [];

  ///Lorsque la fenêtre s'ouvre, exécution de méthodes...
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMatch();
  }

  ///Fonction pour envoyer le match dans la fenêtre de dialogue
  Future<void> sendMatch() async {
    //On ferme la fenêtre
    Navigator.of(context).pop();
    Rencontre rencontre = Rencontre(0, nombreDeuxPoints, nombreTroisPoints,
        nombreRebonds, minuteJouer, gagner, nombreDeFautes);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Envoie de la rencontre...')),
    );
    await API.sendRencontre(rencontre);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Rencontre correctement envoyé !')),
    );
    //On récupère les matchs
    getMatch();
  }

  ///Récupère la liste des matchs du User connecté
  Future<void> getMatch() async {
    //On vide la list de Recontres
    listRencontres = [];
    User user = await API.getUserWithUsername(Local.LocalUsername);
    for (Rencontre r in user.rencontres) {
      listRencontres.add(Text("Rencontre : ${r.id}"));
    }
    setState(() {});
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarIYP(),
      body: SingleChildScrollView(
        child: Column(children: listRencontres),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addRencontre(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  ///Ouvre un dialog pour ajouter une rencontre
  addRencontre(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (stfContext, stfSetState) {
            return AlertDialog(
              title: const Text("Ajouter une nouvelle rencontre"),
              content: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Nombre de deux points '),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Champs vide';
                        }
                        if (!value.isInt()) {
                          return 'Le champs doit être un entier';
                        }
                        nombreDeuxPoints = int.parse(value);

                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Nombre de trois points '),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Champs vide';
                        }
                        if (!value.isInt()) {
                          return 'Le champs doit être un entier';
                        }
                        nombreTroisPoints = int.parse(value);
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(hintText: 'Nombre de rebonts '),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Champs vide';
                        }
                        if (!value.isInt()) {
                          return 'Le champs doit être un entier';
                        }
                        nombreRebonds = int.parse(value);
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Nombre de minutes jouer'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Champs vide';
                        }
                        if (!value.isInt()) {
                          return 'Le champs doit être un entier';
                        }
                        minuteJouer = int.parse(value);

                        return null;
                      },
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(hintText: 'Nombre de fautes'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Champs vide';
                        }
                        if (!value.isInt()) {
                          return 'Le champs doit être un entier';
                        }
                        nombreDeFautes = int.parse(value);
                        return null;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text("Gagner ?"),
                        DropdownButton(
                            value: gagner,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 8,
                            underline: Container(
                              height: 2,
                            ),
                            onChanged: (bool? value) {
                              // This is called when the user selects an item.
                              stfSetState(() {
                                gagner = value!;
                              });
                            },
                            items: const [
                              DropdownMenuItem(
                                value: true,
                                child: Text('Oui'),
                              ),
                              DropdownMenuItem(
                                value: false,
                                child: Text('Non'),
                              )
                            ]),
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            sendMatch();
                          }
                        },
                        child: const Text('Envoyer'))
                  ],
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Fermer"))
              ],
            );
          });
        });
  }
}
