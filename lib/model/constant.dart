///Class permmant de stocker les constants de l'application, les variables qui ne vont pas changer
abstract class Constant {
  static String url = "http://127.0.0.1:8000";
  static String urlToken = "/api/authentication_token";
  static String urlGetAllUser = "/api/users?page=1";
  static String urlPostRencontre = "/api/rencontres";
}
