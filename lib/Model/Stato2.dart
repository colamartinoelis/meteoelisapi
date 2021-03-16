import 'package:flutter/material.dart';
import 'package:meteoapi/Model/Forecast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Stato2 with ChangeNotifier {

  int _paginaCorrente = 1;
  int get paginaCorrente => _paginaCorrente;

  set paginaCorrente(int value) {
    _paginaCorrente = value;
    notifyListeners();
  }



}
