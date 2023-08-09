import 'dart:convert';
// import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:predict/screens/home_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import '../components/get_data.dart';

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
  String _dtdxt = '';
  String name = '';
  String mydat = '';

  // -- Today --
  String _today1 = '';
  String _today2 = '';
  String _today3 = '';
  String _today4 = '';
  String _today5 = '';
  String _today6 = '';
  String _today7 = '';
  String _today8 = '';

  Map _t1map = {};
  Map _t2map = {};
  Map _t3map = {};
  Map _t4map = {};
  Map _t5map = {};
  Map _t6map = {};
  Map _t7map = {};
  Map _t8map = {};

  // -- Tomorow --

  Map decoded = {};

  String mapData = '';

  @override
  void initState() {
    super.initState();
    _getWeather();
  }

  void _getWeather() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(
      () {
        _lat = prefs.getDouble('latitude') ?? 0.0;

        // final double? _lat = prefs.getDouble('latitude');
        
        _city = prefs.getString('city') ?? 'Loading';
        _country = prefs.getString('country') ?? 'Loading';


        _lon = prefs.getDouble('longitude') ?? 0.0;
        _temp = prefs.getString('temp') ?? 'Loading';
        _wind = prefs.getString('wind') ?? 'Loading';
        _humidity = prefs.getString('humidity') ?? 'Loading';
        _descr = prefs.getString('descr') ?? 'Loading';
        mydat = prefs.getString('mydata1') ?? 'Unavailable';

        // --- testing sample (not needed) ----
        mapData = prefs.getString('myMap') ?? '';
        decoded = json.decode(mapData); // converting to map

        // --- start of today ----
        _today1 = prefs.getString('today1') ?? '';
        _today2 = prefs.getString('today2') ?? '';
        _today3 = prefs.getString('today3') ?? '';
        _today4 = prefs.getString('today4') ?? '';
        _today5 = prefs.getString('today5') ?? '';
        _today6 = prefs.getString('today6') ?? '';
        _today7 = prefs.getString('today7') ?? '';
        _today8 = prefs.getString('today8') ?? '';

        _t1map = json.decode(_today1);

        if (_today2 != '') {
          _t2map = json.decode(_today2);
          if (_today3 != '') {
            _t3map = json.decode(_today3);
            if (_today4 != '') {
              _t4map = json.decode(_today4);
              if (_today5 != '') {
                _t5map = json.decode(_today5);
                if (_today6 != '') {
                  _t6map = json.decode(_today6);
                  if (_today7 != '') {
                    _t7map = json.decode(_today7);
                    if (_today8 != '') {
                      _t8map = json.decode(_today8);
                    }
                  }
                }
              }
            }
          }
        }
        
        // ---- end of nested if & end of today ---

        // -- Tomorrow ---
      },
    );
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
            const SizedBox(
              height: 30,
            ),
            Text('Latitude is $_lat'),
            Text('Longitude is $_lon'),
            Text('Temparature is ${_t1map['temp']}'),
            Text('Description is ${_t1map['descr']}'),
            Text('City is $_city, $_country'),
            Text('Wind speed ${_t1map['wind']}'),
            Text('Humidity $_humidity'),
            Text('Dt_dxt = ${decoded['_dtdxt']}'),
            // Text('Today2 = $_t2map'),


            const SizedBox(
              height: 20,
            ),

            //  --- No need for this button. Juat added for debugging purposes ---
            ElevatedButton(
              onPressed: () {
                // _fetchData();
                _getWeather();
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
