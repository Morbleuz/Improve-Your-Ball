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
    int sum = 0;
    for (Rencontre r in this) {
      sum += r.nombreTroisPoints;
    }
    return (sum / this.length).toInt();
  }
}

extension ListUser on List<User> {
  void classementTroisPoints() {
    List<User> copie = this;
    List<User> usersTrie = [];
    User userMax = this[0];

    for (int x = 0; x < this.length; x++) {
      if (userMax.rencontres.getSumTroisPoints() <
          this[x].rencontres.getSumTroisPoints()) {
        userMax = this[x];
      }
    }
  }
}
