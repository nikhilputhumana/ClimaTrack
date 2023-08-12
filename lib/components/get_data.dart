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

  final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/forecast?lat=$_lat&lon=$_lon&units=metric&cnt=24&appid=$_apiKey'));
  if (response.statusCode == 200) {
    final content = json.decode(response.body);

    _city = '${content['city']['name']}';
    _country = '${content['city']['country']}';

    _temp = '${content['list'][0]['main']['temp']}'
        .substring(0, '${content['list'][0]['main']['temp']}'.indexOf('.'));

    Map<String, dynamic> dayDetails = {};

    int cnt1 = 1;
    int cnt2 = 1;
    int cnt3 = 1;

    // -- Fetching contents and storing it on lists. --
    for (int i = 0; i < 24; i++) {
      final thisDate = content['list'][i]['dt_txt'];
      List<String> parts = thisDate.split(' ');
      String firstPart = parts[0];
      String _time = thisDate.substring(
          thisDate.indexOf(' ') + 1, thisDate.indexOf(' ') + 6);

      // ------------------------------------
      String _imd = '${content['list'][i]['weather'][0]['icon']}';
      String _hu = '${content['list'][i]['main']['humidity']}';
      String _de = '${content['list'][i]['weather'][0]['description']}';
      String _dt = '${content['list'][i]['dt_txt']}';

      String _te = '${content['list'][i]['main']['temp']}' '.';
      String _wi = '${content['list'][i]['wind']['speed']}' '.';
      String _fl = '${content['list'][i]['main']['feels_like']}' '.';

      if (firstPart == _today) {
        
        dayDetails[{'1' '$cnt1'}.toString()] = {
          'temp': _te.substring(0, _te.indexOf('.')),
          'wind': _wi.substring(0, _wi.indexOf('.')),
          'feels': _fl.substring(0, _fl.indexOf('.')),
          'descr': _de,
          'dtdxt': _dt,
          'time': _time,
          'humidity': _hu,
          'imgId': _imd,
        };
        cnt1 += 1;
      } else if (firstPart == _tmrw) {
        dayDetails[{'2' '$cnt2'}.toString()] = {
          'temp': _te.substring(0, _te.indexOf('.')),
          'wind': _wi.substring(0, _wi.indexOf('.')),
          'feels': _fl.substring(0, _fl.indexOf('.')),
          'descr': _de,
          'dtdxt': _dt,
          'time': _time,
          'humidity': _hu,
          'imgId': _imd,
        };
        cnt2 += 1;
      } else if (firstPart == _dayAfter) {
        dayDetails[{'3' '$cnt3'}.toString()] = {
          'temp': _te.substring(0, _te.indexOf('.')),
          'wind': _wi.substring(0, _wi.indexOf('.')),
          'feels': _fl.substring(0, _fl.indexOf('.')),
          'descr': _de,
          'dtdxt': _dt,
          'time': _time,
          'humidity': _hu,
          'imgId': _imd,
        };
        cnt3 += 1;
      }
    }

    // Storing into sharedprefs
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('city', _city);
    await prefs.setString('country', _country);

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
