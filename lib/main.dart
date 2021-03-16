import 'package:flutter/material.dart';
import 'package:meteoapi/Model/Stato2.dart';
import 'package:provider/provider.dart';
import './Model/Stato.dart';
import './Screen/HomePage.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MultiProvider(
        providers: [
        ChangeNotifierProvider<Stato>( create: (context) => new Stato()),
          ChangeNotifierProvider<Stato2>( create: (context) => new Stato2()),
        ],
           child: new MaterialApp(
        theme: new ThemeData(
          primaryColor: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: new HomePage(),
      ),
    );
  }
}
