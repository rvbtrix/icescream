import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Colors {
  const Colors();

  static const Color gradientStart = const Color(0xFFfbab66);
  static const Color gradientEnd = const Color(0xFFfaaa00);

  static const Color bottomNavActive = Color.fromRGBO(255, 177, 62, 1);
  static const Color bottomNavInActive = Color.fromRGBO(203, 215, 225, 1);

  static const Color blueMain = Color.fromRGBO(10, 11, 60, 1);

  static const primaryGradient = const LinearGradient(
    colors: const [gradientStart, gradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
