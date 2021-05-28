import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fl_chart/fl_chart.dart';
import 'package:pa3/pages/Success.dart';
import 'package:pa3/LineTitles.dart';

class CasesDeaths extends StatelessWidget{
  final Map<String, String> arguments;
  CasesDeaths(this.arguments);

  Future<List> futureAlbum = fetchAlbum();
  List<Map<String, dynamic>> countryData = [];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Center(
          child:
          FutureBuilder<List>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if(snapshot.hasData){
                for(int i =0;i<28;i+=4){
                  Map<String, dynamic> temp = {
                    'country' : snapshot.data[0].casesT[i],
                    'totalC': snapshot.data[0].casesT[i+1],
                    'dailyC': snapshot.data[0].casesT[i+2],
                    'totalD' : snapshot.data[0].casesT[i+3]
                  };
                  countryData.add(temp);
                }
                List<Map<String, dynamic>> scountryData = new List<Map<String, dynamic>>.from(countryData);
                scountryData.sort((a,b) => -a['totalD'].compareTo(b['totalD']));
                for(int i = 0 ; i<scountryData.length ; i++) {
                  if (scountryData[i]['totalC'] == 0) scountryData[i]['totalC'] = 'null';
                  if (scountryData[i]['dailyC'] == 0) scountryData[i]['dailyC'] = 'null';
                  if (scountryData[i]['totalD'] == 0) scountryData[i]['totalD'] = 'null';
                  if (countryData[i]['totalC'] == 0) countryData[i]['totalC'] = 'null';
                  if (countryData[i]['dailyC'] == 0) countryData[i]['dailyC'] = 'null';
                  if (countryData[i]['totalD'] == 0) countryData[i]['totalD'] = 'null';
                }
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
                                Text("Total Cases."),
                                //Text(snapshot.data[0] + '\n'),
                                Text(snapshot.data[0].totalCases.toString() + " cases\n"),
                                Text("Total Deaths"),
                                //Text(snapshot.data[0] + '\n'),
                                Text(snapshot.data[0].totalDeaths.toString() + " deaths"),

                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text("Parsed latest date"),
                                //Text(snapshot.data[0] + '\n'),
                                Text(snapshot.data[0].recentDate + '\n'),
                                Text('Daily Cases'),
                                //Text(snapshot.data[0] + '\n'),
                                Text(snapshot.data[0].newCases.toString() + " cases"),
                              ],
                            ),
                          ],
                        )
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 1, top: 1),
                      margin: EdgeInsets.only(top:10),
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color:Colors.black26,
                            width: 5,
                          )
                      ),

                      child: DefaultTabController(
                        length: 4,
                        child: Builder(
                          builder: (BuildContext context) {
                            final TabController tabController = DefaultTabController.of(context);
                            return Column(
                              children: [
                                TabBar(
                                  tabs: [
                                    Tab(child: Text('Graph1',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent,)),
                                    ),
                                    Tab(child: Text('Graph2',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent,)),
                                    ),
                                    Tab(child: Text('Graph3',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent,)),
                                    ),
                                    Tab(child: Text('Graph4',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent,)),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                        color: Colors.black26,
                                        width: 5,
                                      ),
                                    ),
                                  ),
                                  child: TabBarView(
                                    children: <Widget>[
                                    Container(
                                    padding: EdgeInsets.only(
                                    left: 10,
                                    top: 10,
                                    right: 20,
                                  ),
                                  height:200,
                                  width: 350,
                                        child: LineChart(
                                          LineChartData(
                                              titlesData: LineTitles.getTitleData5(snapshot.data),
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
                                                      FlSpot(0,snapshot.data[6].totalCases.toDouble()),
                                                      FlSpot(1,snapshot.data[5].totalCases.toDouble()),
                                                      FlSpot(2,snapshot.data[4].totalCases.toDouble()),
                                                      FlSpot(3,snapshot.data[3].totalCases.toDouble()),
                                                      FlSpot(4,snapshot.data[2].totalCases.toDouble()),
                                                      FlSpot(5,snapshot.data[1].totalCases.toDouble()),
                                                      FlSpot(6,snapshot.data[0].totalCases.toDouble()),
                                                    ]
                                                )
                                              ]
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                          left: 30,
                                          top: 10,
                                          right: 20,
                                        ),
                                        height:200,
                                        width: 350,
                                        child: LineChart(
                                          LineChartData(
                                              titlesData: LineTitles.getTitleData6(snapshot.data),
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
                                                      FlSpot(0,snapshot.data[6].newCases.toDouble()),
                                                      FlSpot(1,snapshot.data[5].newCases.toDouble()),
                                                      FlSpot(2,snapshot.data[4].newCases.toDouble()),
                                                      FlSpot(3,snapshot.data[3].newCases.toDouble()),
                                                      FlSpot(4,snapshot.data[2].newCases.toDouble()),
                                                      FlSpot(5,snapshot.data[1].newCases.toDouble()),
                                                      FlSpot(6,snapshot.data[0].newCases.toDouble()),
                                                    ]
                                                )
                                              ]
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                          left: 30,
                                          top: 10,
                                          right: 20,
                                        ),
                                        height:200,
                                        width: 350,
                                        child: LineChart(
                                          LineChartData(
                                              titlesData: LineTitles.getTitleData7(snapshot.data),
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
                                                      FlSpot(0,snapshot.data[27].totalCases.toDouble()),
                                                      FlSpot(1,snapshot.data[26].totalCases.toDouble()),
                                                      FlSpot(2,snapshot.data[25].totalCases.toDouble()),
                                                      FlSpot(3,snapshot.data[24].totalCases.toDouble()),
                                                      FlSpot(4,snapshot.data[23].totalCases.toDouble()),
                                                      FlSpot(5,snapshot.data[22].totalCases.toDouble()),
                                                      FlSpot(6,snapshot.data[21].totalCases.toDouble()),
                                                      FlSpot(7,snapshot.data[20].totalCases.toDouble()),
                                                      FlSpot(8,snapshot.data[19].totalCases.toDouble()),
                                                      FlSpot(9,snapshot.data[18].totalCases.toDouble()),
                                                      FlSpot(10,snapshot.data[17].totalCases.toDouble()),
                                                      FlSpot(11,snapshot.data[16].totalCases.toDouble()),
                                                      FlSpot(12,snapshot.data[15].totalCases.toDouble()),
                                                      FlSpot(13,snapshot.data[14].totalCases.toDouble()),
                                                      FlSpot(14,snapshot.data[13].totalCases.toDouble()),
                                                      FlSpot(15,snapshot.data[12].totalCases.toDouble()),
                                                      FlSpot(16,snapshot.data[11].totalCases.toDouble()),
                                                      FlSpot(17,snapshot.data[10].totalCases.toDouble()),
                                                      FlSpot(18,snapshot.data[9].totalCases.toDouble()),
                                                      FlSpot(19,snapshot.data[8].totalCases.toDouble()),
                                                      FlSpot(20,snapshot.data[7].totalCases.toDouble()),
                                                      FlSpot(21,snapshot.data[6].totalCases.toDouble()),
                                                      FlSpot(22,snapshot.data[5].totalCases.toDouble()),
                                                      FlSpot(23,snapshot.data[4].totalCases.toDouble()),
                                                      FlSpot(24,snapshot.data[3].totalCases.toDouble()),
                                                      FlSpot(25,snapshot.data[2].totalCases.toDouble()),
                                                      FlSpot(26,snapshot.data[1].totalCases.toDouble()),
                                                      FlSpot(27,snapshot.data[0].totalCases.toDouble()),
                                                    ]
                                                )
                                              ]
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                          left: 30,
                                          top: 10,
                                          right: 20,
                                        ),
                                        height:200,
                                        width: 350,
                                        child: LineChart(
                                          LineChartData(
                                              titlesData: LineTitles.getTitleData8(snapshot.data),
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
                                                      FlSpot(0,snapshot.data[27].newCases.toDouble()),
                                                      FlSpot(1,snapshot.data[26].newCases.toDouble()),
                                                      FlSpot(2,snapshot.data[25].newCases.toDouble()),
                                                      FlSpot(3,snapshot.data[24].newCases.toDouble()),
                                                      FlSpot(4,snapshot.data[23].newCases.toDouble()),
                                                      FlSpot(5,snapshot.data[22].newCases.toDouble()),
                                                      FlSpot(6,snapshot.data[21].newCases.toDouble()),
                                                      FlSpot(7,snapshot.data[20].newCases.toDouble()),
                                                      FlSpot(8,snapshot.data[19].newCases.toDouble()),
                                                      FlSpot(9,snapshot.data[18].newCases.toDouble()),
                                                      FlSpot(10,snapshot.data[17].newCases.toDouble()),
                                                      FlSpot(11,snapshot.data[16].newCases.toDouble()),
                                                      FlSpot(12,snapshot.data[15].newCases.toDouble()),
                                                      FlSpot(13,snapshot.data[14].newCases.toDouble()),
                                                      FlSpot(14,snapshot.data[13].newCases.toDouble()),
                                                      FlSpot(15,snapshot.data[12].newCases.toDouble()),
                                                      FlSpot(16,snapshot.data[11].newCases.toDouble()),
                                                      FlSpot(17,snapshot.data[10].newCases.toDouble()),
                                                      FlSpot(18,snapshot.data[9].newCases.toDouble()),
                                                      FlSpot(19,snapshot.data[8].newCases.toDouble()),
                                                      FlSpot(20,snapshot.data[7].newCases.toDouble()),
                                                      FlSpot(21,snapshot.data[6].newCases.toDouble()),
                                                      FlSpot(22,snapshot.data[5].newCases.toDouble()),
                                                      FlSpot(23,snapshot.data[4].newCases.toDouble()),
                                                      FlSpot(24,snapshot.data[3].newCases.toDouble()),
                                                      FlSpot(25,snapshot.data[2].newCases.toDouble()),
                                                      FlSpot(26,snapshot.data[1].newCases.toDouble()),
                                                      FlSpot(27,snapshot.data[0].newCases.toDouble()),
                                                    ]
                                                )
                                              ]
                                          ),
                                        ),
                                      ),
                                    ],
                                    controller: tabController,
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 1, top: 1),
                      margin: EdgeInsets.only(top:10),
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color:Colors.black26,
                            width: 5,
                          )
                      ),

                      child: DefaultTabController(
                        length: 2,
                        child: Builder(
                          builder: (BuildContext context) {
                            final TabController tabController = DefaultTabController.of(context);
                            return Column(
                              children: [
                                TabBar(
                                  tabs: [
                                    Tab(child: Text('Country_name',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent,)),
                                    ),
                                    Tab(child: Text('Total_vacc',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent,)),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                        color: Colors.black26,
                                        width: 5,
                                      ),
                                    ),
                                  ),
                                  child: TabBarView(
                                    children: [
                                      SingleChildScrollView(
                                        child:
                                        DataTable(
                                            columnSpacing: 7,
                                            columns:[
                                              DataColumn(label:Text(
                                                  'Country',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                  )
                                                ),
                                              ),
                                              DataColumn(label:Text('Total Cases',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  )
                                              )),
                                              DataColumn(label:Text('Daily Cases',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ))),
                                              DataColumn(label:Text('Total Deaths',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ))),
                                            ],
                                            rows: [
                                              DataRow(
                                                  cells:[
                                                    DataCell(Text(countryData[0]['country'])),
                                                    DataCell(Text(countryData[0]['totalC'].toString())),
                                                    DataCell(Text(countryData[0]['dailyC'].toString())),
                                                    DataCell(Text(countryData[0]['totalD'].toString())),
                                                  ]
                                              ),
                                              DataRow(
                                                  cells:[
                                                    DataCell(Text(countryData[1]['country'])),
                                                    DataCell(Text(countryData[1]['totalC'].toString())),
                                                    DataCell(Text(countryData[1]['dailyC'].toString())),
                                                    DataCell(Text(countryData[1]['totalD'].toString())),
                                                  ]
                                              ),
                                              DataRow(
                                                  cells:[
                                                    DataCell(Text(countryData[2]['country'])),
                                                    DataCell(Text(countryData[2]['totalC'].toString())),
                                                    DataCell(Text(countryData[2]['dailyC'].toString())),
                                                    DataCell(Text(countryData[2]['totalD'].toString())),
                                                  ]
                                              ),
                                              DataRow(
                                                  cells:[
                                                    DataCell(Text(countryData[3]['country'])),
                                                    DataCell(Text(countryData[3]['totalC'].toString())),
                                                    DataCell(Text(countryData[3]['dailyC'].toString())),
                                                    DataCell(Text(countryData[3]['totalD'].toString())),
                                                  ]
                                              ),
                                              DataRow(
                                                  cells:[
                                                    DataCell(Text(countryData[4]['country'])),
                                                    DataCell(Text(countryData[4]['totalC'].toString())),
                                                    DataCell(Text(countryData[4]['dailyC'].toString())),
                                                    DataCell(Text(countryData[4]['totalD'].toString())),
                                                  ]
                                              ),
                                              DataRow(
                                                  cells:[
                                                    DataCell(Text(countryData[5]['country'])),
                                                    DataCell(Text(countryData[5]['totalC'].toString())),
                                                    DataCell(Text(countryData[5]['dailyC'].toString())),
                                                    DataCell(Text(countryData[5]['totalD'].toString())),
                                                  ]
                                              ),
                                              DataRow(
                                                  cells:[
                                                    DataCell(Text(countryData[6]['country'])),
                                                    DataCell(Text(countryData[6]['totalC'].toString())),
                                                    DataCell(Text(countryData[6]['dailyC'].toString())),
                                                    DataCell(Text(countryData[6]['totalD'].toString())),
                                                  ]
                                              ),
                                            ]
                                        ),
                                      ),
                                      SingleChildScrollView(
                                        child:
                                        DataTable(
                                            columnSpacing: 7,
                                            columns:[
                                              DataColumn(label:Text(
                                                  'Country',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  )
                                              ),
                                              ),
                                              DataColumn(label:Text('Total Cases',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  )
                                              )),
                                              DataColumn(label:Text('Daily Cases',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ))),
                                              DataColumn(label:Text('Total Deaths',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ))),
                                            ],
                                            rows: [
                                              DataRow(
                                                  cells:[
                                                    DataCell(Text(scountryData[0]['country'])),
                                                    DataCell(Text(scountryData[0]['totalC'].toString())),
                                                    DataCell(Text(scountryData[0]['dailyC'].toString())),
                                                    DataCell(Text(scountryData[0]['totalD'].toString())),
                                                  ]
                                              ),
                                              DataRow(
                                                  cells:[
                                                    DataCell(Text(scountryData[1]['country'])),
                                                    DataCell(Text(scountryData[1]['totalC'].toString())),
                                                    DataCell(Text(scountryData[1]['dailyC'].toString())),
                                                    DataCell(Text(scountryData[1]['totalD'].toString())),
                                                  ]
                                              ),
                                              DataRow(
                                                  cells:[
                                                    DataCell(Text(scountryData[2]['country'])),
                                                    DataCell(Text(scountryData[2]['totalC'].toString())),
                                                    DataCell(Text(scountryData[2]['dailyC'].toString())),
                                                    DataCell(Text(scountryData[2]['totalD'].toString())),
                                                  ]
                                              ),
                                              DataRow(
                                                  cells:[
                                                    DataCell(Text(scountryData[3]['country'])),
                                                    DataCell(Text(scountryData[3]['totalC'].toString())),
                                                    DataCell(Text(scountryData[3]['dailyC'].toString())),
                                                    DataCell(Text(scountryData[3]['totalD'].toString())),
                                                  ]
                                              ),
                                              DataRow(
                                                  cells:[
                                                    DataCell(Text(scountryData[4]['country'])),
                                                    DataCell(Text(scountryData[4]['totalC'].toString())),
                                                    DataCell(Text(scountryData[4]['dailyC'].toString())),
                                                    DataCell(Text(scountryData[4]['totalD'].toString())),
                                                  ]
                                              ),
                                              DataRow(
                                                  cells:[
                                                    DataCell(Text(scountryData[5]['country'])),
                                                    DataCell(Text(scountryData[5]['totalC'].toString())),
                                                    DataCell(Text(scountryData[5]['dailyC'].toString())),
                                                    DataCell(Text(scountryData[5]['totalD'].toString())),
                                                  ]
                                              ),
                                              DataRow(
                                                  cells:[
                                                    DataCell(Text(scountryData[6]['country'])),
                                                    DataCell(Text(scountryData[6]['totalC'].toString())),
                                                    DataCell(Text(scountryData[6]['dailyC'].toString())),
                                                    DataCell(Text(scountryData[6]['totalD'].toString())),
                                                  ]
                                              ),
                                            ]
                                        ),
                                      ),
                                    ],
                                    controller: tabController,
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              }else if(snapshot.hasError){
                print(snapshot.error);
              }
              return CircularProgressIndicator();
            }
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(
              context,
              '/success/menu',
              arguments: {'user' : arguments['user'],
                'previous' : 'Cases/Deaths Page'}
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
  await http.get(Uri.https('covid.ourworldindata.org','/data/owid-covid-data.json'));
  List whole= [];
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
  final int totalCases;
  final int totalDeaths;
  final int newCases;
  final List casesT;

  Album({@required this.recentDate, @required this.totalCases,
    @required this.totalDeaths, @required this.newCases,
    @required this.casesT});

  factory Album.fromJson(Map<String, dynamic> json, int count){
    String recent = '';
    double tCases= 0;
    double tDeaths = 0;
    double nCases = 0;
    List table = [];
    List countries = [];
    recent = json['KOR']['data'][json['KOR']['data'].length-count]['date'];
    json.forEach((k,v) => countries.add(k));

    List<String> recentSplit = recent.split('-');
    int recentYear = int.parse(recentSplit[0]);
    int recentMonth = int.parse(recentSplit[1]);
    int recentDay = int.parse(recentSplit[2]);

    for(String i in countries){
      table.add(i);
      double ttc = 0;
      double tnc = 0;
      double ttd = 0;
      int last = json[i]['data'].length-1;
      List<String> temp = json[i]['data'][last]['date'].split('-');
      int tempYear = int.parse(temp[0]);
      int tempMonth = int.parse(temp[1]);
      int tempDay = int.parse(temp[2]);
      if(json[i]['data'][last]['date'] == recent){
        if(json[i]['data'][last].containsKey('total_cases')){
          tCases += json[i]['data'][last]['total_cases'];
          ttc = json[i]['data'][last]['total_cases'];
        }
        else if(last-1 >=0 && json[i]['data'][last-1].containsKey('total_cases')){
          tCases += json[i]['data'][last-1]['total_cases'];
          ttc = json[i]['data'][last-1]['total_cases'];
        }
        if(json[i]['data'][last].containsKey('total_deaths')){
          tDeaths += json[i]['data'][last]['total_deaths'];
          ttd = json[i]['data'][last]['total_deaths'];
        }
        else if(last-1 >=0 && json[i]['data'][last-1].containsKey('total_deaths')){
          tDeaths += json[i]['data'][last-1]['total_deaths'];
          ttd = json[i]['data'][last-1]['total_deaths'];
        }
        if(json[i]['data'][last].containsKey('new_cases')){
          nCases += json[i]['data'][last]['new_cases'];
          tnc = json[i]['data'][last]['new_cases'];
        }
        else if(last-1 >=0 && json[i]['data'][last-1].containsKey('new_cases')){
          nCases += json[i]['data'][last-1]['new_cases'];
          tnc = json[i]['data'][last-1]['new_cases'];
        }
      }
      else if((recentYear == tempYear && recentMonth == tempMonth && recentDay < tempDay) ||
          (recentYear == tempYear && recentMonth < tempMonth) ||
          (recentYear < tempYear)){
        for(int j = last ; j >= 0; j--){
          if(json[i]['data'][j]['date'] == recent){
            if(json[i]['data'][j].containsKey('total_cases')){
              tCases += json[i]['data'][j]['total_cases'];
              ttc = json[i]['data'][j]['total_cases'];
            }
            else if(j-1 >=0 && json[i]['data'][j-1].containsKey('total_cases')){
              tCases += json[i]['data'][j-1]['total_cases'];
              ttc = json[i]['data'][j-1]['total_cases'];
            }
            if(json[i]['data'][j].containsKey('total_deaths')){
              tDeaths += json[i]['data'][j]['total_deaths'];
              ttd = json[i]['data'][j]['total_deaths'];
            }
            else if(j-1 >=0 && json[i]['data'][j-1].containsKey('total_deaths')){
              tDeaths += json[i]['data'][j-1]['total_deaths'];
              ttd = json[i]['data'][j-1]['total_deaths'];
            }
            if(json[i]['data'][j].containsKey('new_cases')){
              nCases += json[i]['data'][j]['new_cases'];
              tnc = json[i]['data'][j]['new_cases'];
            }
            else if(j-1 >=0 && json[i]['data'][j-1].containsKey('new_cases')){
              nCases += json[i]['data'][j-1]['new_cases'];
              tnc = json[i]['data'][j-1]['new_cases'];
            }
            break;
          }
        }
      }
      else if((recentYear == tempYear && recentMonth == tempMonth && recentDay > tempDay) ||
          (recentYear == tempYear && recentMonth > tempMonth) ||
          (recentYear > tempYear)){
        if(json[i]['data'][last].containsKey('total_cases')){
          tCases += json[i]['data'][last]['total_cases'];
          ttc = json[i]['data'][last]['total_cases'];
        }
        else if(last-1 >=0 && json[i]['data'][last-1].containsKey('total_cases')){
          tCases += json[i]['data'][last-1]['total_cases'];
          ttc = json[i]['data'][last-1]['total_cases'];
        }
        if(json[i]['data'][last].containsKey('total_deaths')){
          tDeaths += json[i]['data'][last]['total_deaths'];
          ttd = json[i]['data'][last]['total_deaths'];
        }
        else if(last-1 >=0 && json[i]['data'][last-1].containsKey('total_deaths')){
          tDeaths += json[i]['data'][last-1]['total_deaths'];
          ttd = json[i]['data'][last-1]['total_deaths'];
        }
        if(json[i]['data'][last].containsKey('new_cases')){
          nCases += json[i]['data'][last]['new_cases'];
          tnc = json[i]['data'][last]['new_cases'];
        }
        else if(last-1 >=0 && json[i]['data'][last-1].containsKey('new_cases')){
          nCases += json[i]['data'][last-1]['new_cases'];
          tnc = json[i]['data'][last-1]['new_cases'];
        }
      }

      table.add(ttc.round());
      table.add(tnc.round());
      table.add(ttd.round());
    }

    return Album(
      recentDate: recent,
      totalCases: tCases.round(),
      totalDeaths: tDeaths.round(),
      newCases : nCases.round(),
      casesT: table,
    );
  }
}
