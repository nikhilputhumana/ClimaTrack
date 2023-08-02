import 'package:flutter/material.dart';
import 'package:predict/main.dart';
import 'package:predict/screens/screen_home.dart';
import 'package:predict/screens/screen_initial.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}
