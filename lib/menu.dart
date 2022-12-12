import 'package:flutter/material.dart';
import 'package:flutter_improve_your_ball/modelView/ContainerButtonIYP.dart';
import 'package:flutter_improve_your_ball/modelView/appbarIYP.dart';
import 'package:flutter_improve_your_ball/modelView/containerIYP.dart';
import 'package:graphic/graphic.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _Menu();
}

class _Menu extends State<Menu> {
  double sumTimePlay = 0;
  double sumThreePoints = 2;
  double sumTwoPoints = 9;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarIYP(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              const ContainerIYP(
                text: Text(
                  'Bienvenue sur Improve Your Ball ! 🏀',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                couleur: Colors.deepOrangeAccent,
              ),
              const ContainerIYP(
                text: Text(
                  'Sur cette application vous allez pouvoir suivre votre progression de basket, en ajoutant vos matchs, vos programmes, vos victoires, \n voir le classement aux travers des différents utilisateurs et bien plus !',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                couleur: Colors.orange,
              ),
              ContainerIYP(
                text: Text(
                  'Voici les statistiques de vos 3 dernier matchs :\n Vous avez joué en moyenne $sumTimePlay minutes \n Votre moyenne de 2 points est $sumThreePoints \n Votre moyenne de 2 points $sumTwoPoints',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                couleur: Colors.deepOrangeAccent,
              ),
              //Section match
              const ContainerButtonIYP(
                children: [
                  Text(
                    'Vous souhaitez ajouter des matchs ?\n Apuuyez sur le bouton pour accéder au menu match',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  ElevatedButton(
                    onPressed: null,
                    child: Text('MATCH'),
                  )
                ],
                couleur: Colors.orange,
              ),
              //Section classement
              const ContainerButtonIYP(
                children: [
                  Text(
                    'Vous souhaitez voir le classement \n et vous comparez avec les utilisateurs ? \n Appusez le bouton pour accéder au classement',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  ElevatedButton(
                    onPressed: null,
                    child: Text('CLASSEMENT'),
                  ),
                ],
                couleur: Colors.deepOrangeAccent,
              ),
              //Section programme
              const ContainerButtonIYP(
                children: [
                  Text(
                    'Vous souhaitez ajouter des matchs ?\n Apuuyez sur le bouton pour accéder au menu match',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  ElevatedButton(
                    onPressed: null,
                    child: Text('MATCH'),
                  )
                ],
                couleur: Colors.orange,
              ),

              //Les 3 derniers match
              //Les stats
              //Aller à la page match
              //Aller à la page classement
              //Aller à la page programme
            ],
          ),
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
