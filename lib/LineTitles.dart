import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import "package:intl/intl.dart";

class LineTitles{
  static getTitleData1(List snapshot) => FlTitlesData(
    show : true,
    bottomTitles: SideTitles(
      showTitles: true,
      reservedSize:20,
      getTitles:(value){
        switch (value.toInt()){
          case 0:
            return snapshot[6].recentDate.substring(5, 10);
          case 1:
            return snapshot[5].recentDate.substring(5, 10);
          case 2:
            return snapshot[4].recentDate.substring(5, 10);
          case 3:
            return snapshot[3].recentDate.substring(5, 10);
          case 4:
            return snapshot[2].recentDate.substring(5, 10);
          case 5:
            return snapshot[1].recentDate.substring(5, 10);
          case 6:
            return snapshot[0].recentDate.substring(5, 10);
        }
        return '';
      },
    ),
    leftTitles: SideTitles(
      margin: 20,
      interval: 100000000,
      showTitles: true,
      reservedSize:20,
      getTitles:(value){
          if(value < 1000){ // less than a million
            return value.toString();
          }else if(value >=1000 && value < 1000000){
            value /= 1000;
            return value.toStringAsFixed(1) + 'K';
          }else if(value >= 1000000 && value < 1000000000){
            value /= 1000000;
            return value.toStringAsFixed(1) + 'M';
          }else if(value >= 1000000000 && value < 1000000000000){
            value /= 1000000000;
            return value.toStringAsFixed(1) + 'B';
          }
        },
      ),
    );
  static getTitleData2(List snapshot) => FlTitlesData(
    show : true,
    bottomTitles: SideTitles(
      showTitles: true,
      reservedSize:20,
      getTitles:(value){
        switch (value.toInt()){
          case 0:
            return snapshot[6].recentDate.substring(5, 10);
          case 1:
            return snapshot[5].recentDate.substring(5, 10);
          case 2:
            return snapshot[4].recentDate.substring(5, 10);
          case 3:
            return snapshot[3].recentDate.substring(5, 10);
          case 4:
            return snapshot[2].recentDate.substring(5, 10);
          case 5:
            return snapshot[1].recentDate.substring(5, 10);
          case 6:
            return snapshot[0].recentDate.substring(5, 10);
        }
        return '';
      },
    ),
    leftTitles: SideTitles(
      margin: 20,
      interval: 1000000,
      showTitles: true,
      reservedSize:20,
      getTitles:(value){
        if(value < 1000){ // less than a million
          return value.toString();
        }else if(value >=1000 && value < 1000000){
          value /= 1000;
          return value.toStringAsFixed(1) + 'K';
        }else if(value >= 1000000 && value < 1000000000){
          value /= 1000000;
          return value.toStringAsFixed(1) + 'M';
        }else if(value >= 1000000000 && value < 1000000000000){
          value /= 1000000000;
          return value.toStringAsFixed(1) + 'B';
        }
      },
    ),
  );
  static getTitleData3(List snapshot) => FlTitlesData(
    show : true,
    bottomTitles: SideTitles(
      showTitles: true,
      reservedSize:20,
      getTitles:(value){
        switch (value.toInt()){
          case 0:
            return snapshot[27].recentDate.substring(5, 10);
          case 6:
            return snapshot[20].recentDate.substring(5, 10);
          case 13:
            return snapshot[13].recentDate.substring(5, 10);
          case 20:
            return snapshot[6].recentDate.substring(5, 10);
          case 27:
            return snapshot[0].recentDate.substring(5, 10);
        }
        return '';
      },
    ),
    leftTitles: SideTitles(
      margin: 20,
      interval: 300000000,
      showTitles: true,
      reservedSize:20,
      getTitles:(value){
        if(value < 1000){ // less than a million
          return value.toString();
        }else if(value >=1000 && value < 1000000){
          value /= 1000;
          return value.toStringAsFixed(1) + 'K';
        }else if(value >= 1000000 && value < 1000000000){
          value /= 1000000;
          return value.toStringAsFixed(1) + 'M';
        }else if(value >= 1000000000 && value < 1000000000000){
          value /= 1000000000;
          return value.toStringAsFixed(1) + 'B';
        }
      },
    ),
  );
  static getTitleData4(List snapshot) => FlTitlesData(
    show : true,
    bottomTitles: SideTitles(
      showTitles: true,
      reservedSize:20,
      getTitles:(value){
        switch (value.toInt()){
          case 0:
            return snapshot[27].recentDate.substring(5, 10);
          case 6:
            return snapshot[20].recentDate.substring(5, 10);
          case 13:
            return snapshot[13].recentDate.substring(5, 10);
          case 20:
            return snapshot[6].recentDate.substring(5, 10);
          case 27:
            return snapshot[0].recentDate.substring(5, 10);
        }
        return '';
      },
    ),
    leftTitles: SideTitles(
      margin: 20,
      interval: 8000000,
      showTitles: true,
      reservedSize:20,
      getTitles:(value){
        if(value < 1000){ // less than a million
          return value.toString();
        }else if(value >=1000 && value < 1000000){
          value /= 1000;
          return value.toStringAsFixed(1) + 'K';
        }else if(value >= 1000000 && value < 1000000000){
          value /= 1000000;
          return value.toStringAsFixed(1) + 'M';
        }else if(value >= 1000000000 && value < 1000000000000){
          value /= 1000000000;
          return value.toStringAsFixed(1) + 'B';
        }
      },
    ),
  );
  static getTitleData5(List snapshot) => FlTitlesData(
    show : true,
    bottomTitles: SideTitles(
      showTitles: true,
      reservedSize:20,
      getTitles:(value){
        switch (value.toInt()){
          case 0:
            return snapshot[6].recentDate.substring(5, 10);
          case 1:
            return snapshot[5].recentDate.substring(5, 10);
          case 2:
            return snapshot[4].recentDate.substring(5, 10);
          case 3:
            return snapshot[3].recentDate.substring(5, 10);
          case 4:
            return snapshot[2].recentDate.substring(5, 10);
          case 5:
            return snapshot[1].recentDate.substring(5, 10);
          case 6:
            return snapshot[0].recentDate.substring(5, 10);
        }
        return '';
      },
    ),
    leftTitles: SideTitles(
      margin: 20,
      interval: 2000000,
      showTitles: true,
      reservedSize:20,
      getTitles:(value){
        if(value < 1000){ // less than a million
          return value.toString();
        }else if(value >=1000 && value < 1000000){
          value /= 1000;
          return value.toStringAsFixed(1) + 'K';
        }else if(value >= 1000000 && value < 1000000000){
          value /= 1000000;
          return value.toStringAsFixed(1) + 'M';
        }else if(value >= 1000000000 && value < 1000000000000){
          value /= 1000000000;
          return value.toStringAsFixed(1) + 'B';
        }
      },
    ),
  );
  static getTitleData6(List snapshot) => FlTitlesData(
    show : true,
    bottomTitles: SideTitles(
      showTitles: true,
      reservedSize:20,
      getTitles:(value){
        switch (value.toInt()){
          case 0:
            return snapshot[6].recentDate.substring(5, 10);
          case 1:
            return snapshot[5].recentDate.substring(5, 10);
          case 2:
            return snapshot[4].recentDate.substring(5, 10);
          case 3:
            return snapshot[3].recentDate.substring(5, 10);
          case 4:
            return snapshot[2].recentDate.substring(5, 10);
          case 5:
            return snapshot[1].recentDate.substring(5, 10);
          case 6:
            return snapshot[0].recentDate.substring(5, 10);
        }
        return '';
      },
    ),
    leftTitles: SideTitles(
      margin: 20,
      interval: 100000,
      showTitles: true,
      reservedSize:20,
      getTitles:(value){
        if(value < 1000){ // less than a million
          return value.toString();
        }else if(value >=1000 && value < 1000000){
          value /= 1000;
          return value.toStringAsFixed(1) + 'K';
        }else if(value >= 1000000 && value < 1000000000){
          value /= 1000000;
          return value.toStringAsFixed(1) + 'M';
        }else if(value >= 1000000000 && value < 1000000000000){
          value /= 1000000000;
          return value.toStringAsFixed(1) + 'B';
        }
      },
    ),
  );
  static getTitleData7(List snapshot) => FlTitlesData(
    show : true,
    bottomTitles: SideTitles(
      showTitles: true,
      reservedSize:20,
      getTitles:(value){
        switch (value.toInt()){
          case 0:
            return snapshot[27].recentDate.substring(5, 10);
          case 6:
            return snapshot[20].recentDate.substring(5, 10);
          case 13:
            return snapshot[13].recentDate.substring(5, 10);
          case 20:
            return snapshot[6].recentDate.substring(5, 10);
          case 27:
            return snapshot[0].recentDate.substring(5, 10);
        }
        return '';
      },
    ),
    leftTitles: SideTitles(
      margin: 20,
      interval: 10000000,
      showTitles: true,
      reservedSize:20,
      getTitles:(value){
        if(value < 1000){ // less than a million
          return value.toString();
        }else if(value >=1000 && value < 1000000){
          value /= 1000;
          return value.toStringAsFixed(1) + 'K';
        }else if(value >= 1000000 && value < 1000000000){
          value /= 1000000;
          return value.toStringAsFixed(1) + 'M';
        }else if(value >= 1000000000 && value < 1000000000000){
          value /= 1000000000;
          return value.toStringAsFixed(1) + 'B';
        }
      },
    ),
  );
  static getTitleData8(List snapshot) => FlTitlesData(
    show : true,
    bottomTitles: SideTitles(
      showTitles: true,
      reservedSize:20,
      getTitles:(value){
        switch (value.toInt()){
          case 0:
            return snapshot[27].recentDate.substring(5, 10);
          case 6:
            return snapshot[20].recentDate.substring(5, 10);
          case 13:
            return snapshot[13].recentDate.substring(5, 10);
          case 20:
            return snapshot[6].recentDate.substring(5, 10);
          case 27:
            return snapshot[0].recentDate.substring(5, 10);
        }
        return '';
      },
    ),
    leftTitles: SideTitles(
      margin: 20,
      interval: 100000,
      showTitles: true,
      reservedSize:20,
      getTitles:(value){
        if(value < 1000){ // less than a million
          return value.toString();
        }else if(value >=1000 && value < 1000000){
          value /= 1000;
          return value.toStringAsFixed(1) + 'K';
        }else if(value >= 1000000 && value < 1000000000){
          value /= 1000000;
          return value.toStringAsFixed(1) + 'M';
        }else if(value >= 1000000000 && value < 1000000000000){
          value /= 1000000000;
          return value.toStringAsFixed(1) + 'B';
        }
      },
    ),
  );
}