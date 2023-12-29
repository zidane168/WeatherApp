import 'package:flutter/material.dart';

class HomeDetailWeather extends StatelessWidget {

  final num windSpeed;
  final num humidity;
  const HomeDetailWeather({super.key, required this.windSpeed, required this.humidity});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/images/icons/wind.png', width: size.width/8, color: Colors.white),
            Image.asset('assets/images/icons/humidity.png', width: size.width/8, color: Colors.white),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("${windSpeed.toString()}Km/h", style: TextStyle(fontSize: size.width / 18.71 , color: Colors.white)),
            Text("${humidity.toString()}%", style: TextStyle(fontSize: size.width / 18.71 , color: Colors.white)),
          ],
        )
      ],
    );
  }

}