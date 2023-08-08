import 'package:flutter/material.dart';
import 'package:predict/screens/screen_home.dart';
import 'package:predict/screens/screen_initial.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/get_data.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkFirstTime(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Body of Splash Screen (May use a widget instead)
          return const Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('SPLASH SCREEN'),
                  SizedBox(
                    height: 60,
                  ),
                  CircularProgressIndicator(),
                ],
              ),
            ),
          );
        } else {
          return snapshot.data! ? ScreenInitial() : ScreenHome();
        }
      },
    );
  }

  Future<bool> _checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('isFirstTime') == null) {
      return true;
    } else {
      await fetchData();
      return false;
    }

    // return prefs.getBool('isFirstTime') ?? true;
  }
}
