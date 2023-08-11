// UI OF HOME PAGE

import 'package:flutter/material.dart';
import 'package:predict/widgets/navdrawer.dart';
import 'package:predict/widgets/weather_tile.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Color _color1 = const Color.fromARGB(255, 133, 180, 234);
  Color _color2 = const Color.fromARGB(255, 31, 43, 71);
  Color _color3 = const Color.fromARGB(255, 31, 43, 71);

  int cnt = 0;
  int cnt1 = 0;
  int cnt2 = 8;
  int cnt3 = 8;

  String _city = '';
  String _country = '';
  String _iconId = '04n';

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

  @override
  void initState() {
    super.initState();
    _getWeather();
  }

  void _getWeather() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(
      () {
        _city = prefs.getString('city') ?? 'Loading';
        _country = prefs.getString('country') ?? 'Loading';

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
        cnt1 += 1;

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

        _iconId = _t1map['imgId'];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const NavDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
          child: Column(
            children: [
              // --- Header part --
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    // alignment: Alignment.topLeft,
                    icon: const Icon(
                      Icons.menu,
                      size: 40,
                      color: Color.fromARGB(255, 123, 191, 247),
                      // weight: 100,
                    ),
                    onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        DateFormat('EEEE, d MMM').format(DateTime.now()),
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        '$_city, $_country',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // --- Temperature Body ---
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 41, 52, 79),
                            Color.fromARGB(255, 22, 35, 64),
                          ],
                        ),
                        // color: Color.fromARGB(255, 40, 51, 78),
                      ),
                      child: Image.network(
                        'https://openweathermap.org/img/wn/$_iconId@2x.png',
                        scale: 0.5,
                      ),
                    ),

                    // const SizedBox(
                    //   width: 40,
                    // ),

                    // -- Temp value --
                    Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          child: Text(
                            '${_t1map['temp']}',
                            style: const TextStyle(
                              fontSize: 85,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 133, 180, 234),
                              // height: 1.5,
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 90,
                          top: 10,
                          child: Text(
                            '\u2103',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 133, 180, 234),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -14,
                          child: Text(
                            '${_t1map['descr']}',
                            style: const TextStyle(fontSize: 19),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // -- wind - temp - humidity
              DecoratedBox(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 31, 43, 71),
                  borderRadius: BorderRadius.all(
                    Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // ---
                        Column(
                          children: [
                            const Text(
                              'Feels like',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Text('${_t1map['feels']} \u2103'),
                          ],
                        ),
                        const VerticalDivider(
                          color: Color.fromARGB(255, 17, 29, 59),
                          thickness: 2,
                          // width: 10,
                        ),
                        // -----
                        Column(
                          children: [
                            const Text(
                              'Wind',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${_t1map['wind']} km/hr',
                              // style: TextStyle(
                              //   // fontSize: 14,
                              //   fontWeight: FontWeight.bold,
                              // ),
                            ),
                          ],
                        ),

                        const VerticalDivider(
                          color: Color.fromARGB(255, 17, 29, 59),
                          thickness: 2,
                          // width: 10,
                        ),
                        // ----
                        Column(
                          children: [
                            const Text(
                              'Humidity',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Text('${_t1map['humidity']}%'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // --- today - tmwrw - 7 days
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          toTile = [...toTileDay1];
                          cnt = cnt1;

                          _color1 = const Color.fromARGB(255, 133, 180, 234);
                          _color2 = const Color.fromARGB(255, 31, 43, 71);
                          _color3 = const Color.fromARGB(255, 31, 43, 71);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        fixedSize: Size.fromWidth(
                            MediaQuery.of(context).size.width / 4),
                        backgroundColor: _color1,
                      ),
                      child: const Text('Today'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          toTile = [...toTileDay2];
                          cnt = cnt2;

                          _color1 = const Color.fromARGB(255, 31, 43, 71);
                          _color2 = const Color.fromARGB(255, 133, 180, 234);
                          _color3 = const Color.fromARGB(255, 31, 43, 71);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        fixedSize: Size.fromWidth(
                            MediaQuery.of(context).size.width / 3.9),
                        backgroundColor: _color2,
                      ),
                      child: const Text('Tomorrow'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          toTile = [...toTileDay3];
                          cnt = cnt3;

                          _color1 = const Color.fromARGB(255, 31, 43, 71);
                          _color2 = const Color.fromARGB(255, 31, 43, 71);
                          _color3 = const Color.fromARGB(255, 133, 180, 234);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        fixedSize: Size.fromWidth(
                            MediaQuery.of(context).size.width / 4),
                        backgroundColor: _color3,
                      ),
                      child: const Text('Day After'),
                    ),
                  ],
                ),
              ),

              // Horizontal list - REMOVE PADDNG FOR THIS ?? why bro
              Container(
                padding: const EdgeInsets.only(top: 20),
                height: 230,
                child: ListView.separated(
                  itemCount: cnt,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 21,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return WeatherTile(data: toTile[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
