import 'package:flutter/material.dart';
import 'package:flutter_improve_your_ball/model/local.dart';
import 'package:flutter_improve_your_ball/modelView/ContainerButtonIYP.dart';
import 'package:flutter_improve_your_ball/modelView/appbarIYP.dart';
import 'package:flutter_improve_your_ball/modelView/containerIYP.dart';
import 'package:graphic/graphic.dart';
import 'model/api.dart';
import 'model/local.dart';
import 'model/user.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _Menu();
}

class _Menu extends State<Menu> {
  ///Permet de savoir si l'utilisateur à appuyer sur un bouton de la appBar
  bool isPush = false;
  final Color rouge = const Color.fromRGBO(167, 0, 30, 1);
  final Color noir = const Color.fromRGBO(30, 15, 28, 1);
  late Column screenDisplay;
  late Color colorButtonMenu;
  late Color colorButtonTest;
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
    colorButtonTest = Colors.black;
    colorButttonProfile = Colors.black;
  }

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
                onPressed: testDisplay,
                icon: const Icon(Icons.troubleshoot_sharp),
                color: colorButtonTest,
              ),
              IconButton(
                onPressed: profileDisplay,
                icon: const Icon(Icons.person),
                color: colorButttonProfile,
              )
            ],
          )),
      appBar: AppBarIYP(),
      body: SingleChildScrollView(
        child: Center(child: screenDisplay),
      ),
    );
  }

  void testDisplay() {
    clearColorButtonBottomAppBar();
    colorButtonTest = Colors.white;
    screenDisplay = Column(
      children: [Text('test')],
    );
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
              'Hello, ${user.username} !',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            couleur: rouge,
          ),
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
            couleur: rouge,
          ),
          //Section match
          ContainerButtonIYP(
            couleur: noir,
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
            couleur: rouge,
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
        ],
      );
    }
    isPush = false;
    setState(() {});
  }
}
