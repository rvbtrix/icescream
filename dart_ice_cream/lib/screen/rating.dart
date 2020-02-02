import 'package:flutter/material.dart';
import 'package:dart_ice_cream/style/theme.dart' as Theme;

class Rating extends StatefulWidget {
  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
      gradient: Theme.Colors.primaryGradient,
    )));
  }
}
