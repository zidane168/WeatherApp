
import 'package:flutter/material.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/repositories/api_repository.dart';

class WeatherProvider extends ChangeNotifier {

  Future<WeatherData> getWeather() async {
    WeatherData result = await ApiRepository.callAPIGetWeather();
    return result;
  }
}