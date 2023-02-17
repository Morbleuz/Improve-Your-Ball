class Rencontre {
  int id;
  int nombreDeuxPoint;
  int nombreTroisPoint;
  int nombreRebonds;
  int minuteJouer;
  bool gagner;
  int nombreDeFautes;

  Rencontre(this.id, this.nombreDeuxPoint, this.nombreTroisPoint,
      this.nombreRebonds, this.minuteJouer, this.gagner, this.nombreDeFautes);

  ///Créer une Rencontre en fonction d'un Json
  ///TODO
  /*
  static Rencontre fromJson(Map<String, dynamic> json) {
    return Rencontre(json["id"], json["nombreDeuxPoints"],
        List<String>.from(json["roles"] as List), json["prenom"], json["nom"]);
  }
  */

  @override
  String toString() {
    return "id : $id, nbDeuxPoints : $nombreDeuxPoint, nbTroisPoints : $nombreTroisPoint, nbRebonds : $nombreRebonds, minuteJouer : $minuteJouer, gagner : $gagner, nombreDeFautes : $nombreDeFautes";
  }
}
