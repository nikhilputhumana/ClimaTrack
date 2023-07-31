import 'package:flutter/material.dart';
import 'package:free_place_search/place_search.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:convert';

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
      home: const MyHomePage(title: 'Flutter Weather Map Demo'),
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
  String _data = 'Loading..';
  double _lat = 0.0;
  double _lon = 0.0;
  String _temp = '0';
  String _main = 'astfd';
  String _descr = '';
  String? _feels;
  bool _viewData = false;

  final _apiKey = 'b1584d4a0261c3419aa2d44068fa354b';

  Future<void> _fetchData(_lat, _lon) async {
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

            // --- Get Weather ---
            ElevatedButton(
              onPressed: () {
                _fetchData(_lat, _lon);
                _viewData = true;
              },
              child: const Text('Get data'),
            ),
            Visibility(
                visible: _viewData,
                child: Column(
                  children: [
                    Text(
                        'Longitude: $_lon, Temperature: $_temp, \n Main: $_main'),
                    Text('Description: $_descr'),
                    // Text('Feels like: $_feels'),
                    _feels == null
                        ? const Text('Data is loading')
                        : Text('Feels like: $_feels'),
                  ],
                ))
          ],
        ),
      ),

      // ----- Place Select -----
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
    _lat = lat;
    _lon = lon;
    print('Latitude: $lat, Longitude: $lon');
  }
}
