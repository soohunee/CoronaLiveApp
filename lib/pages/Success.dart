import 'package:flutter/material.dart';
import 'package:pa3/pages/Menu.dart';
import 'package:provider/provider.dart';
import 'package:pa3/pages/CasesDeaths.dart';
import 'package:pa3/pages/Vaccine.dart';

class Success extends StatelessWidget{

  final Map<String, String> arguments;
  Success(this.arguments);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('2016314364 ParkSoohun'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'CORONA LIVE',
                style: TextStyle(
                  fontSize:30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              Text(
                'Login Success. Hello '+ arguments['user'] + "!!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Container(
                width: 300,
                height: 300,
                child: Image(
                  image: AssetImage('images/corona.jpeg'),
                )

              ),
              Container(
                  child:Column(
                    children: <Widget>[
                      ElevatedButton(
                        child:Text("Start CONORA LIVE"),
                        onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/success/menu',
                              arguments: {'user' : arguments['user'],
                                'previous' : arguments['previous']},
                            );
                        },
                      ),
                    ],
                  )
              ),

            ],
          )
      ),
    );
  }
}