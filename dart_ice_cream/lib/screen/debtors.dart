import 'package:flutter/material.dart';
import 'package:dart_ice_cream/style/theme.dart' as Theme;

class Debtors extends StatefulWidget {
  @override
  _DebtorsState createState() => _DebtorsState();
}

class _DebtorsState extends State<Debtors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      decoration: BoxDecoration(
           gradient: Theme.Colors.primaryGradient,
        )
      ),
    );
  }
}
