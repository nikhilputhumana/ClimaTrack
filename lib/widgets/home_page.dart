// UI OF HOME PAGE

import 'package:flutter/material.dart';
import 'package:predict/widgets/navdrawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const NavDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            IconButton(
              icon: const Icon(
                Icons.menu,
                size: 40,
                color: Color.fromARGB(255, 123, 191, 247),
                // weight: 100,
              ),
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            ),
            Text('PAGE 1')
          ],
        ),
      ),
    );
  }
}
