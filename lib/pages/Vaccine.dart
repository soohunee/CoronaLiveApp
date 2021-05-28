import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fl_chart/fl_chart.dart';
import 'package:pa3/pages/Success.dart';
import 'package:pa3/LineTitles.dart';

class Vaccine extends StatelessWidget{
  final Map<String, String> arguments;
  Vaccine(this.arguments);

  Future<List> futureAlbum = fetchAlbum();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Center(
          child:
            FutureBuilder<List>(
              future: futureAlbum,
              builder: (context, snapshot){
                if(snapshot.hasData){
                  return Column(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(bottom: 1, top: 1),
                            margin: EdgeInsets.only(top:40),
                            width: 350,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color:Colors.black26,
                                  width: 5,
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text("Total Vacc."),
                                    //Text(snapshot.data[0] + '\n'),
                                    Text(snapshot.data[0].totalVacc.toString() + " people\n"),
                                    Text("Total fully Vacc."),
                                    //Text(snapshot.data[0] + '\n'),
                                    Text(snapshot.data[0].totalFullyVacc.toString() + " people"),

                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text("Parsed latest date"),
                                    //Text(snapshot.data[0] + '\n'),
                                    Text(snapshot.data[0].recentDate + '\n'),
                                    Text('Daily Vacc.'),
                                    //Text(snapshot.data[0] + '\n'),
                                    Text(snapshot.data[0].dailyVacc.toString() + " people"),
                                  ],
                                ),
                              ],
                            )
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: 350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10)),
                              border: Border.all(
                                width: 5,
                                color: Colors.black26,
                              )
                          ),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment : MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  TextButton(
                                    child: Text(
                                      "Graph 1",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    child: Text(
                                      "Graph 2",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    child: Text(
                                      "Graph 3",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    child: Text(
                                      "Graph 4",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  top: 10,
                                  right: 20,
                                ),
                                height:200,
                                width: 350,
                                decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                        width: 5,
                                        color: Colors.black26,
                                      )
                                  ),
                                ),
                                child: LineChart(
                                  LineChartData(
                                        minY: 0,
                                        maxY: 9,
                                        //titlesData: LineTitles.getTitleData(snapshot.data),
                                        gridData: FlGridData(
                                        show: true,
                                        drawVerticalLine: false,
                                      ),
                                      borderData: FlBorderData(
                                        show: false,
                                      ),
                                      lineBarsData: [
                                        LineChartBarData(
                                          spots:[
                                            FlSpot(0,snapshot.data[4].totalVacc.toDouble()),
                                            FlSpot(1,snapshot.data[3].totalVacc.toDouble()),
                                            FlSpot(2,snapshot.data[2].totalVacc.toDouble()),
                                            FlSpot(3,snapshot.data[1].totalVacc.toDouble()),
                                            FlSpot(4,snapshot.data[0].totalVacc.toDouble()),
                                          ]
                                        )
                                      ]
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 5),
                            width: 350,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color:Colors.black26,
                                  width: 5,

                                )
                            ),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment : MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    TextButton(
                                      child: Text(
                                        "Total Cases",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      child: Text(
                                        "Total Deaths",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height:200,
                                  width: 350,
                                  decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                          width: 5,
                                          color: Colors.black26,
                                        )
                                    ),
                                  ),
                                  child:Text("sdfsdf"),
                                ),
                              ],
                            )
                        ),
                      ],
                    );
                }else if(snapshot.hasError){
                  return Text(snapshot.error.toString());
                }
                return CircularProgressIndicator();
              },
            ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(
            context,
            '/success/menu',
              arguments: {'user' : arguments['user'],
                'previous' : 'Vaccine Page'}
            );
        },
        backgroundColor: Colors.blue,
        child:Icon(Icons.list),
        tooltip: 'Menu Page',
      ),
    );
  }
}

Future<List> fetchAlbum() async{
  final response=
    await http.get(Uri.https('raw.githubusercontent.com','/owid/covid-19-data/master/public/data/vaccinations/vaccinations.json'));
  List whole = [];
  if (response.statusCode == 200) {
    for(int n = 1;n<29;n++){
      whole.add(Album.fromJson(jsonDecode(response.body), n));
    }
    return whole;
  } else{
    throw Exception('Failed to load album');
  }
}

class Album{
  final String recentDate;
  final int totalVacc;
  final int totalFullyVacc;
  final int dailyVacc;
  Album({@required this.recentDate, @required this.totalVacc,
        @required this.totalFullyVacc, @required this.dailyVacc});

