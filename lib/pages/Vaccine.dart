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
  List<Map<String, dynamic>> countryData = [];

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
                  for(int i =0;i<28;i+=4){
                    Map<String, dynamic> temp = {
                      'country' : snapshot.data[0].vaccineT[i],
                      'total': snapshot.data[0].vaccineT[i+1],
                      'fully':snapshot.data[0].vaccineT[i+2],
                      'daily' : snapshot.data[0].vaccineT[i+3]
                    };
                    countryData.add(temp);
                  }
                  List<Map<String, dynamic>> scountryData = new List<Map<String, dynamic>>.from(countryData);
                  scountryData.sort((a,b) => -a['total'].compareTo(b['total']));

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
                                                titlesData: LineTitles.getTitleData1(snapshot.data),
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
                                                  FlSpot(0,snapshot.data[6].totalVacc.toDouble()),
                                                  FlSpot(1,snapshot.data[5].totalVacc.toDouble()),
                                                  FlSpot(2,snapshot.data[4].totalVacc.toDouble()),
                                                  FlSpot(3,snapshot.data[3].totalVacc.toDouble()),
                                                  FlSpot(4,snapshot.data[2].totalVacc.toDouble()),
                                                  FlSpot(5,snapshot.data[1].totalVacc.toDouble()),
                                                  FlSpot(6,snapshot.data[0].totalVacc.toDouble()),
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
                                                  titlesData: LineTitles.getTitleData2(snapshot.data),
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
                                                          FlSpot(0,snapshot.data[6].dailyVacc.toDouble()),
                                                          FlSpot(1,snapshot.data[5].dailyVacc.toDouble()),
                                                          FlSpot(2,snapshot.data[4].dailyVacc.toDouble()),
                                                          FlSpot(3,snapshot.data[3].dailyVacc.toDouble()),
                                                          FlSpot(4,snapshot.data[2].dailyVacc.toDouble()),
                                                          FlSpot(5,snapshot.data[1].dailyVacc.toDouble()),
                                                          FlSpot(6,snapshot.data[0].dailyVacc.toDouble()),
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
                                                  titlesData: LineTitles.getTitleData3(snapshot.data),
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
                                                          FlSpot(0,snapshot.data[27].totalVacc.toDouble()),
                                                          FlSpot(1,snapshot.data[26].totalVacc.toDouble()),
                                                          FlSpot(2,snapshot.data[25].totalVacc.toDouble()),
                                                          FlSpot(3,snapshot.data[24].totalVacc.toDouble()),
                                                          FlSpot(4,snapshot.data[23].totalVacc.toDouble()),
                                                          FlSpot(5,snapshot.data[22].totalVacc.toDouble()),
                                                          FlSpot(6,snapshot.data[21].totalVacc.toDouble()),
                                                          FlSpot(7,snapshot.data[20].totalVacc.toDouble()),
                                                          FlSpot(8,snapshot.data[19].totalVacc.toDouble()),
                                                          FlSpot(9,snapshot.data[18].totalVacc.toDouble()),
                                                          FlSpot(10,snapshot.data[17].totalVacc.toDouble()),
                                                          FlSpot(11,snapshot.data[16].totalVacc.toDouble()),
                                                          FlSpot(12,snapshot.data[15].totalVacc.toDouble()),
                                                          FlSpot(13,snapshot.data[14].totalVacc.toDouble()),
                                                          FlSpot(14,snapshot.data[13].totalVacc.toDouble()),
                                                          FlSpot(15,snapshot.data[12].totalVacc.toDouble()),
                                                          FlSpot(16,snapshot.data[11].totalVacc.toDouble()),
                                                          FlSpot(17,snapshot.data[10].totalVacc.toDouble()),
                                                          FlSpot(18,snapshot.data[9].totalVacc.toDouble()),
                                                          FlSpot(19,snapshot.data[8].totalVacc.toDouble()),
                                                          FlSpot(20,snapshot.data[7].totalVacc.toDouble()),
                                                          FlSpot(21,snapshot.data[6].totalVacc.toDouble()),
                                                          FlSpot(22,snapshot.data[5].totalVacc.toDouble()),
                                                          FlSpot(23,snapshot.data[4].totalVacc.toDouble()),
                                                          FlSpot(24,snapshot.data[3].totalVacc.toDouble()),
                                                          FlSpot(25,snapshot.data[2].totalVacc.toDouble()),
                                                          FlSpot(26,snapshot.data[1].totalVacc.toDouble()),
                                                          FlSpot(27,snapshot.data[0].totalVacc.toDouble()),
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
                                                  titlesData: LineTitles.getTitleData4(snapshot.data),
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
                                                          FlSpot(0,snapshot.data[27].dailyVacc.toDouble()),
                                                          FlSpot(1,snapshot.data[26].dailyVacc.toDouble()),
                                                          FlSpot(2,snapshot.data[25].dailyVacc.toDouble()),
                                                          FlSpot(3,snapshot.data[24].dailyVacc.toDouble()),
                                                          FlSpot(4,snapshot.data[23].dailyVacc.toDouble()),
                                                          FlSpot(5,snapshot.data[22].dailyVacc.toDouble()),
                                                          FlSpot(6,snapshot.data[21].dailyVacc.toDouble()),
                                                          FlSpot(7,snapshot.data[20].dailyVacc.toDouble()),
                                                          FlSpot(8,snapshot.data[19].dailyVacc.toDouble()),
                                                          FlSpot(9,snapshot.data[18].dailyVacc.toDouble()),
                                                          FlSpot(10,snapshot.data[17].dailyVacc.toDouble()),
                                                          FlSpot(11,snapshot.data[16].dailyVacc.toDouble()),
                                                          FlSpot(12,snapshot.data[15].dailyVacc.toDouble()),
                                                          FlSpot(13,snapshot.data[14].dailyVacc.toDouble()),
                                                          FlSpot(14,snapshot.data[13].dailyVacc.toDouble()),
                                                          FlSpot(15,snapshot.data[12].dailyVacc.toDouble()),
                                                          FlSpot(16,snapshot.data[11].dailyVacc.toDouble()),
                                                          FlSpot(17,snapshot.data[10].dailyVacc.toDouble()),
                                                          FlSpot(18,snapshot.data[9].dailyVacc.toDouble()),
                                                          FlSpot(19,snapshot.data[8].dailyVacc.toDouble()),
                                                          FlSpot(20,snapshot.data[7].dailyVacc.toDouble()),
                                                          FlSpot(21,snapshot.data[6].dailyVacc.toDouble()),
                                                          FlSpot(22,snapshot.data[5].dailyVacc.toDouble()),
                                                          FlSpot(23,snapshot.data[4].dailyVacc.toDouble()),
                                                          FlSpot(24,snapshot.data[3].dailyVacc.toDouble()),
                                                          FlSpot(25,snapshot.data[2].dailyVacc.toDouble()),
                                                          FlSpot(26,snapshot.data[1].dailyVacc.toDouble()),
                                                          FlSpot(27,snapshot.data[0].dailyVacc.toDouble()),
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
                                              columnSpacing: 13,
                                                columns:[
                                                  DataColumn(label:Text('Country')),
                                                  DataColumn(label:Text('Total')),
                                                  DataColumn(label:Text('Fully')),
                                                  DataColumn(label:Text('Daily')),
                                                ],
                                                rows: [
                                                  DataRow(
                                                      cells:[
                                                        DataCell(Text(countryData[0]['country'])),
                                                        DataCell(Text(countryData[0]['total'].toString())),
                                                        DataCell(Text(countryData[0]['fully'].toString())),
                                                        DataCell(Text(countryData[0]['daily'].toString())),
                                                      ]
                                                  ),
                                                  DataRow(
                                                      cells:[
                                                        DataCell(Text(countryData[1]['country'])),
                                                        DataCell(Text(countryData[1]['total'].toString())),
                                                        DataCell(Text(countryData[1]['fully'].toString())),
                                                        DataCell(Text(countryData[1]['daily'].toString())),
                                                      ]
                                                  ),
                                                  DataRow(
                                                      cells:[
                                                        DataCell(Text(countryData[2]['country'])),
                                                        DataCell(Text(countryData[2]['total'].toString())),
                                                        DataCell(Text(countryData[2]['fully'].toString())),
                                                        DataCell(Text(countryData[2]['daily'].toString())),
                                                      ]
                                                  ),
                                                  DataRow(
                                                      cells:[
                                                        DataCell(Text(countryData[3]['country'])),
                                                        DataCell(Text(countryData[3]['total'].toString())),
                                                        DataCell(Text(countryData[3]['fully'].toString())),
                                                        DataCell(Text(countryData[3]['daily'].toString())),
                                                      ]
                                                  ),
                                                  DataRow(
                                                      cells:[
                                                        DataCell(Text(countryData[4]['country'])),
                                                        DataCell(Text(countryData[4]['total'].toString())),
                                                        DataCell(Text(countryData[4]['fully'].toString())),
                                                        DataCell(Text(countryData[4]['daily'].toString())),
                                                      ]
                                                  ),
                                                  DataRow(
                                                      cells:[
                                                        DataCell(Text(countryData[5]['country'])),
                                                        DataCell(Text(countryData[5]['total'].toString())),
                                                        DataCell(Text(countryData[5]['fully'].toString())),
                                                        DataCell(Text(countryData[5]['daily'].toString())),
                                                      ]
                                                  ),
                                                  DataRow(
                                                      cells:[
                                                        DataCell(Text(countryData[6]['country'])),
                                                        DataCell(Text(countryData[6]['total'].toString())),
                                                        DataCell(Text(countryData[6]['fully'].toString())),
                                                        DataCell(Text(countryData[6]['daily'].toString())),
                                                      ]
                                                  ),
                                                ]
                                            ),
                                          ),
                                          SingleChildScrollView(
                                            child:
                                            DataTable(
                                                columnSpacing: 13,
                                                columns:[
                                                  DataColumn(label:Text('Country')),
                                                  DataColumn(label:Text('Total')),
                                                  DataColumn(label:Text('Fully')),
                                                  DataColumn(label:Text('Daily')),
                                                ],
                                                rows: [
                                                  DataRow(
                                                      cells:[
                                                        DataCell(Text(scountryData[0]['country'])),
                                                        DataCell(Text(scountryData[0]['total'].toString())),
                                                        DataCell(Text(scountryData[0]['fully'].toString())),
                                                        DataCell(Text(scountryData[0]['daily'].toString())),
                                                      ]
                                                  ),
                                                  DataRow(
                                                      cells:[
                                                        DataCell(Text(scountryData[1]['country'])),
                                                        DataCell(Text(scountryData[1]['total'].toString())),
                                                        DataCell(Text(scountryData[1]['fully'].toString())),
                                                        DataCell(Text(scountryData[1]['daily'].toString())),
                                                      ]
                                                  ),
                                                  DataRow(
                                                      cells:[
                                                        DataCell(Text(scountryData[2]['country'])),
                                                        DataCell(Text(scountryData[2]['total'].toString())),
                                                        DataCell(Text(scountryData[2]['fully'].toString())),
                                                        DataCell(Text(scountryData[2]['daily'].toString())),
                                                      ]
                                                  ),
                                                  DataRow(
                                                      cells:[
                                                        DataCell(Text(scountryData[3]['country'])),
                                                        DataCell(Text(scountryData[3]['total'].toString())),
                                                        DataCell(Text(scountryData[3]['fully'].toString())),
                                                        DataCell(Text(scountryData[3]['daily'].toString())),
                                                      ]
                                                  ),
                                                  DataRow(
                                                      cells:[
                                                        DataCell(Text(scountryData[4]['country'])),
                                                        DataCell(Text(scountryData[4]['total'].toString())),
                                                        DataCell(Text(scountryData[4]['fully'].toString())),
                                                        DataCell(Text(scountryData[4]['daily'].toString())),
                                                      ]
                                                  ),
                                                  DataRow(
                                                      cells:[
                                                        DataCell(Text(scountryData[5]['country'])),
                                                        DataCell(Text(scountryData[5]['total'].toString())),
                                                        DataCell(Text(scountryData[5]['fully'].toString())),
                                                        DataCell(Text(scountryData[5]['daily'].toString())),
                                                      ]
                                                  ),
                                                  DataRow(
                                                      cells:[
                                                        DataCell(Text(scountryData[6]['country'])),
                                                        DataCell(Text(scountryData[6]['total'].toString())),
                                                        DataCell(Text(scountryData[6]['fully'].toString())),
                                                        DataCell(Text(scountryData[6]['daily'].toString())),
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
  final List vaccineT;

  Album({@required this.recentDate, @required this.totalVacc,
        @required this.totalFullyVacc, @required this.dailyVacc,
        @required this.vaccineT});

  factory Album.fromJson(List json, int count){
    List korData;
    String recent;
    int tVacc = 0;
    int tfVacc = 0;
    int dVacc = 0;
    List table = [];
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
      table.add(json[i]['country']);
      int tableT = 0;
      int tableF = 0;
      int tableD = 0;
      int last = json[i]['data'].length-1;
      List<String> temp = json[i]['data'][last]['date'].split('-');
      int tempYear = int.parse(temp[0]);
      int tempMonth = int.parse(temp[1]);
      int tempDay = int.parse(temp[2]);
      if(json[i]['data'][last]['date'] == recent){
        if(json[i]['data'][last].containsKey('total_vaccinations')){
          tVacc += json[i]['data'][last]['total_vaccinations'];
          tableT = json[i]['data'][last]['total_vaccinations'];
        }
        else if(json[i]['data'][last].containsKey('people_vaccinated')){
          tVacc += json[i]['data'][last]['people_vaccinated'];
        }
        else if(json[i]['data'][last].containsKey('people_fully_vaccinated')){
          tVacc += json[i]['data'][last]['people_fully_vaccinated'];
        }
        if(json[i]['data'][last].containsKey('people_fully_vaccinated')){
          tfVacc += json[i]['data'][last]['people_fully_vaccinated'];
          tableF = json[i]['data'][last]['people_fully_vaccinated'];
        }
        else if(last-1 >=0 && json[i]['data'][last-1].containsKey('people_fully_vaccinated')){
          tfVacc += json[i]['data'][last-1]['people_fully_vaccinated'];
        }
        if(json[i]['data'][last].containsKey('daily_vaccinations')){
          dVacc += json[i]['data'][last]['daily_vaccinations'];
          tableD = json[i]['data'][last]['daily_vaccinations'];
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
              tableT = json[i]['data'][j]['total_vaccinations'];
            }
            else if(json[i]['data'][j].containsKey('people_vaccinated')){
              tVacc += json[i]['data'][j]['people_vaccinated'];
            }
            else if(json[i]['data'][j].containsKey('people_fully_vaccinated')){
              tVacc += json[i]['data'][j]['people_fully_vaccinated'];
            }
            if(json[i]['data'][j].containsKey('people_fully_vaccinated')){
              tfVacc += json[i]['data'][j]['people_fully_vaccinated'];
              tableF = json[i]['data'][j]['people_fully_vaccinated'];
            }
            else if(j-1 >=0 && json[i]['data'][j-1].containsKey('people_fully_vaccinated')){
              tfVacc += json[i]['data'][j-1]['people_fully_vaccinated'];
            }
            if(json[i]['data'][j].containsKey('daily_vaccinations')){
              dVacc += json[i]['data'][j]['daily_vaccinations'];
              tableD = json[i]['data'][j]['daily_vaccinations'];
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
          tableT = json[i]['data'][last]['total_vaccinations'];
        }
        else if(json[i]['data'][last].containsKey('people_vaccinated')){
          tVacc += json[i]['data'][last]['people_vaccinated'];
        }
        else if(json[i]['data'][last].containsKey('people_fully_vaccinated')){
          tVacc += json[i]['data'][last]['people_fully_vaccinated'];
        }
        if(json[i]['data'][last].containsKey('people_fully_vaccinated')){
          tfVacc += json[i]['data'][last]['people_fully_vaccinated'];
          tableF = json[i]['data'][last]['people_fully_vaccinated'];
        }
        else if(last-1 >=0 && json[i]['data'][last-1].containsKey('people_fully_vaccinated')){
          tfVacc += json[i]['data'][last-1]['people_fully_vaccinated'];
        }
        if(json[i]['data'][last].containsKey('daily_vaccinations')){
          dVacc += json[i]['data'][last]['daily_vaccinations'];
          tableD = json[i]['data'][last]['daily_vaccinations'];
        }
        else if(last-1 >=0 && json[i]['data'][last-1].containsKey('daily_vaccinations')){
          dVacc += json[i]['data'][last-1]['daily_vaccinations'];
        }
      }
      if(tableT != 0) table.add(tableT); else table.add('null');
      if(tableF != 0) table.add(tableF); else table.add('null');
      if(tableD != 0) table.add(tableD); else table.add('null');
      //print(json[i]['country']+'- ' + tfVacc.toString());
    }


    return Album(
      recentDate: recent,
      totalVacc: tVacc,
      totalFullyVacc: tfVacc,
      dailyVacc : dVacc,
      vaccineT: table,
    );
  }
}
