import 'package:dart_ice_cream/screen/login.dart';
import 'package:dart_ice_cream/style/theme.dart' as Theme;
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

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
          seconds: 3,
          gradientBackground: Theme.Colors.primaryGradient,
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
