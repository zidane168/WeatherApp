import 'package:flutter/material.dart';
import 'package:weather/ultis/const.dart';

class HomeWeatherIcon extends StatelessWidget {

  final String name;
  const HomeWeatherIcon({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    // TODO: implement build
    return  Container(
      width: size.width / 1.5,
      padding: const EdgeInsets.all(20),
      child: Image.asset(
        // 'assets/images/weathers/sunny.png',
        MyAsset.getLinkImgWithFormat(name),
        fit: BoxFit.cover,
      ),
    );
  }
}