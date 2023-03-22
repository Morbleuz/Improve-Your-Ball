import 'package:flutter/material.dart';
import 'package:flutter_improve_your_ball/model/extension.dart';

import '../model/user.dart';

class ContainerDeuxPoint extends StatelessWidget {
  final int place;
  final User user;

  const ContainerDeuxPoint({
    super.key,
    required this.place,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    var couleur;
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
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('#$place'),
                  Text(user.username.toUpperCase()),
                  Text('moyenne : ${user.rencontres.getSumDeuxPoints()}')
                ]),
          ),
        ),
      ),
    );
  }
}