  factory Album.fromJson(List json, int count){
    List korData;
    String recent;
    int tVacc = 0;
    int tfVacc = 0;
    int dVacc = 0;

    for(int i = 0; i < json.length ; i++){
      if (json[i]['country'] == 'South Korea'){
        korData = json[i]['data'];
        recent = korData[korData.length-count]['date'];
        break;
      }
    }
    List<String> recentSplit = recent.split('-');
    int recentYear = int.parse(recentSplit[0]);
    int recentMonth = int.parse(recentSplit[1]);
    int recentDay = int.parse(recentSplit[2]);
    for(int i = 0; i < json.length;i++){
      int last = json[i]['data'].length-1;
      List<String> temp = json[i]['data'][last]['date'].split('-');
      int tempYear = int.parse(temp[0]);
      int tempMonth = int.parse(temp[1]);
      int tempDay = int.parse(temp[2]);
      if(json[i]['data'][last]['date'] == recent){
        if(json[i]['data'][last].containsKey('total_vaccinations')){
          tVacc += json[i]['data'][last]['total_vaccinations'];
        }
        else if(json[i]['data'][last].containsKey('people_vaccinated')){
          tVacc += json[i]['data'][last]['people_vaccinated'];
        }
        else if(json[i]['data'][last].containsKey('people_fully_vaccinated')){
          tVacc += json[i]['data'][last]['people_fully_vaccinated'];
        }
        if(json[i]['data'][last].containsKey('people_fully_vaccinated')){
          tfVacc += json[i]['data'][last]['people_fully_vaccinated'];
        }
        else if(last-1 >=0 && json[i]['data'][last-1].containsKey('people_fully_vaccinated')){
          tfVacc += json[i]['data'][last-1]['people_fully_vaccinated'];
        }
        if(json[i]['data'][last].containsKey('daily_vaccinations')){
          dVacc += json[i]['data'][last]['daily_vaccinations'];
        }
        else if(last-1 >=0 && json[i]['data'][last-1].containsKey('daily_vaccinations')){
          dVacc += json[i]['data'][last-1]['daily_vaccinations'];
        }
      }
      else if((recentYear == tempYear && recentMonth == tempMonth && recentDay < tempDay) ||
          (recentYear == tempYear && recentMonth < tempMonth) ||
          (recentYear < tempYear)){
        for(int j = last ; j >= 0; j--){
          if(json[i]['data'][j]['date'] == recent){
            if(json[i]['data'][j].containsKey('total_vaccinations')){
              tVacc += json[i]['data'][j]['total_vaccinations'];
            }
            else if(json[i]['data'][j].containsKey('people_vaccinated')){
              tVacc += json[i]['data'][j]['people_vaccinated'];
            }
            else if(json[i]['data'][j].containsKey('people_fully_vaccinated')){
              tVacc += json[i]['data'][j]['people_fully_vaccinated'];
            }
            if(json[i]['data'][j].containsKey('people_fully_vaccinated')){
              tfVacc += json[i]['data'][j]['people_fully_vaccinated'];
            }
            else if(j-1 >=0 && json[i]['data'][j-1].containsKey('people_fully_vaccinated')){
              tfVacc += json[i]['data'][j-1]['people_fully_vaccinated'];
            }
            if(json[i]['data'][j].containsKey('daily_vaccinations')){
              dVacc += json[i]['data'][j]['daily_vaccinations'];
            }
            else if(j-1 >=0 && json[i]['data'][j-1].containsKey('daily_vaccinations')){
              dVacc += json[i]['data'][j-1]['daily_vaccinations'];
            }
            break;
          }
        }
      }
      else if((recentYear == tempYear && recentMonth == tempMonth && recentDay > tempDay) ||
          (recentYear == tempYear && recentMonth > tempMonth) ||
          (recentYear > tempYear)){
        if(json[i]['data'][last].containsKey('total_vaccinations')){
          tVacc += json[i]['data'][last]['total_vaccinations'];
        }
        else if(json[i]['data'][last].containsKey('people_vaccinated')){
          tVacc += json[i]['data'][last]['people_vaccinated'];
        }
        else if(json[i]['data'][last].containsKey('people_fully_vaccinated')){
          tVacc += json[i]['data'][last]['people_fully_vaccinated'];
        }
        if(json[i]['data'][last].containsKey('people_fully_vaccinated')){
          tfVacc += json[i]['data'][last]['people_fully_vaccinated'];
        }
        else if(last-1 >=0 && json[i]['data'][last-1].containsKey('people_fully_vaccinated')){
          tfVacc += json[i]['data'][last-1]['people_fully_vaccinated'];
        }
        if(json[i]['data'][last].containsKey('daily_vaccinations')){
          dVacc += json[i]['data'][last]['daily_vaccinations'];
        }
        else if(last-1 >=0 && json[i]['data'][last-1].containsKey('daily_vaccinations')){
          dVacc += json[i]['data'][last-1]['daily_vaccinations'];
        }
      }
    }


    return Album(
      recentDate: recent,
      totalVacc: tVacc,
      totalFullyVacc: tfVacc,
      dailyVacc : dVacc,
    );
  }
}
