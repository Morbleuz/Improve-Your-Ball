import 'package:flutter/material.dart';
import 'package:flutter_improve_your_ball/model/extension.dart';
import 'package:flutter_improve_your_ball/modelView/ContainerDeuxPoints.dart';
import 'package:flutter_improve_your_ball/modelView/ContainerVictoire.dart';
import 'package:flutter_improve_your_ball/modelView/appbarIYP.dart';
import 'package:flutter_improve_your_ball/modelView/ContainerTroisPoint.dart';

import 'model/api.dart';
import 'model/user.dart';

class ClassementTroisPoint extends StatefulWidget {
  const ClassementTroisPoint({super.key});

  @override
  State<StatefulWidget> createState() => _ClassementTroisPoint();
}

class _ClassementTroisPoint extends State<ClassementTroisPoint> {
  var page;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPage();
  }

  ///Pour afficher l'écran de chargement
  void loadDisplay() {
    page = Column(
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

  Future<void> initPage() async {
    setState(() {
      loadDisplay();
    });
    //Récupération des users
    List<User> users = await API.getAllUser();
    users = users.orderByTroisPoint();
    List<Widget> widget = [];
    for (int x = 0; x < users.length; x++) {
      widget.add(ContainerTroisPoint(place: x + 1, user: users[x]));
    }

    page = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarIYP(child: Text("Classement")),
      body: SingleChildScrollView(child: Center(child: page)),
    );
  }
}

class ClassementDeuxPoint extends StatefulWidget {
  const ClassementDeuxPoint({super.key});

  @override
  State<StatefulWidget> createState() => _ClassementDeuxPoint();
}

class _ClassementDeuxPoint extends State<ClassementDeuxPoint> {
  var page;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPage();
  }

  ///Pour afficher l'écran de chargement
  void loadDisplay() {
    page = Column(
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

  Future<void> initPage() async {
    setState(() {
      loadDisplay();
    });
    //Récupération des users
    List<User> users = await API.getAllUser();
    users = users.orderByDeuxPoint();
    List<Widget> widget = [];
    for (int x = 0; x < users.length; x++) {
      widget.add(ContainerDeuxPoint(place: x + 1, user: users[x]));
    }

    page = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarIYP(child: Text("Classement")),
      body: SingleChildScrollView(child: Center(child: page)),
    );
  }
}

class ClassementVictoire extends StatefulWidget {
  const ClassementVictoire({super.key});

  @override
  State<StatefulWidget> createState() => _ClassementVictoire();
}

class _ClassementVictoire extends State<ClassementVictoire> {
  var page;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPage();
  }

  ///Pour afficher l'écran de chargement
  void loadDisplay() {
    page = Column(
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

  Future<void> initPage() async {
    setState(() {
      loadDisplay();
    });
    //Récupération des users
    List<User> users = await API.getAllUser();
    users = users.orderByVictoire();
    List<Widget> widget = [];
    for (int x = 0; x < users.length; x++) {
      widget.add(ContainerVictoire(place: x + 1, user: users[x]));
    }

    page = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarIYP(child: Text("Classement")),
      body: SingleChildScrollView(child: Center(child: page)),
    );
  }
}
