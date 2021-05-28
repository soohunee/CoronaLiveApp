import 'package:flutter/material.dart';
import 'package:pa3/pages/Success.dart';
import 'package:provider/provider.dart';
import 'package:pa3/pages/CasesDeaths.dart';
import 'package:pa3/pages/Vaccine.dart';

class Menu extends StatelessWidget{

  final Map<String, String> arguments;
  Menu(this.arguments);
  List<String> elements = ['Cases/Deaths', 'Vaccine'];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.coronavirus_outlined),
              title: Text('Cases/Deaths'),
              onTap:(){
                Navigator.pushNamed(
                    context,
                    '/success/menu/CasesDeaths',
                    arguments:{'user' : arguments['user'],
                      'previous' : 'Menu'});
              },
            ),
            ListTile(
              leading: Icon(Icons.local_hospital),
              title: Text('Vaccine'),
              onTap:(){
                Navigator.pushNamed(
                    context,
                    '/success/menu/Vaccine',
                    arguments:{'user' : arguments['user'],
                'previous' : 'Menu'});
              },
            ),
            Container(
              margin: EdgeInsets.only(top:250),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Welcome! " + arguments['user'],
                      style: TextStyle(
                        fontSize:20,
                        color: Colors.black38,
                      ),
                  ),
                  Text(
                    "Previous : "+arguments['previous'],
                    style: TextStyle(
                    fontSize:20,
                    color: Colors.blueGrey,
                    ),
                  ),
                ],
              )
            ),
          ],
        ),
      )
    );
  }
}