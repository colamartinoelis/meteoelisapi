import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/Stato2.dart';
import '../Model/Stato.dart';
import 'package:auto_size_text/auto_size_text.dart';

class RigaCitta extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Consumer<Stato2>(builder: (context, stato2, child) {
      return new Row(children: [
        new Expanded(
            child: new Container(
                height: MediaQuery.of(context).size.height / 24,
                child: new ListView.builder(
                               shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  /* qui si deve mattere in ascolto lo Stato se ci sono
                   variazioni per cui listen: TRUE!! */
                  itemCount: Provider.of<Stato>(context, listen: true).ls
                  .length,
                  itemBuilder: (BuildContext context, int index) {
                    return new Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 4,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      decoration: new BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                          color: stato2
                              .paginaCorrente == index
                          ? Colors.black :
                          Colors
                              .white70,
                          borderRadius: BorderRadius.circular(20)),
                      child: new AutoSizeText( Provider.of<Stato>
                    (context,
                          listen: false)
                          .ls[index].cityName,
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: stato2.paginaCorrente == index  ? Colors
                                .white :
                            Colors
                                .black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                          )),
                    );
                  },
                ))),
      ]);
    });
  }
}
