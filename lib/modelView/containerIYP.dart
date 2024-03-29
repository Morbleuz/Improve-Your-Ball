import 'package:flutter/material.dart';

class ContainerIYP extends StatelessWidget {
  final Text text;
  final Color couleur;

  const ContainerIYP({
    super.key,
    required this.text,
    required this.couleur,
  });

  @override
  Widget build(BuildContext context) {
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
            child: text,
          ),
        ),
      ),
    );
  }
}
