import 'package:flutter/material.dart';
import 'package:predict/screens/screen_splash.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (value) => runApp(
      const MyApp(),
    ),
  );
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
          scaffoldBackgroundColor: const Color.fromARGB(255, 17, 29, 59),
          drawerTheme: const DrawerThemeData(
            backgroundColor: Color.fromARGB(255, 41, 52, 79),
          ),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: const Color.fromARGB(255, 213, 216, 221),
                // or use (for font) color = 243, 244, 245
                // Color.fromARGB(255, 123, 191, 247) - light blue
              )),
      home: const ScreenSplash(),
    );
  }
}
