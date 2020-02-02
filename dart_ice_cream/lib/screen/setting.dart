import 'package:flutter/material.dart';
import 'package:dart_ice_cream/style/theme.dart' as Theme;

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
      gradient: Theme.Colors.primaryGradient,
    )));
  }
}
