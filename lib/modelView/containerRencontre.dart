import 'package:flutter/material.dart';
import 'package:flutter_improve_your_ball/model/rencontre.dart';

class ContainerRencontre extends StatelessWidget {
  final Rencontre rencontre;

  const ContainerRencontre({
    super.key,
    required this.rencontre,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: PhysicalModel(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
        elevation: 18,
        shadowColor: Colors.black,
        child: Container(
          width: MediaQuery.of(context).size.width - 20,
          decoration: BoxDecoration(
            color: rencontre.gagner ? Colors.green : Colors.red,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                            "Vous avez marqué ${rencontre.calculNombresPoints()} points"),
                        Text("Nombres de fautes : ${rencontre.nombreDeFautes}"),
                        Text("Nombres de rebonds : ${rencontre.nombreRebonds}"),
                        Text("${rencontre.minuteJouer} minutes de temps de jeu")
                      ],
                    ),
                    const IconButton(
                      onPressed: null,
                      icon: Icon(Icons.delete),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
