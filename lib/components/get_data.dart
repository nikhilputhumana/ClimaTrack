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

  DateTime _curr = DateTime.now();
  DateTime _next = DateTime.now().add(Duration(days: 1));
  DateTime _aftr = DateTime.now().add(Duration(days: 2));

  String _today = DateFormat('yyyy-MM-dd').format(_curr); // Get current date
  String _tmrw = DateFormat('yyyy-MM-dd').format(_next);
  String _dayAfter = DateFormat('yyyy-MM-dd').format(_aftr);

  // print('tmrw = $_tmrw');
  // print('day after = $_dayAfter');

  final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/forecast?lat=$_lat&lon=$_lon&units=metric&cnt=24&appid=$_apiKey'));
  if (response.statusCode == 200) {
    final content = json.decode(response.body);

    _city = '${content['city']['name']}';
    _country = '${content['city']['country']}';

    _temp = '${content['list'][0]['main']['temp']}'
        .substring(0, '${content['list'][0]['main']['temp']}'.indexOf('.'));
    // print('temp iss $_temp');
    // _descr = '${content['list'][0]['weather'][0]['description']}';
    // _wind = '${content['list'][0]['wind']['speed']}';
    // _humidity = '${content['list'][0]['main']['humidity']}';
    // _dtdxt = '${content['list'][0]['dt_txt']}';

    // print('dtdxt is --- $_dtdxt');

    Map<String, dynamic> dayDetails = {};

    final thisDate = content['list'][0]['dt_txt'];
    // print('This day is $thisDate');

    int cnt1 = 1;
    int cnt2 = 1;
    int cnt3 = 1;

    // -- Fetching contents and storing it on lists. --
    for (int i = 0; i < 24; i++) {
      // Complete this for loop. The loop should store in Maps. The Map has name
      // like weatherDet[day timeZone]. These Maps will be saved into sharedPrefs
      // using loops. These values will be used to get the data to home page.
      final thisDate = content['list'][i]['dt_txt'];
      List<String> parts = thisDate.split(' ');
      String firstPart = parts[0];
      String _time = thisDate.substring(
          thisDate.indexOf(' ') + 1, thisDate.indexOf(' ') + 6);

      if (firstPart == _today) {
        // final _dtdx = '${content['list'][i]['dt_txt']}';
        // DateTime dateTime = DateTime.parse(thisDate);
        // String _time = '${dateTime.hour}:${dateTime.minute}';

        dayDetails[{'1' '$cnt1'}.toString()] = {
          'temp': '${content['list'][i]['main']['temp']}'.substring(0, '${content['list'][i]['main']['temp']}'.indexOf('.')),
          'descr': '${content['list'][i]['weather'][0]['description']}',
          'wind': '${content['list'][i]['wind']['speed']}'.substring(0, '${content['list'][i]['wind']['speed']}'.indexOf('.')),
          'dtdxt': '${content['list'][i]['dt_txt']}',
          'time': _time,
          'humidity': '${content['list'][i]['main']['humidity']}',
          'feels': '${content['list'][i]['main']['feels_like']}'.substring(0, '${content['list'][i]['main']['feels_like']}'.indexOf('.')),
          'imgId': '${content['list'][i]['weather'][0]['icon']}',
        };
        cnt1 += 1;
      } else if (firstPart == _tmrw) {
        dayDetails[{'2' '$cnt2'}.toString()] = {
          'temp': '${content['list'][i]['main']['temp']}'.substring(0, '${content['list'][i]['main']['temp']}'.indexOf('.')),
          'descr': '${content['list'][i]['weather'][0]['description']}',
          'wind': '${content['list'][i]['wind']['speed']}'.substring(0, '${content['list'][i]['wind']['speed']}'.indexOf('.')),
          'dtdxt': '${content['list'][i]['dt_txt']}',
          'time': _time,
          'humidity': '${content['list'][i]['main']['humidity']}',
          'feels': '${content['list'][i]['main']['feels_like']}'.substring(0, '${content['list'][i]['main']['feels_like']}'.indexOf('.')),
          'imgId': '${content['list'][i]['weather'][0]['icon']}',
        };
        cnt2 += 1;
      } else if (firstPart == _dayAfter) {
        dayDetails[{'3' '$cnt3'}.toString()] = {
          'temp': '${content['list'][i]['main']['temp']}'.substring(0, '${content['list'][i]['main']['temp']}'.indexOf('.')),
          'descr': '${content['list'][i]['weather'][0]['description']}',
          'wind': '${content['list'][i]['wind']['speed']}'.substring(0, '${content['list'][i]['wind']['speed']}'.indexOf('.')),
          'dtdxt': '${content['list'][i]['dt_txt']}',
          'time': _time,
          'humidity': '${content['list'][i]['main']['humidity']}',
          'feels': '${content['list'][i]['main']['feels_like']}'.substring(0, '${content['list'][i]['main']['feels_like']}'.indexOf('.')),
          'imgId': '${content['list'][i]['weather'][0]['icon']}',
        };
        cnt3 += 1;
      }
    }

    // Map<String, dynamic> dayCurr = {};
    // Map<String, dynamic> retrievd = dayCurr['second'];
    // final dayCurrData = json.encode(retrievd); // Converting to string

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

    // await prefs.setString('myMap', dayCurrData); // Fetches the whole data. Only this is enough.
    // print('cnt2 is $cnt2');

    for (int i = 1; i < cnt1; i++) {
      Map<String, dynamic> retrievd = dayDetails[{'1' '$i'}.toString()];
      final dayData = json.encode(retrievd);
      await prefs.setString('today$i', dayData);
    }
    for (int i = 1; i < cnt2; i++) {
      Map<String, dynamic> retrievd = dayDetails[{'2' '$i'}.toString()];
      final dayData = json.encode(retrievd);
      await prefs.setString('tomorrow$i', dayData);
    }
    for (int i = 1; i < cnt3; i++) {
      Map<String, dynamic> retrievd = dayDetails[{'3' '$i'}.toString()];
      final dayData = json.encode(retrievd);
      await prefs.setString('dayaftr$i', dayData);
    }
  } else {
    print('Failed to fetch data');
    // setState(() {
    //   _data = 'Failed to fetch data';
    // });
  }
}
