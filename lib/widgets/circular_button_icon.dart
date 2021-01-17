import 'package:flutter/material.dart';

class CircularButtonIcon extends StatelessWidget {
  const CircularButtonIcon({
    Key key,
    this.icon = Icons.add,
    @required this.onPressed,
    this.iconColor = Colors.black,
    this.bgColor = Colors.white,
    this.radius = 30,
    this.iconSize,
  }) : super(key: key);

  final IconData icon;
  final Function onPressed;
  final Color iconColor;
  final Color bgColor;
  final double radius;
  final double iconSize;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 5,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      onPressed: onPressed,
      child: Container(
        width: radius * 2,
        height: radius * 2,
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
      ),
    );
  }
}
