// CODE TO CHOOSE PLACE OR CURRENT LOCATION AND RETRUN THOSE RESULTS TO THE SHARED_PREFS VARIABLES

import 'package:flutter/material.dart';
import 'package:predict/components/get_data.dart';
import 'package:predict/screens/screen_home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:free_place_search/place_search.dart';
import 'package:geolocator/geolocator.dart';

class PlaceSelectWidget extends StatefulWidget {
  const PlaceSelectWidget({super.key});

  @override
  State<PlaceSelectWidget> createState() => _PlaceSelectWidgetState();
}

class _PlaceSelectWidgetState extends State<PlaceSelectWidget> {
  Position? _currentPosition;

  double _lat = 0.0;
  double _lon = 0.0;

  // Current location
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Location permissions are denied')));
          return false;
        }
      }
    }
    if (permission == LocationPermission.deniedForever) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                'Location permissions are permanently denied, we cannot request permissions.')));
        return false;
      }
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      buildShowDialog(context); // --- added now ---
      setState(() {
        _currentPosition = position;
        _lat = _currentPosition?.latitude ?? 0.0;
        _lon = _currentPosition?.longitude ?? 0.0;
      });
    }).catchError((e) {
      debugPrint(e);
    });
    _saveData(_lat, _lon);
  }

  // Getting cordinates from place search
  void _getCoords(lat, lon) {
    _lat = lat;
    _lon = lon;
    _saveData(_lat, _lon);
  }

  // SAVE DATA AND GO TO NEXT PAGE
  void _saveData(_lat, _lon) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', false);
    await prefs.setDouble('latitude', _lat);
    await prefs.setDouble('longitude', _lon);
    await fetchData();

    if (context.mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => const ScreenHome(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 45),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PlaceAutocomplete.widget(
              onDone: (e) {
                buildShowDialog(context);
                final add = e.point?.toMap();
                final lat = add?['lat'];
                final lon = add?['lon'];
                _getCoords(lat, lon);
              },
              // style: TextStyle(color: Colors.white),
            ),

            const Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: Text(
                'OR',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // --- Get current location ---
            ElevatedButton(
              onPressed: () {
                _getCurrentPosition();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                fixedSize: Size(MediaQuery.of(context).size.width / 1.1, 45),
              ),
              child: const Text(
                'Get Current Location',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Show a circularProgressIndicator like a popup on choose location button press ---
  buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
