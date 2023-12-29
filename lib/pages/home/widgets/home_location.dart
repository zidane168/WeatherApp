import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeLocation extends StatelessWidget {

  final String name;
  const HomeLocation({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final df = DateFormat('dd-MM-yyyy');

    Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/icons/location.png', width: size.width / 11.23),
            const SizedBox(width: 10.0),
            Text(name, style: TextStyle(fontSize: size.width / 14.0, color: Colors.white)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(df.format(DateTime.now()), style: TextStyle(fontSize: size.width / 14.0, color: Colors.white)),
          ],
        )

      ],
    );
  }
  
}