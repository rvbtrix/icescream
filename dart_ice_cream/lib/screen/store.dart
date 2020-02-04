import 'package:flutter/material.dart';
import 'package:dart_ice_cream/style/theme.dart' as Theme;

class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
      gradient: Theme.Colors.primaryGradient,
    )));
  }
}
