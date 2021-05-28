import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
/*
class CasesDeaths extends StatelessWidget{
  final Map<String, String> arguments;
  CasesDeaths(this.arguments);
  Future<Album> futureAlbum = fetchAlbum();

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FutureBuilder<Album>(
                future: futureAlbum,
                builder: (context, snapshot){
                  String answer = '';
                  if(snapshot.hasData){
                    //answer += snapshot.data.data[0]['date'].toString();
                    return Column(
                      children: <Widget>[
                        Container(
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
                                  Text("Total Cases\n"),
                                  Text("Total Cases\n"),
                                  Text("Total Deaths\n"),
                                  Text("Total Deaths"),

                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text("Parsed latest date\n"),
                                  Text(snapshot.data.recentDate),
                                  Text('Daily Cases\n'),
                                  Text('Daily Cases'),
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
                              ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 10),
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
                    return Text("snapshot error");
                  }
                  return CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(
              context,
              '/menu',
              arguments: {'user' : arguments['user'],
                'previous' : 'Cases/Deaths Page'});
        },
        backgroundColor: Colors.blue,
        child:Icon(Icons.list),
        tooltip: 'Menu Page',
      ),
    );
  }
}

Future<Album> fetchAlbum() async{
  final response=
    await http.get(Uri.https('covid.ourworldindata.org','/data/owid-covid-data.json'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else{
    throw Exception('Failed to load');
  }
}

class Album{
  final Map<String, dynamic> whole;
  final String continent;
  final List data;
  final String recentDate;

  Album({@required this.whole, @required this.continent,
          @required this.data, @required this.recentDate});

  factory Album.fromJson(Map<String, dynamic> json){
    return Album(
      whole: json['KOR'],
      recentDate: json['KOR']['data'][0]['date']
    );
  }
}
 */

class CasesDeaths extends StatelessWidget{
  final Map<String, String> arguments;
  CasesDeaths(this.arguments);


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Center(
          child: Text("asdf"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(
              context,
              '/menu',
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

