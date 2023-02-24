import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_improve_your_ball/model/local.dart';
import 'package:flutter_improve_your_ball/modelView/ContainerButtonIYP.dart';
import 'package:flutter_improve_your_ball/modelView/appbarIYP.dart';
import 'package:flutter_improve_your_ball/modelView/containerIYP.dart';
import 'data/recontre_data.dart';
import 'model/api.dart';
import 'model/couleur.dart';
import 'model/user.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _Menu();
}

class _Menu extends State<Menu> {
  ///Permet de savoir si l'utilisateur à appuyer sur un bouton de la appBar
  bool isPush = false;
  late Column screenDisplay;
  late Color colorButtonMenu;
  late Color colorButtonClassement;
  late Color colorButttonProfile;
  double sumTimePlay = 0;
  double sumThreePoints = 2;
  double sumTwoPoints = 9;

  @override
  void initState() {
    super.initState();
    clearColorButtonBottomAppBar();
    menuDisplay();
  }

  ///Fonction pour remettre tout les boutons à la couleur noir.
  void clearColorButtonBottomAppBar() {
    colorButtonMenu = Colors.black;
    colorButtonClassement = Colors.black;
    colorButttonProfile = Colors.black;
  }

  void goToClassement() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          height: MediaQuery.of(context).size.height / 12,
          color: Colors.orange,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: menuDisplay,
                icon: const Icon(Icons.house),
                splashColor: Colors.white,
                color: colorButtonMenu,
              ),
              IconButton(
                onPressed: classementDisplay,
                icon: const Icon(Icons.groups_2),
                color: colorButtonClassement,
              ),
              IconButton(
                onPressed: profileDisplay,
                icon: const Icon(Icons.person),
                color: colorButttonProfile,
              )
            ],
          )),
      appBar: const AppBarIYP(),
      body: SingleChildScrollView(
        child: Center(child: screenDisplay),
      ),
    );
  }

  void classementDisplay() {
    if (!isPush) {
      isPush = true;
      clearColorButtonBottomAppBar();
      colorButtonClassement = Colors.white;
      screenDisplay = Column(
        children: [
          ContainerButtonIYP(
            couleur: Couleur.rouge,
            children: [
              const Padding(
                  padding: EdgeInsets.all(4),
                  child: Text("Voir le classement des 3 points")),
              ElevatedButton(
                onPressed: goToClassementTroisPoints,
                child: const Text("Voir classement"),
              ),
            ],
          ),
        ],
      );
    }
    isPush = false;

    setState(() {});
  }

  ///Déconnecte l'utilisateur
  void deconnexion() {
    //On vide les variables local
    Local.LocalUsername = "";
    Local.LocalPassword = "";
    Local.localToken = "";
    //On renvoie sur l'écran de connexion
    Navigator.of(context).popAndPushNamed("/login");
    setState(() {});
  }

  ///Pour afficher le profil de l'utilisateur
  Future<void> profileDisplay() async {
    if (!isPush) {
      isPush = true;
      clearColorButtonBottomAppBar();
      colorButttonProfile = Colors.white;
      loadDisplay();
      User user = await API.getUserWithUsername(Local.LocalUsername);
      screenDisplay = Column(
        children: [
          ContainerIYP(
            text: Text(
              'Hello, ${user.nom.toUpperCase()} ${user.prenom.toLowerCase()} !',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            couleur: Couleur.rouge,
          ),
          TextButton(
            onPressed: deconnexion,
            child: const Text("Déconnexion"),
          ),
          ContainerButtonIYP(couleur: Couleur.rouge, children: [
            Text(
              "Vous avez ${user.rencontres.length} rencontres !",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            // le graphique
            SizedBox(
              width: 1000,
              height: 100,
              child: PieChart(
                PieChartData(
                  sections: RencontreData.getSection(user.rencontres),
                  sectionsSpace: 2.0,
                  centerSpaceRadius: 10,
                ),
                swapAnimationDuration:
                    const Duration(milliseconds: 150), // Optional
                swapAnimationCurve: Curves.linear,
              ),
            ),
          ]),
        ],
      );
    }
    isPush = false;
    setState(() {});
  }

  ///Fonction pour accèder à l'écran Match
  void goToRencontre() {
    setState(() {
      Navigator.pushNamed(context, '/match');
    });
  }

  ///Fonction pour accèder à l'écran classement 3 points
  void goToClassementTroisPoints() {
    setState(() {
      Navigator.pushNamed(context, '/classementTroisPoints');
    });
  }

  ///Pour afficher l'écran de chargement
  void loadDisplay() {
    screenDisplay = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(padding: EdgeInsets.all(10)),
        CircularProgressIndicator(
          color: Colors.orange,
        )
      ],
    );
    setState(() {});
  }

  ///Pour afficher le menu
  Future<void> menuDisplay() async {
    if (!isPush) {
      isPush = true;
      clearColorButtonBottomAppBar();
      colorButtonMenu = Colors.white;
      loadDisplay();
      await Future.delayed(Duration(milliseconds: 1000));
      screenDisplay = Column(
        children: <Widget>[
          ContainerIYP(
            text: const Text(
              'Bienvenue sur Improve Your Ball ! 🏀',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            couleur: Couleur.rouge,
          ),
          //Section match
          ContainerButtonIYP(
            couleur: Couleur.noir,
            children: [
              const Text(
                'Vous souhaitez ajouter ou voir vos matchs ?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              ElevatedButton(
                onPressed: goToRencontre,
                child: const Text('Appuyez ici'),
              )
            ],
          ),
          //Section classement
          ContainerButtonIYP(
            couleur: Couleur.rouge,
            children: const [
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
          ),
          //Section programme
          const ContainerButtonIYP(
            couleur: Colors.orange,
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
          ),
        ],
      );
    }
    isPush = false;
    setState(() {});
  }
}
