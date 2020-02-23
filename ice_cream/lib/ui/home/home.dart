import 'package:flutter/material.dart';
import 'package:ice_cream/constants/color_theme.dart';
import 'package:ice_cream/ui/debtors/debtors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ice_cream/ui/evaluation/evaluation.dart';
import 'package:ice_cream/ui/mydebts/mydebts.dart';
import 'package:ice_cream/ui/settings/settings.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final widgetOptions = [Debtors(), Evaluation(), MyDebts(), Settings()];

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
              icon: SvgPicture.asset("assets/bottom_navigation_debtor.svg",height: 22,width: 22,),
            ),
            BottomNavigationBarItem(
              title: Text(''),
              icon: SvgPicture.asset("assets/bottom_navigation_evaluation.svg",height: 22,width: 22,),
            ),
            BottomNavigationBarItem(
              title: Text(''),
              icon: SvgPicture.asset("assets/bottom_navigation_mydebtor.svg",height: 22,width: 22,),
            ),
            BottomNavigationBarItem(
              title: Text(''),
              icon: SvgPicture.asset("assets/bottom_navigation_settings.svg",height: 22,width: 22,),
            ),
          ],
          // selectedItemColor: Theme.Colors.bottomNavActive,
          // unselectedItemColor: Theme.Colors.bottomNavInActive,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(ColorTheme.primaryColor),
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
