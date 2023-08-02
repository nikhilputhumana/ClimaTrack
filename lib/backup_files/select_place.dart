// --- THE CODE IS WORKING, LATITUDE AND LONGITUDE CAN BE RECIEVED | TRY ADDING THE WEATHER API NEXT | I'VE EDITED THE place_search.dart TO ADD THE X BUTTON  ---

import 'package:flutter/material.dart';
import 'package:free_place_search/place_search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PlaceAutocomplete.widget(onDone: (e) {
              final add = e.point?.toMap();
              final lat = add?['lat'];
              final lon = add?['lon'];
              _getCoords(lat, lon);
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          PlaceAutocomplete.show(
            onDone: (e) {
              Navigator.pop(context);
            },
            context: context,
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _getCoords(lat, lon) {
    print('Latitude: $lat, Longitude: $lon');
  }
}
