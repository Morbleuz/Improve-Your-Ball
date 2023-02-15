import 'dart:convert';
import 'package:flutter_improve_your_ball/model/constant.dart';
import 'package:flutter_improve_your_ball/model/local.dart';
import 'package:flutter_improve_your_ball/model/user.dart';
import 'package:http/http.dart' as http;

class API {
  static int? ResponseCode;

  ///Récupération du token sur l'API en fonction du Username et du Password
  static Future<void> recupToken(String username, String password) async {
    String token = "";
    try {
      final reponse = await http.post(
        Uri.parse(Constant.Url + Constant.UrlToken),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          <String, String>{'username': username, 'password': password},
        ),
      );
      ResponseCode = reponse.statusCode;
      if (reponse.statusCode == 200) {
        Local.localToken = jsonDecode(reponse.body)['token'];
      }
    } catch (e) {
      print('Erreur de la récupération du token : $e');
    }
  }

  ///Retourne vrai si la connexion avec l'API est fonctionnel
  static Future<bool> testConnection() async {
    return false;
  }

  ///Retourne la liste de tous les User
  static Future<List<User>> getAllUser() async {
    List<User> users = [];
    final response = await http
        .get(Uri.parse(Constant.Url + Constant.UrlGetAllUser), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Local.localToken}',
    });
    if (response.statusCode == 200) {
      List userList = jsonDecode(response.body);
      for (var u in userList) {
        users.add(User.fromJson(u));
      }
    }
    for (var element in users) {
      print(element.toString());
    }
    return users;
  }

  ///Retourne un User avec ses informations en fonction de son Username
  static Future<User> getUserWithUsername(String username) async {
    List<User> users = await getAllUser();
    List<User> usersTrie = [];
    for (User u in users) {
      if (u.getUsername() == username) {
        usersTrie.add(u);
      }
    }
    return usersTrie.first;
  }

  static String GetMessage() {
    if (ResponseCode == 200) {
      return "Succès";
    }
    if (ResponseCode == 401) {
      return "Non autorisé";
    }
    if (ResponseCode == 403) {
      return "Bad Request";
    }
    if (ResponseCode == 404) {
      return "Not Found";
    }
    return "Code non connu : $ResponseCode";
  }
}
