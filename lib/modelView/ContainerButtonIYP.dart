import 'package:flutter/material.dart';

class ContainerButtonIYP extends StatelessWidget {
  final List<Widget> children;
  final Color couleur;

  const ContainerButtonIYP({
    super.key,
    required this.children,
    required this.couleur,
  });

  @override
  Widget build(BuildContext context) {
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
