import 'package:flutter/material.dart';

class WeatherTile extends StatelessWidget {
  final Map<dynamic, dynamic> data;

  WeatherTile({required this.data});

  late String _imgId = '${data['imgId']}';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: const Color.fromARGB(255, 31, 43, 71),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 55, 68, 99),
                  Color.fromARGB(255, 22, 35, 64),
                ],
              ),
              // color: Color.fromARGB(255, 40, 51, 78),
            ),
            child: Image.network(
              'https://openweathermap.org/img/wn/$_imgId@2x.png',
              scale: 1.25,
            ),
          ),
          Text(
            '${data['temp']}\u00B0',
            style: const TextStyle(
              fontSize: 32,
              color: Color.fromARGB(255, 133, 180, 234),
              fontWeight: FontWeight.bold,
            ),
          ),
          // SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 213, 105),
              borderRadius: BorderRadius.all(
                Radius.elliptical(50, 30),
              ),
            ),
            child: Text(
              '${data['time']}',
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 31, 43, 71),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
