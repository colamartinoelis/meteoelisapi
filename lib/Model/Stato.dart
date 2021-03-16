import 'package:flutter/material.dart';
import 'package:meteoapi/Model/Forecast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Stato with ChangeNotifier {
  TextEditingController _nomeCitta = new TextEditingController();
  TextEditingController get nomeCitta => _nomeCitta;
  List<Forecast> ls = [];



  Future<Forecast> trovaMeteo() async {
    final response = await http.get("http://api.openweathermap.org/data/2"
        ".5/weather?q=${_nomeCitta.text.trim()}&units=metric&appid"
        "=ac941f1a4b5a26e1fb6a10e0659e11f1");
     return Forecast.fromData(json.decode(response.body));
  }

  Future<void> aggiungi() async {
    ls.add(await trovaMeteo());

     notifyListeners();
  }

  void notifica() => notifyListeners();




}
