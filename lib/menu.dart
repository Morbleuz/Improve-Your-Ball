import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_improve_your_ball/model/DTO/userUpdate.dart';
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
  final _formKey = GlobalKey<FormState>();
  UserUpdate userToUpdate = UserUpdate();

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

  void updateUser() async {
    loadDisplay();
    User user = await API.getUserWithUsername(Local.LocalUsername);
    await API.updateUser(user.id, userToUpdate);
    profileDisplay();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Modification de votre profil effectué ✅',
        ),
        duration: Duration(milliseconds: 1000),
      ),
    );
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
            couleur: Couleur.gris,
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
          ContainerButtonIYP(
            couleur: Couleur.gris,
            children: [
              const Padding(
                  padding: EdgeInsets.all(4),
                  child: Text("Voir le classement des 2 points")),
              ElevatedButton(
                onPressed: goToClassementDeuxPoints,
                child: const Text("Voir classement"),
              ),
            ],
          ),
          ContainerButtonIYP(
            couleur: Couleur.gris,
            children: [
              const Padding(
                  padding: EdgeInsets.all(4),
                  child: Text("Voir le classement des victoires")),
              ElevatedButton(
                onPressed: goToClassementVictoires,
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
          Text("Mon profil"),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            child: PhysicalModel(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue,
              elevation: 18,
              shadowColor: Colors.black,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("${user.nom} ${user.prenom}"),
                        IconButton(
                            onPressed: () => modifUser(user),
                            icon: Icon(Icons.settings))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Text("Rencontres"),
                            Text("${user.rencontres.length}")
                          ],
                        ),
                        Column(
                          children: const [Text("Programmes"), Text("0")],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          ContainerIYP(
            text: Text(
              'Hello, ${user.nom.toUpperCase()} ${user.prenom.toLowerCase()} !',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            couleur: Couleur.gris,
          ),
          TextButton(
            onPressed: deconnexion,
            child: const Text("Déconnexion"),
          ),
          ContainerButtonIYP(couleur: Couleur.gris, children: [
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

  ///Fonction pour accèder à l'écran classement 2 points
  void goToClassementDeuxPoints() {
    setState(() {
      Navigator.pushNamed(context, '/classementDeuxPoints');
    });
  }

  ///Fonction pour accèder à l'écran classement en rapport avec les victoires
  void goToClassementVictoires() {
    setState(() {
      Navigator.pushNamed(context, '/classementVictoire');
    });
  }

  ///Modif un User
  modifUser(User user) {
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
                      initialValue: user.nom,
                      decoration: const InputDecoration(hintText: 'Nom'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Champs vide';
                        }
                        userToUpdate.nom = value;
                        return null;
                      },
                    ),
                    TextFormField(
                      initialValue: user.prenom,
                      decoration: const InputDecoration(hintText: 'Prénom'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Champs vide';
                        }
                        userToUpdate.prenom = value;
                        return null;
                      },
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            updateUser();
                            Navigator.pop(context);
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

  ///Pour afficher l'écran de chargement
  void loadDisplay() {
    screenDisplay = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
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
            couleur: Couleur.gris,
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
            couleur: Couleur.gris,
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
