// UI TO CHOOSE PLACE OR CURRENT LOCATION AND GO TO NEXT PAGE AND DISPLAY IT THERE

import 'package:flutter/material.dart';
import 'package:predict/components/place_select.dart';

class ScreenInitial extends StatelessWidget {
  const ScreenInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Text(
                'Choose Location',
                style: TextStyle(
                  fontSize: 26,
                  letterSpacing: 0.9,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 123, 191, 247),
                ),
                textAlign: TextAlign.center,
              ),
              Center(
                child: PlaceSelectWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
