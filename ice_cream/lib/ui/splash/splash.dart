import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ice_cream/constants/color_theme.dart';
import 'package:ice_cream/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startSplashScreenTimer() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationToNextPage);
  }

  void navigationToNextPage() {
    Navigator.of(context).pushReplacementNamed(Routes.login);
  }

  @override
  void initState() {
    super.initState();
    startSplashScreenTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      color: Color(ColorTheme.primaryColor),
      child: SvgPicture.asset("assets/ice_cream_splash.svg"),
    );
  }
}
