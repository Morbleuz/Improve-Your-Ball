class User {
  int _id;
  String _username;
  List<String> _roles;
  String _prenom;
  String _nom;
  List<Recontre> _rencontres;
  List<Programme> _programmes;

  User(this._id, this._username, this._roles, this._prenom, this._nom);

  String getUsername() => _username;

  ///Créer un User en fonction d'un Json
  static User fromJson(Map<String, dynamic> json) {
    return User(json["id"], json["username"],
        List<String>.from(json["roles"] as List), json["prenom"], json["nom"]);
  }

  ///Pour le debug
  @override
  String toString() {
    return "$_id, $_username, $_roles, $_prenom, $_nom ";
  }
}
