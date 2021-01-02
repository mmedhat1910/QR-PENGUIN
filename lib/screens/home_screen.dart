import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_penguin/constants.dart';
import 'package:qr_penguin/size_config.dart';
import 'package:qr_penguin/widgets/background.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String text = 'Hello';
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
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
              text = index.toString();
            });
          },
          animationDuration: Duration(milliseconds: 250),
          animationCurve: Curves.easeInOut,
          index: 2,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: getPercentageOfHeight(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                ),
                Text(
                  'Saved Scans',
                  style: kHeader1.copyWith(
                      fontWeight: FontWeight.bold, color: Color(0xffffffff)),
                ),
                SizedBox(
                  height: getPercentageOfHeight(5),
                ),
                Text(
                  'No available data',
                  style: kHeader3.copyWith(color: Colors.white),
                ),
                Text(text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
