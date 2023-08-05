import 'package:flutter/material.dart';

class WeatherTile extends StatefulWidget {
  const WeatherTile({super.key});

  @override
  State<WeatherTile> createState() => _WeatherTileState();
}

class _WeatherTileState extends State<WeatherTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: Color.fromARGB(255, 31, 43, 71),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Image.network(
              'https://openweathermap.org/img/wn/10d@2x.png',
              scale: 1.25,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 41, 52, 79),
                  Color.fromARGB(255, 22, 35, 64),
                ],
              ),
              // color: Color.fromARGB(255, 40, 51, 78),
            ),
          ),
          Text(
            '8\u00B0',
            style: TextStyle(
              fontSize: 34,
              color: Color.fromARGB(255, 133, 180, 234),
              fontWeight: FontWeight.bold,
            ),
          ),
          // SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(6),
            child: Text(
              '12.00',
              style: TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 31, 43, 71),
              ),
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 213, 105),
              borderRadius: BorderRadius.all(
                Radius.elliptical(50, 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
