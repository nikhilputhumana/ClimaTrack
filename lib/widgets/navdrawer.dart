import 'package:flutter/material.dart';
import 'package:predict/widgets/search_page.dart';
import 'package:url_launcher/url_launcher.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 1.6,
      backgroundColor: Color.fromARGB(255, 41, 52, 79),
      // shape: ,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          const DrawerHeader(
            child: Text(
              'ClimaTrack',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'Give suggestions',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: () async {
              final url2 = Uri.parse(
                  'https://github.com/nikhilputhumana/ClimaTrack/issues/new/choose');
              if (await canLaunchUrl(url2)) {
                await launchUrl(url2);
              } else {
                // can't launch url
              }
            },
          ),
          ListTile(
            title: const Text(
              'Star me on GitHub ⭐',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: () async {
              // Navigator.of(context).pop();
              final url =
                  Uri.parse('https://github.com/nikhilputhumana/ClimaTrack');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                // can't launch url
              }
            },
          ),
        ],
      ),
    );
  }
}
