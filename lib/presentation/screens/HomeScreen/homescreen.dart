import 'package:flutter/material.dart';
import 'package:moviemingle/constants/constants.dart';
import 'package:moviemingle/presentation/screens/HomeScreen/widgets/body_widget.dart';

import '../SearchScreen/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(Constants.logo,width: 180,),
      ),
      body: const [BodyWidget(), SearchScreen()][_pageIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        indicatorShape: const CircleBorder(),
        indicatorColor: Colors.red,
        onDestinationSelected: (value) {
          setState(() {
            _pageIndex = value;
          });
        },
        selectedIndex: _pageIndex,
        destinations: const [
          NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home'),
          NavigationDestination(
              selectedIcon: Icon(Icons.search_rounded),
              icon: Icon(Icons.search),
              label: 'Search')
        ],
      ),
    );
  }
}
