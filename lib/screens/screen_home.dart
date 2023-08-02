import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:predict/key.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final _apiKey = apiKey;   // Add your API key here

  double _lat = 0.0;
  double _lon = 0.0;
  String _temp = '';
  String _main = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _lat = prefs.getDouble('latitude') ?? 0.0;
      _lon = prefs.getDouble('longitude') ?? 0.0;
    });
    _fetchData(_lat, _lon);
  }

  Future<void> _fetchData(_lat, _lon) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$_lat&lon=$_lon&appid=$_apiKey'));
    if (response.statusCode == 200) {
      final content = json.decode(response.body);
      setState(() {
        _lat = '${content['coord']['lon']}';
        _temp = '${content['main']['temp']}';
        _main = '${content['weather'][0]['main']}';
        // _descr = '${content['weather'][0]['description']}';
        // _feels = '${content['main']['feels_like']}';

        print(_lat);
        // _data = 'Lon: ${body['coord']['lon']}, Id: ${body['main']['temp']}';
      });
    } else {
      print('Failed to fetch data');
      // setState(() {
      //   _data = 'Failed to fetch data';
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('This is the Home Screen'),
            SizedBox(
              height: 30,
            ),
            Text('Latitude is $_lat'),
            Text('Longitude is $_lon'),
            Text('Temparature is $_temp'),
            Text('Main is $_main'),
          ],
        ),
      ),
    );
  }
}
