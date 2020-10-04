import 'package:contact_app/screens/contact/list/list.dart';
import 'package:contact_app/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
}

Widget _introScreen() {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 5,
        gradientBackground: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.redAccent, Colors.red[900]],
        ),
        navigateAfterSeconds: ContactList(),
        loaderColor: Colors.transparent,
      ),
      Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 120,
            ),
          ),
          SimpleText('Easy Contacts', size: 16.0)
        ],
      )),
    ],
  );
}
