// UI OF HOME PAGE

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:predict/widgets/navdrawer.dart';
import 'package:predict/widgets/weather_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();

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
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Monday 12 February',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'United Arab, Dubai',
                        style: TextStyle(
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
                      child: Image.network(
                        'https://openweathermap.org/img/wn/10d@2x.png',
                        scale: 0.5,
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

                    // const SizedBox(
                    //   width: 40,
                    // ),

                    // -- Temp value --
                    const Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          child: Text(
                            '21',
                            style: TextStyle(
                              fontSize: 90,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 133, 180, 234),
                            ),
                          ),
                        ),
                        Positioned(
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
                            'Rain showers',
                            style: TextStyle(fontSize: 19),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // -- wind - temp - humidity
              const DecoratedBox(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 31, 43, 71),
                  borderRadius: BorderRadius.all(
                    Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(26.0),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // -----
                        Column(
                          children: [
                            Text(
                              'Wind',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text('8 km/hr'),
                          ],
                        ),
                        VerticalDivider(
                          color: Color.fromARGB(255, 17, 29, 59),
                          thickness: 2,
                          // width: 10,
                        ),
                        // ---
                        Column(
                          children: [
                            Text(
                              'Feels like',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Text('18 \u2103'),
                          ],
                        ),
                        VerticalDivider(
                          color: Color.fromARGB(255, 17, 29, 59),
                          thickness: 2,
                          // width: 10,
                        ),
                        // ----
                        Column(
                          children: [
                            Text(
                              'Humidity',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Text('49%'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // --- today - tmwrw - 7 days
              // SHOW THAT TEXT HERE
              Text('--- TODAY --- TOMMORROW --- 7 DAYS ---'),

              // Horizontal list
              Container(
                height: 230,
                child: ListView(
                  padding: EdgeInsets.all(10.0),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    WeatherTile(),
                    SizedBox(width: 20),
                    WeatherTile(),
                    SizedBox(width: 20),
                    WeatherTile(),
                    SizedBox(width: 20),
                    WeatherTile(),
                    SizedBox(width: 20),
                    WeatherTile(),
                    SizedBox(width: 20),
                    WeatherTile(),
                    SizedBox(width: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
