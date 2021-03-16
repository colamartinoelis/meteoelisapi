import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/Stato.dart';
import '../Model/Stato2.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ScaricaDati extends StatelessWidget {
  DateTime now = new DateTime.now();
  @override
  Widget build(BuildContext context) {
    return new Consumer<Stato>(
        builder: (context, stato, child) => new Scrollbar(
            thickness: 3,
            child: new PageView.builder(

                scrollDirection: Axis.horizontal,
                onPageChanged: (num) {
                  /* qui deve aggiornare/settare il parametro quindi
                           si mette
                          listen: false */
                  Provider.of<Stato2>(context, listen: false).paginaCorrente
                  = num;
                },
                itemCount: stato.ls.length,
                itemBuilder: (context, index) {
                  return new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        new Divider(),
                        new Text(
                          "${now.day.toString().padLeft(2, '0')}/"
                          "${now.month.toString().padLeft(2, '0')}/"
                          "${now.year.toString()} ora: ${now.hour.toString()}:"
                          "${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}",
                          style: new TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        new Divider(),
                        new AutoSizeText(
                          stato.ls[index].cityName,
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 50),
                        ),
                        new Text(
                          'country: ${stato.ls[index].country}',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        new Text(
                          'condizioni: ${stato.ls[index].condition}',
                          style: new TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 30),
                        ),
                        new Text(
                          'temperatura: ${stato.ls[index].temperature} °C',
                          style: new TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 30),
                        ),
                        new Text(
                          'humidità: ${stato.ls[index].humidity}%',
                          style: new TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 30),
                        ),
                        new Text(
                            'wind: ${stato.ls[index].wind} '
                            'Km/h',
                            style: new TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 30)),
                      ]);
                })));
  }
}
