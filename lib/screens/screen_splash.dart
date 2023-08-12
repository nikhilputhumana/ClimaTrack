import 'package:flutter/material.dart';
import 'package:predict/screens/screen_home.dart';
import 'package:predict/screens/screen_welcome.dart';
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
                  Image(
                    image: AssetImage('./assets/images/splash.gif'),
                    width: 150,
                    height: 150,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'ClimaTrack',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                      color: Color.fromARGB(255, 133, 180, 234),
                      shadows: [
                        Shadow(
                          offset: Offset(5, 6),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 100,
                      right: 100,
                      top: 100,
                    ),
                    child: LinearProgressIndicator(
                      minHeight: 2,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return snapshot.data! ? const ScreenWelcome() : const ScreenHome();
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
