import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/pages/home/widgets/home_detail_weather.dart';
import 'package:weather/pages/home/widgets/home_location.dart';
import 'package:weather/pages/home/widgets/home_temperature.dart';
import 'package:weather/pages/home/widgets/home_weather_icon.dart';
import 'package:weather/provider/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff275dd2),
                    Color(0xff4ecfee),
                  ],
              ),
          ),
          child:   FutureBuilder(
            future:  context.read<WeatherProvider>().getWeather(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (!snapshot.hasData) {
                  return  Container(child: Text('No Data'));
              }

              WeatherData wData = snapshot.data as WeatherData;
              print  (wData.weather[0].main);

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HomeWeatherIcon(name: wData.weather[0].main),
                  HomeTemperature(temperature: (wData.main.temp / 10).round() ),
                  HomeLocation(name: wData.name),
                  SizedBox(height: 10),
                  HomeDetailWeather(windSpeed: wData.wind.speed, humidity: wData.main.humidity),
                ],
              );
            },

          ) ,
      ),
    );
  }
}