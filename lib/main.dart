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
          scaffoldBackgroundColor: Color.fromARGB(255, 17, 29, 59),
          drawerTheme: DrawerThemeData(
            backgroundColor: Color.fromARGB(255, 133, 180, 234),
          ),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                // displayColor: Colors.white
              )),
      home: ScreenSplash(),
    );
  }
}
