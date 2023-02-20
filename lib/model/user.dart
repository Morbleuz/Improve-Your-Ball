import 'package:flutter_improve_your_ball/model/rencontre.dart';

class User {
  int id;
  String username;
  List<String> roles;
  String prenom;
  String nom;
  List<Rencontre> rencontres;
  //List<Programme> _programmes;

  User(this.id, this.username, this.roles, this.prenom, this.nom,
      this.rencontres);

  ///Créer un User en fonction d'un Json
  static User fromJson(Map<String, dynamic> json) {
    List<Rencontre> recontres = [];
    for (var r in json["rencontres"]) {
      recontres.add(Rencontre.fromJson(r));
    }
    return User(
        json["id"],
        json["username"],
        List<String>.from(json["roles"] as List),
        json["prenom"],
        json["nom"],
        recontres
        //List<Rencontre>.from(json["rencontres"] as List<Rencontre>,),
        );
  }

  ///Pour le debug
  @override
  String toString() {
    return "$id, $username, $roles, $prenom, $nom , $rencontres";
  }
}
