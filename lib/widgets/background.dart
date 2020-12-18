import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_penguin/constants.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [kMainLight, kMain],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0.0,
            child: SvgPicture.asset(
              'assets/images/curve.svg',
              color: Color(0x408938CC),
              allowDrawingOutsideViewBox: true,
            ),
          ),
          SafeArea(child: child)
        ],
      ),
    );
  }
}
