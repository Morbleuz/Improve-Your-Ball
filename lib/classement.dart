import 'package:flutter/material.dart';
import 'package:flutter_improve_your_ball/modelView/appbarIYP.dart';
import 'package:flutter_improve_your_ball/modelView/containerUser.dart';

import 'model/api.dart';
import 'model/user.dart';

class ClassementTroisPoints extends StatefulWidget {
  const ClassementTroisPoints({super.key});

  @override
  State<StatefulWidget> createState() => _ClassementTroisPoints();
}

class _ClassementTroisPoints extends State<ClassementTroisPoints> {
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
    List<Widget> widget = [];
    for (int x = 0; x < users.length; x++) {
      widget.add(ContainerUser(place: x + 1, user: users[x]));
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
      appBar: AppBarIYP(),
      body: SingleChildScrollView(child: Center(child: page)),
    );
  }
}
