import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../key.dart';

const _apiKey = apiKey; // Add your API key here

double _lat = 0.0;
double _lon = 0.0;
String _temp = '';
String _descr = '';
String _city = '';
String _country = '';
String _wind = '';
String _humidity = '';

Future<void> _getCoords() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  _lat = prefs.getDouble('latitude') ?? 0.0;
  _lon = prefs.getDouble('longitude') ?? 0.0;
}

Future<void> fetchData() async {
  await _getCoords();
  final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/forecast?lat=$_lat&lon=$_lon&units=metric&appid=$_apiKey'));
  if (response.statusCode == 200) {
    final content = json.decode(response.body);

    _temp = '${content['list'][0]['main']['temp']}';
    _descr = '${content['list'][0]['weather'][0]['description']}';
    _city = '${content['city']['name']}';
    _country = '${content['city']['country']}';
    _wind = '${content['list'][0]['wind']['speed']}';
    _humidity = '${content['list'][0]['main']['humidity']}';

    // Storing into sharedprefs
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('temp', _temp);
    await prefs.setString('descr', _descr);
    await prefs.setString('city', _city);
    await prefs.setString('country', _country);
    await prefs.setString('wind', _wind);
    await prefs.setString('humidity', _humidity);

    // print('Temp = $_descr');
  } else {
    print('Failed to fetch data');
    // setState(() {
    //   _data = 'Failed to fetch data';
    // });
  }
}
