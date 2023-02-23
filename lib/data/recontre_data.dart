import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_improve_your_ball/model/couleur.dart';
import 'package:flutter_improve_your_ball/model/rencontre.dart';
import 'package:flutter_improve_your_ball/model/user.dart';

///Class pour récupérer des données pour les graphiques
class RencontreData {
  static List<PieChartSectionData> getSection(List<Rencontre> rencontre) {
    int nombreWin = 0;
    int nombrePerdu = 0;
    for (Rencontre r in rencontre) {
      r.gagner ? nombreWin++ : nombrePerdu++;
    }
    PieChartSectionData win = PieChartSectionData(
      value: nombreWin.toDouble(),
      color: Colors.green,
      showTitle: true,
      title: "Win",
    );
    PieChartSectionData loose = PieChartSectionData(
      value: nombrePerdu.toDouble(),
      color: Colors.red,
      showTitle: true,
      title: "Loose",
    );

    return [win, loose];
  }
}
