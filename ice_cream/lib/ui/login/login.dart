import 'package:flutter/material.dart';
import 'package:ice_cream/constants/color_theme.dart';
import 'package:ice_cream/constants/global_strings.dart';
import 'package:ice_cream/routes.dart';
import 'package:ice_cream/store/debtor_store.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
DebtorStore _store = DebtorStore();

@override
  void initState() {
    _store.getDataDebtorsFromApi;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(ColorTheme.primaryColor),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            bottom: 30,
            child: RaisedButton(
              elevation: 1,
              onPressed: () =>
                  {Navigator.of(context).pushReplacementNamed(Routes.home)},
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(50.0),
              ),
              child: Text(
                GlobalStrings.textLogin,
                style: TextStyle(color: Color(ColorTheme.textColor)),
              ),
              color: Color(ColorTheme.buttonColor),
            ),
          )
        ],
      ),
    );
  }
}
