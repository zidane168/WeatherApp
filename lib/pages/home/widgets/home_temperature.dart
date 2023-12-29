import 'package:flutter/material.dart';

class HomeTemperature extends StatelessWidget {

  final num temperature;
  const HomeTemperature({super.key, required this.temperature});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.sizeOf(context);
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(temperature.toString(), style: TextStyle(fontSize: (size.width / 3.93), color: Colors.white, fontWeight: FontWeight.bold)),
          Text('0', style: TextStyle(fontSize: (size.width / 10.92), color: Colors.white, fontWeight: FontWeight.bold)),
        ],
    );
  }

}