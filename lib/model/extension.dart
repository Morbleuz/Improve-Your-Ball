import 'package:flutter_improve_your_ball/model/rencontre.dart';
import 'package:flutter_improve_your_ball/model/user.dart';

extension StringExtension on String? {
  bool isInt() {
    if (this is String) {
      String s = toString();
      try {
        int i = int.parse(s);
        return true;
      } catch (e) {
        return false;
      }
    }
    return false;
  }
}

extension ListRencontre on List<Rencontre> {
  int getSumTroisPoints() {
    if (isEmpty) {
      return 0;
    }
    int sum = 0;
    for (Rencontre r in this) {
      sum += r.nombreTroisPoints;
    }
    return (sum / length).toInt();
  }

  int getSumDeuxPoints() {
    if (isEmpty) {
      return 0;
    }
    int sum = 0;
    for (Rencontre r in this) {
      sum += r.nombreDeuxPoint;
    }
    return (sum / length).toInt();
  }

  int getSumVictoire() {
    if (isEmpty) {
      return 0;
    }
    int sum = 0;
    for (Rencontre r in this) {
      r.gagner ? sum++ : null;
    }
    return sum;
  }
}

extension ListUser on List<User> {
  List<User> orderByTroisPoint() {
    List<User> usersTrie = [];
    int initLongueur = length;
    while (usersTrie.length < initLongueur) {
      //On récupérère le 0
      User userMax = this[0];
      //On cherche le min
      for (int x = 0; x < length; x++) {
        if (this[x].rencontres.getSumTroisPoints() >
            userMax.rencontres.getSumTroisPoints()) {
          userMax = this[x];
        }
      }
      //On le supprime
      remove(userMax);
      //On l'ajoute à liste trie
      usersTrie.add(userMax);
    }
    return usersTrie;
  }

  List<User> orderByDeuxPoint() {
    List<User> usersTrie = [];
    int initLongueur = length;
    while (usersTrie.length < initLongueur) {
      //On récupérère le 0
      User userMax = this[0];
      //On cherche le min
      for (int x = 0; x < length; x++) {
        if (this[x].rencontres.getSumDeuxPoints() >
            userMax.rencontres.getSumDeuxPoints()) {
          userMax = this[x];
        }
      }
      //On le supprime
      remove(userMax);
      //On l'ajoute à liste trie
      usersTrie.add(userMax);
    }
    return usersTrie;
  }

  List<User> orderByVictoire() {
    List<User> usersTrie = [];
    int initLongueur = length;
    while (usersTrie.length < initLongueur) {
      //On récupérère le 0
      User userMax = this[0];
      //On cherche le min
      for (int x = 0; x < length; x++) {
        if (this[x].rencontres.getSumVictoire() >
            userMax.rencontres.getSumVictoire()) {
          userMax = this[x];
        }
      }
      //On le supprime
      remove(userMax);
      //On l'ajoute à liste trie
      usersTrie.add(userMax);
    }
    return usersTrie;
  }
}
