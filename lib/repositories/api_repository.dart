import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/ultis/const.dart';

class ApiRepository {

  static Future<WeatherData> callAPIGetWeather() async {
    try {
       final dio = Dio();
       print (MyConst.API_ROOT);
       final response = await dio.get(MyConst.API_ROOT);

       Map<String, dynamic> map = json.decode(response.toString());
       WeatherData result = WeatherData.fromJson( map );

       print (result.name);
       print (result.id);
       print (result.cod);
       print (result.weather.length);

       for (Weather w in result.weather) {
         print (w.id);
         print (w.main);
         print (w.description);
       }

       return result;

    } catch (e) {
      print (e);

      throw e;
    }
  }
}