import 'package:flutter/material.dart';
import '../components/place_select.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PlaceSelectWidget(),
    );
  }
}
