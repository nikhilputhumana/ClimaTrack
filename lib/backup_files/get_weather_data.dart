// CODE TO GET WEATHER USING WEATHER API

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  String _data = 'Loading..';
  String _lat = '9.591750';
  String _temp = '0';
  final String _lon = '76.631914';
  String _main = 'astfd';
  String _descr = '';
  String? _feels;

  final _apiKey = 'b1584d4a0261c3419aa2d44068fa354b';

  Future<void> _fetchData() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$_lat&lon=$_lon&appid=$_apiKey'));
    if (response.statusCode == 200) {
      final content = json.decode(response.body);
      setState(() {
        _lat = '${content['coord']['lon']}';
        _temp = '${content['main']['temp']}';
        _main = '${content['weather'][0]['main']}';
        _descr = '${content['weather'][0]['description']}';
        _feels = '${content['main']['feels_like']}';

        print(_lat);
        // _data = 'Lon: ${body['coord']['lon']}, Id: ${body['main']['temp']}';
      });
    } else {
      setState(() {
        _data = 'Failed to fetch data';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _fetchData();
            },
            child: const Text('Get data'),
          ),
          Text('Longitude: $_lon, Temperature: $_temp, \n Main: $_main'),
          Text('Description: $_descr'),
          // Text('Feels like: $_feels'),
          _feels == null
              ? const Text('Data is loading')
              : Text('Feels like: $_feels'),
        ],
      ) //
          ),
    );
  }
}
