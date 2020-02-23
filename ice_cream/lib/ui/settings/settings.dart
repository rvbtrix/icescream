import 'package:flutter/material.dart';
import 'package:ice_cream/constants/color_theme.dart';

class Settings extends StatefulWidget {

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(color:Color(ColorTheme.primaryColor)
    );
  }
}