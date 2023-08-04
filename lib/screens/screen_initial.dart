// UI TO CHOOSE PLACE OR CURRENT LOCATION AND GO TO NEXT PAGE AND DISPLAY IT THERE

import 'package:flutter/material.dart';
import 'package:predict/components/place_select.dart';

class ScreenInitial extends StatefulWidget {
  const ScreenInitial({super.key});

  @override
  State<ScreenInitial> createState() => _ScreenInitialState();
}

class _ScreenInitialState extends State<ScreenInitial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App Initial Page'),
      ),
      body: Center(
        child: PlaceSelectWidget(),
      ),
    );
  }
}
