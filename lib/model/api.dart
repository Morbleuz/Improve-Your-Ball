import 'dart:convert';
import 'package:flutter_improve_your_ball/model/DTO/userUpdate.dart';
import 'package:flutter_improve_your_ball/model/constant.dart';
import 'package:flutter_improve_your_ball/model/local.dart';
import 'package:flutter_improve_your_ball/model/rencontre.dart';
import 'package:flutter_improve_your_ball/model/user.dart';
import 'package:http/http.dart' as http;

class API {
  static int? responseCode;

  ///Récupération du token sur l'API en fonction du Username et du Password
  static Future<void> recupToken(String username, String password) async {
    try {
      final reponse = await http.post(
        Uri.parse(Constant.url + Constant.urlToken),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          <String, String>{'username': username, 'password': password},
        ),
      );
      responseCode = reponse.statusCode;
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
        .get(Uri.parse(Constant.url + Constant.urlGetAllUser), headers: {
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
    return users;
  }

  ///Retourne un User avec ses informations en fonction de son Username
  static Future<User> getUserWithUsername(String username) async {
    List<User> users = await getAllUser();
    List<User> usersTrie = [];
    for (User u in users) {
      if (u.username == username) {
        usersTrie.add(u);
      }
    }
    return usersTrie.first;
  }

  static Future<void> updateUser(int id, UserUpdate user) async {
    print(id);
    final response = await http.patch(
      Uri.parse(Constant.url + Constant.urlUser + "/" + id.toString()),
      headers: {
        'Content-Type': 'application/merge-patch+json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Local.localToken}',
      },
      body: jsonEncode({"prenom": user.prenom, "nom": user.nom}),
    );
    responseCode = response.statusCode;
  }

  ///Envoie une rencontre
  static Future<void> sendRencontre(Rencontre rencontre) async {
    var user = await getUserWithUsername(Local.LocalUsername);
    final response = await http.post(
      Uri.parse(Constant.url + Constant.urlPostRencontre),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Local.localToken}',
      },
      body: jsonEncode({
        'nombreDeuxPoints': rencontre.nombreDeuxPoint,
        'nombreTroisPoints': rencontre.nombreTroisPoints,
        'nombreRebonds': rencontre.nombreRebonds,
        'minuteJouer': rencontre.minuteJouer,
        'gagner': rencontre.gagner,
        'nombreDeFautes': rencontre.nombreDeFautes,
        'user': '/api/users/${user.id}'
      }),
    );
  }

  static Future<void> sendUser(
      String username, String password, String prenom, String nom) async {
    final response = await http.post(
      Uri.parse(Constant.url + Constant.urlPostUser),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        'username': username,
        'password': password,
        'prenom': prenom,
        'nom': nom,
        'roles': ['ROLE_USER']
      }),
    );

    responseCode = response.statusCode;
  }

  static String getMessage() {
    switch (responseCode) {
      case 200:
        return "Succès";
      case 401:
        return "Non autorisé";
      case 403:
        return "Base Request";
      case 404:
        return "Not Found";
      default:
        return "Code non connu : $responseCode";
    }
  }
}
