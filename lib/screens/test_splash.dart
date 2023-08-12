import 'package:flutter/material.dart';

class TestSplashScreen extends StatelessWidget {
  const TestSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: Color.fromARGB(255, 41, 52, 79),
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
                    // color: Colors.blueAccent,
                  ),
                ],
                // fontFamily: 'monospace',
              ),
            ),
            // Text('TEST SPLASH SCREEN'),
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
            // CircularProgressIndicator(
            //   color: Colors.yellow,
            // ),
          ],
        ),
      ),
    );
  }
}
