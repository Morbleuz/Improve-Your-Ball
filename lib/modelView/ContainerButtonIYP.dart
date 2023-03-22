import 'package:flutter/material.dart';

class ContainerButtonIYP extends StatelessWidget {
  final List<Widget> children;
  final Color couleur;

  const ContainerButtonIYP({
    super.key,
    required this.couleur,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
            color: couleur,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: children,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
