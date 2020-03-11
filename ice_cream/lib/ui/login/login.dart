import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ice_cream/constants/color_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ice_cream/constants/global_strings.dart';
import 'package:ice_cream/routes.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: Color(ColorTheme.primaryColorPurple),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1),
                child: SvgPicture.asset("assets/background.svg"),
              ),
            ),
            Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.2),
                  child: Text(
                    GlobalStrings.login_label,
                    style: TextStyle(
                        color: Color(ColorTheme.textColorOrange),
                        fontSize: 28,
                        decoration: TextDecoration.none),
                  ),
                )),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 2 * 0.8,
                      left: 30,
                      right: 30),
                  child: TextFormField(
                    style: TextStyle(fontSize: 22.0, color: Color(0xFFbdc6cf)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(ColorTheme.inputColorGrey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'E-mail',
                    ),
                  )),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 3 * 1.6),
                  child: TextFormField(
                    style: TextStyle(fontSize: 22.0, color: Color(0xFFbdc6cf)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(ColorTheme.inputColorGrey),
                      border: OutlineInputBorder(),
                      labelText: 'Senha',
                    ),
                  )),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 2 * 1.5),
                  child: ButtonTheme(
                    height: 60,
                    minWidth: 315,
                    child: RaisedButton(
                      elevation: 1,
                      onPressed: () => {
                        Navigator.of(context).pushReplacementNamed(Routes.home)
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(50.0),
                      ),
                      child: Text(
                        GlobalStrings.login_button_text,
                        style:
                            TextStyle(color: Color(ColorTheme.subColorWhite)),
                      ),
                      color: Color(ColorTheme.buttonColorOrange),
                    ),
                  )),
            ),
          ],
          // alignment: Alignment.center,
          // children: <Widget>[
          //   Positioned(
          //     bottom: 30,
          //     child: RaisedButton(
          //       elevation: 1,
          //       onPressed: () =>
          //           {Navigator.of(context).pushReplacementNamed(Routes.home)},
          //       shape: RoundedRectangleBorder(
          //         borderRadius: new BorderRadius.circular(50.0),
          //       ),
          //       child: Text(
          //         GlobalStrings.textLogin,
          //         style: TextStyle(color: Color(ColorTheme.textColor)),
          //       ),
          //       color: Color(ColorTheme.buttonColor),
          //     ),
          //   )
          // ],
        ),
      ),
    );
  }
}
