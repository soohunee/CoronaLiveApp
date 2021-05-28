import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineTitles{
  static getTitleData(List snapshot) => FlTitlesData(
    show : true,
    bottomTitles: SideTitles(
      showTitles: true,
      reservedSize:20,
      getTitles:(value){
        switch (value.toInt()){
          case 0:
            return snapshot[0].recentDate.substring(5, 10);
          case 1:
            return snapshot[1].recentDate.substring(5, 10);
          case 2:
            return snapshot[2].recentDate.substring(5, 10);
          case 3:
            return snapshot[3].recentDate.substring(5, 10);
          case 4:
            return snapshot[4].recentDate.substring(5, 10);
        }
        return '';
      },
    ),
    leftTitles: SideTitles(
      showTitles: true,
      reservedSize:20,
      getTitles:(value){
        switch (value.toInt()){
          case 0:
            return toString(snapshot[4].totalVacc);
          case 4:
            return toString(snapshot[2].totalVacc);
          case 9:
            return toString(snapshot[0].totalVacc);
        }
        return '';
        }
      )
    );
}
String toString(int value) {
  const units = <int, String>{
    1000000000: 'B',
    1000000: 'M',
    1000: 'K',
  };
  return units.entries
      .map((e) => '${value ~/ e.key}${e.value}')
      .firstWhere((e) => !e.startsWith('0'), orElse: () => '$value');
}