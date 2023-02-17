import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_improve_your_ball/extension.dart';
import 'package:flutter_improve_your_ball/model/rencontre.dart';
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

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarIYP(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            ContainerIYP(
              text: Text("Que souhaitez-vous faire ?"),
              couleur: Colors.orange,
            ),
          ],
        ),
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
                            Rencontre rencontre = Rencontre(
                                0,
                                nombreDeuxPoints,
                                nombreTroisPoints,
                                nombreRebonds,
                                minuteJouer,
                                gagner,
                                nombreDeFautes);
                            print(rencontre.toString());
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
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
