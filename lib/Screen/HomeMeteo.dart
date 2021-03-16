import 'package:flutter/material.dart';
import 'package:meteoapi/Widget/Meteo.dart';
import 'package:provider/provider.dart';
import '../Model/Stato.dart';

class HomeMeteo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return Provider.of<Stato>(context, listen: true).homeMeteo();

    return Consumer<Stato>(builder: (context, stato, child) {
      if (stato.ls.isEmpty ) {
        return  Center(
          child: new Text(
            'scegli la città'
            ' per il meteo',
            textAlign: TextAlign.center, style: new TextStyle(fontSize: 40),
          ),
        );
      } else
        return new Meteo();
    });
  }
}

