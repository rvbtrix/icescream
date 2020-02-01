import 'package:dart_ice_cream/screen/rating.dart';
import 'package:dart_ice_cream/screen/setting.dart';
import 'package:dart_ice_cream/screen/store.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var currentTab = [
    Home,
    Rating(),
    Store(),
    Setting(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
