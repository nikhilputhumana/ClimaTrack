import 'package:flutter/material.dart';
import 'package:predict/screens/home_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  double _lat = 0.0;
  double _lon = 0.0;
  String _temp = '';
  String _descr = '';
  String _city = '';
  String _country = '';
  String _wind = '';
  String _humidity = '';

  @override
  void initState() {
    super.initState();
    _getWeather();
  }

  void _getWeather() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _lat = prefs.getDouble('latitude') ?? 0.0;
      _lon = prefs.getDouble('longitude') ?? 0.0;
      _temp = prefs.getString('temp') ?? 'Loading';
      _wind = prefs.getString('wind') ?? 'Loading';
      _humidity = prefs.getString('humidity') ?? 'Loading';
      _city = prefs.getString('city') ?? 'Loading';
      _country = prefs.getString('country') ?? 'Loading';
      _descr = prefs.getString('descr') ?? 'Loading';
    });
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
            Text('Description is $_descr'),
            Text('City is $_city, $_country'),
            Text('Wind speed $_wind'),
            Text('Humidity $_humidity'),
            // Text('Name = $n'),
            const SizedBox(
              height: 20,
            ),

            //  --- No need for this button. Juat added for debugging purposes ---
            ElevatedButton(
              onPressed: () {
                // _fetchData();
                _getWeather();
                print(DateFormat('EEEE, d MMM').format(DateTime.now()));
              },
              child: const Text('Get weather'),
            ),

            // Navigating to next page (not needed)
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeModel(),
                  ),
                );
              },
              child: Text('Next Page'),
            ),
          ],
        ),
      ),
    );
  }
}
