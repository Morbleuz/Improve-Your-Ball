import 'package:flutter/material.dart';
import 'package:flutter_improve_your_ball/modelView/containerIYP.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _Menu();
}

class _Menu extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: SizedBox(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                'assets/images/logo.png',
                width: 100,
                height: 100,
                color: Colors.white,
              ),
              const Padding(
                padding: EdgeInsets.all(2),
                child: Text("Improve Your Ball"),
              ),
            ]),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: const <Widget>[
                ContainerIYP(
                  text: Text(
                    'Bienvenue sur Improve Your Ball ! 🏀',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  couleur: Colors.orange,
                ),
                ContainerIYP(
                  text: Text(
                    'Sur cette application vous allez pouvoir suivre votre progression de basket, en ajoutant vos matchs, vos programmes, vos victoires,etc..',
                    textAlign: TextAlign.center,
                  ),
                  couleur: Colors.grey,
                )
                //Description de l'application
                //Les 3 derniers match
                //Les stats
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // This is all you need!
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: 'Programme',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_basketball),
              label: 'Match',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events),
              label: 'Classement',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.network_wifi),
              label: 'Découvrer',
            ),
          ],
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
