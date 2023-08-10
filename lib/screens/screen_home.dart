import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:predict/screens/home_model.dart';
import 'package:predict/widgets/weather_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import '../components/get_data.dart';

class dataSend {
  final Map<dynamic, dynamic> dataMap;
  const dataSend(this.dataMap);
}

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  int cnt = 0;
  int cnt1 = 0;
  int cnt2 = 8;
  int cnt3 = 8;

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

  List<Map<dynamic, dynamic>> toTile = [];
  final List<Map<dynamic, dynamic>> toTileDay1 = [];
  final List<Map<dynamic, dynamic>> toTileDay2 = [];
  final List<Map<dynamic, dynamic>> toTileDay3 = [];

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
  String _tomo1 = '';
  String _tomo2 = '';
  String _tomo3 = '';
  String _tomo4 = '';
  String _tomo5 = '';
  String _tomo6 = '';
  String _tomo7 = '';
  String _tomo8 = '';

  Map _m1map = {};
  Map _m2map = {};
  Map _m3map = {};
  Map _m4map = {};
  Map _m5map = {};
  Map _m6map = {};
  Map _m7map = {};
  Map _m8map = {};

  // --- Day after ----
  String _daf1 = '';
  String _daf2 = '';
  String _daf3 = '';
  String _daf4 = '';
  String _daf5 = '';
  String _daf6 = '';
  String _daf7 = '';
  String _daf8 = '';

  Map _d1map = {};
  Map _d2map = {};
  Map _d3map = {};
  Map _d4map = {};
  Map _d5map = {};
  Map _d6map = {};
  Map _d7map = {};
  Map _d8map = {};

  Map decoded = {};

  String mapData = '';

  @override
  void initState() {
    super.initState();
    _getWeather();
    // toTile = toTileDay1;
    // cnt = cnt1;
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
        toTileDay1.add(_t1map);

        // cnt1 += 1;

        if (_today2 != '') {
          _t2map = json.decode(_today2);
          toTileDay1.add(_t2map);
          cnt1 += 1;
          if (_today3 != '') {
            _t3map = json.decode(_today3);
            toTileDay1.add(_t3map);
            cnt1 += 1;
            if (_today4 != '') {
              _t4map = json.decode(_today4);
              toTileDay1.add(_t4map);
              cnt1 += 1;
              if (_today5 != '') {
                _t5map = json.decode(_today5);
                toTileDay1.add(_t5map);
                cnt1 += 1;
                if (_today6 != '') {
                  _t6map = json.decode(_today6);
                  toTileDay1.add(_t6map);
                  cnt1 += 1;
                  if (_today7 != '') {
                    _t7map = json.decode(_today7);
                    toTileDay1.add(_t7map);
                    cnt1 += 1;
                    if (_today8 != '') {
                      _t8map = json.decode(_today8);
                      toTileDay1.add(_t8map);
                      cnt1 += 1;
                    }
                  }
                }
              }
            }
          }
        }
        // ---- end of nested if & end of today ---

        // -- Tomorrow ---
        _tomo1 = prefs.getString('tomorrow1') ?? '';
        _tomo2 = prefs.getString('tomorrow2') ?? '';
        _tomo3 = prefs.getString('tomorrow3') ?? '';
        _tomo4 = prefs.getString('tomorrow4') ?? '';
        _tomo5 = prefs.getString('tomorrow5') ?? '';
        _tomo6 = prefs.getString('tomorrow6') ?? '';
        _tomo7 = prefs.getString('tomorrow7') ?? '';
        _tomo8 = prefs.getString('tomorrow8') ?? '';

        _m1map = json.decode(_tomo1);
        toTileDay2.add(_m1map);
        _m2map = json.decode(_tomo2);
        toTileDay2.add(_m2map);
        _m3map = json.decode(_tomo3);
        toTileDay2.add(_m3map);
        _m4map = json.decode(_tomo4);
        toTileDay2.add(_m4map);
        _m5map = json.decode(_tomo5);
        toTileDay2.add(_m5map);
        _m6map = json.decode(_tomo6);
        toTileDay2.add(_m6map);
        _m7map = json.decode(_tomo7);
        toTileDay2.add(_m7map);
        _m8map = json.decode(_tomo8);
        toTileDay2.add(_m8map);
        // --- End of tommorrow ---

        // --- Day after ----
        _daf1 = prefs.getString('dayaftr1') ?? '';
        _daf2 = prefs.getString('dayaftr2') ?? '';
        _daf3 = prefs.getString('dayaftr3') ?? '';
        _daf4 = prefs.getString('dayaftr4') ?? '';
        _daf5 = prefs.getString('dayaftr5') ?? '';
        _daf6 = prefs.getString('dayaftr6') ?? '';
        _daf7 = prefs.getString('dayaftr7') ?? '';
        _daf8 = prefs.getString('dayaftr8') ?? '';

        _d1map = json.decode(_daf1);
        toTileDay3.add(_d1map);
        _d2map = json.decode(_daf2);
        toTileDay3.add(_d2map);
        _d3map = json.decode(_daf3);
        toTileDay3.add(_d3map);
        _d4map = json.decode(_daf4);
        toTileDay3.add(_d4map);
        _d5map = json.decode(_daf5);
        toTileDay3.add(_d5map);
        _d6map = json.decode(_daf6);
        toTileDay3.add(_d6map);
        _d7map = json.decode(_daf7);
        toTileDay3.add(_d7map);
        _d8map = json.decode(_daf8);
        toTileDay3.add(_d8map);

        // ---- initializing ----
        toTile = [...toTileDay1];
        cnt = cnt1;
        // print('totile is $toTile \n Count is $cnt');
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

            // ----
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      toTile = [...toTileDay1];
                      cnt = cnt1;
                    });
                  },
                  child: Text('Today'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      toTile = [...toTileDay2];
                      cnt = cnt2;
                    });
                  },
                  child: Text('Tommorrow'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      toTile = [...toTileDay3];
                      cnt = cnt3;
                    });
                  },
                  child: Text('Day after'),
                )
              ],
            ),

            Container(
              height: 230,
              padding: EdgeInsets.only(top: 20),
              child: ListView.separated(
                itemCount: cnt,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 30,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  // final viewMap = _t3map;
                  return WeatherTile(
                    data: toTile[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
