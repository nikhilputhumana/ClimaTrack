import 'package:flutter/material.dart';

class TestWelcome extends StatelessWidget {
  const TestWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 45, 15, 40),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                  child: Image(
                    image: AssetImage('./assets/images/welcome.jpg'),
                  ),
                ),
              ),
              Text(
                'Welcome',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 123, 191, 247),
                ),
              ),
              Text('hai'),
            ],
          ),
        ),
      ),
      // --- remove it if not looking good -----
      
    );
  }
}