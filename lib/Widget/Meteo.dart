import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/Stato.dart';
import'../Widget/ScaricaDati.dart';


class Meteo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Consumer<Stato>(
        builder: (context, stato, child) =>  new FutureBuilder(
              future: stato.trovaMeteo(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return new Center(child: new CircularProgressIndicator
                      (value: 5,));
                    break;

                  default:
                    if (snapshot.hasError) {
                      return new Center(
                          child: new Icon(
                        Icons.error,
                        size: 40,
                      ));
                    } else {
                      return new ScaricaDati();
                    }
                }
              },
            ));
  }
}

