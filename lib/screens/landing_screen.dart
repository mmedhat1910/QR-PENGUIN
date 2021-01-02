import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_penguin/constants.dart';
import 'package:qr_penguin/screens/home_screen.dart';
import 'package:qr_penguin/size_config.dart';
import 'package:qr_penguin/widgets/background.dart';

class LandingScreen extends StatefulWidget {
  static const String id = 'LandingPage';
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Background(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: getPercentageOfHeight(5)),
              // Penguin Designed by catalyststuff / Freepik
              child: Hero(
                tag: 'penguin',
                child: SvgPicture.asset('assets/images/penguin.svg'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(bottom: getPercentageOfHeight(5), left: 5),
              child: Hero(
                tag: 'title',
                child: SvgPicture.asset('assets/images/title.svg'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, HomeScreen.id);
              },
              child: SvgPicture.asset('assets/images/get-started.svg'),
            ),
          ],
        ),
      ),
    );
  }
}
