import 'dart:convert';
import 'package:http/http.dart' as http;

class API {
  static Future<String> recupToken(String username, String password) async {
    print('Récupération du token...');
    String token = "";
    try {
      final reponse = await http.post(
        Uri.parse(
            'http://s3-4440.nuage-peda.fr/Inno-v-Anglais/InovApi/public/api/authentication_token'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          <String, String>{'username': username, 'password': password},
        ),
      );
      if (reponse.statusCode == 200) {
        token = jsonDecode(reponse.body)['token'];
      }
    } catch (e) {
      print('Erreur de la récupération du token : $e');
    }

    return token;
  }

  //Retourne vrai si la connexion marche
  static Future<bool> testConnection() async {
    return false;
  }
}
