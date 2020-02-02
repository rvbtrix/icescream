import 'package:dart_ice_cream/screen/debtors.dart';
import 'package:dart_ice_cream/screen/rating.dart';
import 'package:dart_ice_cream/screen/setting.dart';
import 'package:dart_ice_cream/screen/store.dart';
import 'package:dart_ice_cream/style/theme.dart' as Theme;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  final widgetOptions = [
    Debtors(),
    Rating(),
    Store(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: widgetOptions.elementAt(selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              title: Text(''),
              icon: Icon(
                FontAwesomeIcons.iceCream,
                size: 20,
                color: Colors.white,
              ),
            ),
            BottomNavigationBarItem(
              title: Text(''),
              icon: Icon(
                FontAwesomeIcons.stamp,
                size: 20,
                color: Colors.white,
              ),
            ),
            BottomNavigationBarItem(
              title: Text(''),
              icon: Icon(
                FontAwesomeIcons.store,
                size: 20,
                color: Colors.white,
              ),
            ),
            BottomNavigationBarItem(
              title: Text(''),
              icon: Icon(
                FontAwesomeIcons.solidUserCircle,
                size: 20,
                color: Colors.white,
              ),
            ),
          ],
          selectedItemColor: Theme.Colors.bottomNavActive,
          unselectedItemColor: Theme.Colors.bottomNavInActive,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.Colors.blueMain,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: selectedIndex,
          onTap: onItemTapped,
        ));
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
