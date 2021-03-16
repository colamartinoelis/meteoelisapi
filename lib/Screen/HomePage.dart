import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meteoapi/Widget/InserisciCitta.dart';
import '../Screen/HomeMeteo.dart';
import '../Widget/Meteo.dart';
import 'package:provider/provider.dart';
import '../Model/Stato.dart';
import '../Widget/RigaCitta.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text(
            'Meteo ELisAPI',
            style: new TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white70,
        ),
        body: new SafeArea(
          child: new Container(
            padding: EdgeInsets.all(16),
            child: new Column(children: <Widget>[
              new RigaCitta(),
              new Expanded(child: new HomeMeteo()),
              new Padding(
                  padding: new EdgeInsets.only(top: 15, right: 25, bottom: 15),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    new FloatingActionButton(
                      backgroundColor: Colors.black,
                      tooltip: 'scegli città',
                      child: new Icon(
                        Icons.add,
                        size: 50,
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InserisciCitta()),
                      ),
                    ),
                  ])),
            ]),
          ),
        ));
  }
}
