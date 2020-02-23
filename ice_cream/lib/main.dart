import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ice_cream/routes.dart';
import 'package:ice_cream/ui/splash/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: Routes.routes,
    );
  }
}
