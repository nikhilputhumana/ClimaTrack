import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';
import '../key.dart';

const _apiKey = apiKey; // Add your API key here

double _lat = 0.0;
double _lon = 0.0;
String _city = '';
String _country = '';

String _temp = '';
String _descr = '';
String _wind = '';
String _humidity = '';
String _feels = '';
String _dtdxt = '';

// --- Function to retrieve date part (used to check the current, next and day aftr's dates to display those accordingly) ---
// void main() {
//   String dateTimeString = '2023-08-08 09:00:00';

//   List<String> parts = dateTimeString.split(' ');
//   String firstPart = parts[0];

//   print(firstPart); // Output: 2023-08-08
// }

Future<void> _getCoords() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  _lat = prefs.getDouble('latitude') ?? 0.0;
  _lon = prefs.getDouble('longitude') ?? 0.0;
}

Future<void> fetchData() async {
  await _getCoords();

  String _currDate =
      DateFormat('yyyy-MM-dd').format(DateTime.now()); // Get current date

  final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/forecast?lat=$_lat&lon=$_lon&units=metric&cnt=24&appid=$_apiKey'));
  if (response.statusCode == 200) {
    final content = json.decode(response.body);

    _temp = '${content['list'][0]['main']['temp']}';
    _descr = '${content['list'][0]['weather'][0]['description']}';
    _city = '${content['city']['name']}';
    _country = '${content['city']['country']}';
    _wind = '${content['list'][0]['wind']['speed']}';
    _humidity = '${content['list'][0]['main']['humidity']}';
    _dtdxt = '${content['list'][0]['dt_txt']}';

    Map<String, dynamic> dayCurr = {};

    String tail = 'first';
    dayCurr[tail] = {
      '_temp': '${content['list'][0]['main']['temp']}',
      '_descr': '${content['list'][0]['weather'][0]['description']}',
      '_wind': '${content['list'][0]['wind']['speed']}',
      '_dtdxt': '${content['list'][0]['dt_txt']}',
      '_humidity': '${content['list'][0]['main']['humidity']}',
      '_feels': '${content['list'][0]['main']['feels_like']}',
    };

    dayCurr['second'] = {
      '_temp': '${content['list'][1]['main']['temp']}',
      '_descr': '${content['list'][1]['weather'][0]['description']}',
      '_wind': '${content['list'][1]['wind']['speed']}',
      '_dtdxt': '${content['list'][1]['dt_txt']}',
      '_humidity': '${content['list'][0]['main']['humidity']}',
      '_feels': '${content['list'][0]['main']['feels_like']}',
    };

    print('Current day is $_currDate');

    for (int i = 0; i < 3; i++) {
      // Complete this for loop. The loop should store in Maps. The Map has name
      // like weatherDet[day timeZone]. These Maps will be saved into sharedPrefs
      // using loops. These values will be used to get the data to home page.
    }

    Map<String, dynamic> retrievd = dayCurr['second'];

    final dayCurrData = json.encode(retrievd); // Concerting to string

    // Storing into sharedprefs
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // await prefs.setString('data', ty); // Storing the whole contents

    await prefs.setString('temp', _temp);
    // await prefs.setString('temp', dayCurr['_temp']);
    await prefs.setString('descr', _descr);
    await prefs.setString('city', _city);
    await prefs.setString('country', _country);
    await prefs.setString('wind', _wind);
    await prefs.setString('humidity', _humidity);
    await prefs.setString('dtdxt', _dtdxt);
    // await prefs.setString('dtdxt', dayCurr['_dtdxt']);

    await prefs.setString(
        'myMap', dayCurrData); // Fetches the whole data. Only this is enough.
  } else {
    print('Failed to fetch data');
    // setState(() {
    //   _data = 'Failed to fetch data';
    // });
  }
}
