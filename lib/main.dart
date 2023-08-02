import 'package:flutter/material.dart';
import 'package:predict/screens/screen_home.dart';
import 'package:predict/screens/screen_initial.dart';
import 'package:predict/screens/screen_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<bool>(
        future: _checkFirstTime(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ScreenSplash();
          } else {
            return snapshot.data! ? ScreenInitial() : ScreenHome();
          }
        },
      ),
      // Defining other routes
      routes: {'/homepage': (context) => ScreenHome()},
    );
  }

  Future<bool> _checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isFirstTime') ?? true;
  }
}
