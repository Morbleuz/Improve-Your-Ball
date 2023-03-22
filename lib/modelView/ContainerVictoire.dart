import 'package:flutter/material.dart';
import 'package:flutter_improve_your_ball/model/extension.dart';
import '../model/user.dart';

class ContainerVictoire extends StatelessWidget {
  final int place;
  final User user;

  const ContainerVictoire({
    super.key,
    required this.place,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    MaterialColor couleur;
    if (place == 1) {
      couleur = Colors.yellow;
    } else if (place == 2) {
      couleur = Colors.grey;
    } else if (place == 3) {
      couleur = Colors.brown;
    } else {
      couleur = Colors.blue;
    }
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: MediaQuery.of(context).size.width - 20,
        decoration: BoxDecoration(
          color: couleur,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('#$place'),
                  Text(user.username.toUpperCase()),
                  Text('total : ${user.rencontres.getSumVictoire()}')
                ]),
          ),
        ),
      ),
    );
  }
}
