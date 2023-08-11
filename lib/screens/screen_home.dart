// THE PAGE TO TRY OUT EVERYTHING


import 'package:flutter/material.dart';
import 'package:predict/widgets/home_page.dart';
import 'package:predict/widgets/search_page.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  
  PageController _pageController = PageController(initialPage: 0);
  int _activePage = 0;

  final List<Widget> _pages = [HomePage(), SearchPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      // drawer: NavDrawer(),
      body: Stack(
        children: [
          PageView.builder(
            allowImplicitScrolling: true,
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            onPageChanged: (int pnum) {
              setState(() {
                _activePage = pnum;
              });
            },
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return _pages[index % _pages.length];
            },
          ),

          // ------
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 60,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                    _pages.length,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: InkWell(
                            onTap: () {
                              _pageController.animateToPage(index,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn);
                            },
                            child: CircleAvatar(
                              radius: 5,
                              backgroundColor: _activePage == index
                                  ? const Color.fromARGB(255, 114, 186, 246)
                                  : const Color.fromARGB(255, 64, 132, 188),
                            ),
                          ),
                        )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
