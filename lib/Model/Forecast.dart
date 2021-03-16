import 'package:flutter/cupertino.dart';

class Forecast {
  Forecast({
    this.cityName,
    this.country,
    this.condition,
    this.temperature,
    this.wind,
    this.humidity,

  });

  final String cityName;
  final String country;
  final String condition;
  final double temperature;
  final double wind;
  final int humidity;


  factory Forecast.fromData(dynamic data) {

    final cityName = data["name"];
    final country = data["sys"]["country"];
    final condition = data["weather"][0]["main"];
    final temperature = data["main"]["temp"];
    final wind = data["wind"]["speed"];
    final humidity = data["main"]["humidity"];

    return Forecast(

      cityName: cityName,
      country: country,
      condition: condition,
      temperature: temperature,
      wind: wind,
      humidity: humidity,
    );
  }
}
