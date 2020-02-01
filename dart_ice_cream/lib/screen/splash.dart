import 'package:dart_ice_cream/screen/login.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:dart_ice_cream/style/theme.dart' as Theme;

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 8,
          gradientBackground: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Theme.Colors.loginGradientStart,
              Theme.Colors.loginGradientEnd
            ],
          ),
          navigateAfterSeconds: LoginPage(),
          loaderColor: Colors.transparent,
        ),
        Container(
          width: 1000,
          height: 800,
          child: Center(
            child: Center(
              child: FlareActor(
                'assets/animation/ice_cream.flr',
                animation: "Untitled",
              ),
            ),
          ),
        )
      ],
    );
  }
}
