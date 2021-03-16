import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/Stato.dart';
import '../Model/Stato2.dart';

class InserisciCitta extends StatelessWidget {
  TextEditingController x = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Consumer<Stato>(
        builder: (context, stato, child) => new Scaffold(
            appBar: new AppBar(
              backgroundColor: Colors.white,
              brightness: Brightness.light,
              leading: new IconButton(
                icon: new Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: Navigator.of(context).pop,
              ),
            ),
            body: new Padding(
                padding: EdgeInsets.all(16),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new TextField(
                      controller: stato.nomeCitta,
                      decoration: InputDecoration(
                          labelText: 'inserisci la citta',
                          hintText: 'ins'
                              'erire '),
                    ),
                    new SizedBox(
                      height: 40,
                    ),
                    new IconButton(
                        tooltip: 'trova meteo',
                        color: Colors.green,
                        iconSize: 70,
                        icon: new Icon(Icons.search),
                        onPressed: () {
                          Navigator.of(context).pop();
                          stato.aggiungi();
                          stato.notifica();
                          /* qui deve aggiornare/settare il parametro quindi
                           si mette
                          listen: false */
                          Provider.of<Stato2>(context, listen: false)
                              .paginaCorrente = stato.ls.length;
                        })
                  ],
                ))));
  }
}
