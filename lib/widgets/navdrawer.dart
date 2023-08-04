import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          DrawerHeader(
            child: Text('Weather App'),
          ),
          ListTile(
            title: Text('Give a star'),
            onTap: () {
              Navigator.of(context).pop();
              // launchUrl("https://github.com/souvik-1997" as Uri);
            },
          ),
        ],
      ),
    );
  }
}
