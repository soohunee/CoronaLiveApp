import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pa3/pages/Menu.dart';
import 'package:pa3/pages/CasesDeaths.dart';
import 'package:pa3/pages/Vaccine.dart';
import 'package:pa3/pages/Success.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        onGenerateRoute: (routerSettings){
          switch(routerSettings.name){
            case '/':
              return MaterialPageRoute(builder: (_) => MyHomePage(title : "2016314364 ParkSooHun"));
            case '/success':
              return MaterialPageRoute(builder: (_) => Success(routerSettings.arguments));
            case '/success/menu':
              return MaterialPageRoute(builder: (_) => Menu(routerSettings.arguments));
              break;
            case '/success/menu/CasesDeaths':
              return MaterialPageRoute(builder: (_) => CasesDeaths(routerSettings.arguments));
              break;
            case '/success/menu/Vaccine':
              return MaterialPageRoute(builder: (_) => Vaccine(routerSettings.arguments));
              break;
            default:
              return MaterialPageRoute(builder: (_) => MyHomePage(title:"unknown route"));
          }
        }
    );
  }
}
class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  final idController = TextEditingController();
  final pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
                "Login Please...",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color:Colors.black12,
                    width: 5,

                  )
                ),
                child:Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            "ID : ",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Container(
                          width: 200,
                          child: TextField(
                            controller: idController,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "PW : ",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Container(
                          width: 200,
                          child: TextField(
                            controller: pwdController,
                          ),
                        )
                      ],
                    ),
                    ElevatedButton(
                      child:Text("Login"),
                      onPressed: () {
                        if(idController.text == 'skku' && pwdController.text == '1234'){
                          Navigator.pushNamed(
                            context,
                            '/success',
                            arguments: {'user' : idController.text,
                            'previous' : 'Login Page'},
                          );
                        }
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
