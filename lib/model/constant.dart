///Class permmant de stocker les constants de l'application, les variables qui ne vont pas changer
abstract class Constant {
  static String url = "http://s3-4435.nuage-peda.fr/apiImproveYourBall/public";
  static String urlToken = "/api/authentication_token";
  static String urlGetAllUser = "/api/users?page=1";
  static String urlUser = "/api/users";

  static String urlPostRencontre = "/api/rencontres";
  static String urlPostUser = "/api/users";

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
