import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:qr_penguin/reusables/constants.dart';
import 'package:qr_penguin/screens/generate_screen.dart';
import 'package:qr_penguin/reusables/size_config.dart';
import 'package:qr_penguin/widgets/background.dart';
import 'package:qr_penguin/widgets/main_app_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: BaseScreen(),
    );
  }
}

class BaseScreen extends StatefulWidget {
  const BaseScreen({
    Key key,
  }) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int screenIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBar: AppBar()),
      backgroundColor: Color(0x00000000),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: kMain,
        height: 75,
        items: <Widget>[
          Icon(Icons.qr_code, size: 30),
          Icon(Icons.add, size: 30),
          Icon(Icons.bookmark_border, size: 30),
        ],
        onTap: (index) {
          setState(() {
            screenIndex = index;
          });
        },
        animationDuration: Duration(milliseconds: 250),
        animationCurve: Curves.easeInOut,
        index: screenIndex,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: getPercentageOfHeight(10)),
          child: GenerateQRScreen(),
        ),
      ),
    );
  }
}
