///Class permmant de stocker les constants de l'application, les variables qui ne vont pas changer
abstract class Constant {
  static String url = "http://127.0.0.1:8000";
  static String urlToken = "/api/authentication_token";
  static String urlGetAllUser = "/api/users?page=1";
  static String urlUser = "/api/users";

  static String urlPostRencontre = "/api/rencontres";

  ///Regex qui respecte la règle suivant
  ///Le champs doit avoir :
  ///une minuscule
  ///une majuscule
  ///un nombre numérique
  ///un caractère spécial (!@#$%...)
  ///avoir une longueur de 8 au minimun
  static RegExp regexStrongPassword =
      RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");
}
