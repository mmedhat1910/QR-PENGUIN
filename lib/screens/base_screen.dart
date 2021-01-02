import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_penguin/constants.dart';
import 'package:qr_penguin/screens/generate_screen.dart';
import 'package:qr_penguin/size_config.dart';

class BaseScreen extends StatefulWidget {
  final Widget activeScreen;
  const BaseScreen({
    Key key,
    this.activeScreen,
  }) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int screenIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        index: 2,
      ),
      appBar: AppBar(
        backgroundColor: Color(0x0000000),
        elevation: 0,
        leading: Hero(
          tag: 'penguin',
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(
                'assets/images/penguin.svg',
                allowDrawingOutsideViewBox: true,
              ),
            ),
          ),
        ),
        leadingWidth: 100,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: Icon(
                Icons.info_outline,
                size: 30,
              ),
              onPressed: () {},
            ),
          ),
        ],
        title: Text('QR PENGUIN'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: getPercentageOfHeight(10)),
          child: widget.activeScreen,
        ),
      ),
    );
  }
}
