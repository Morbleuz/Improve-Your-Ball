class Rencontre {
  int id;
  int nombreDeuxPoint;
  int nombreTroisPoints;
  int nombreRebonds;
  int minuteJouer;
  bool gagner;
  int nombreDeFautes;

  Rencontre(this.id, this.nombreDeuxPoint, this.nombreTroisPoints,
      this.nombreRebonds, this.minuteJouer, this.gagner, this.nombreDeFautes);

  ///Créer une Rencontre en fonction d'un Json
  ///TODO

  static Rencontre fromJson(Map<String, dynamic> json) {
    print(json);
    return Rencontre(
        json["id"],
        json["nombreDeuxPoints"],
        json["nombreTroisPoints"],
        json["nombreRebonds"],
        json["minuteJouer"],
        json["gagner"],
        json["nombreDeFautes"]);
  }

  @override
  String toString() {
    return "id : $id, nbDeuxPoints : $nombreDeuxPoint, nbTroisPoints : $nombreTroisPoints, nbRebonds : $nombreRebonds, minuteJouer : $minuteJouer, gagner : $gagner, nombreDeFautes : $nombreDeFautes";
  }
}
