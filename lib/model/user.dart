class User {
  int id;
  String username;
  List<String> roles;
  String prenom;
  String nom;
  //List<Recontre> _rencontres;
  //List<Programme> _programmes;

  User(this.id, this.username, this.roles, this.prenom, this.nom);

  ///Créer un User en fonction d'un Json
  static User fromJson(Map<String, dynamic> json) {
    return User(json["id"], json["username"],
        List<String>.from(json["roles"] as List), json["prenom"], json["nom"]);
  }

  ///Pour le debug
  @override
  String toString() {
    return "$id, $username, $roles, $prenom, $nom ";
  }
}
