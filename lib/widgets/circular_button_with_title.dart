import 'package:flutter/material.dart';

import 'package:qr_penguin/widgets/circular_button_icon.dart';

class CircularButtonWithTitle extends StatelessWidget {
  const CircularButtonWithTitle({
    Key key,
    @required this.title,
    this.style,
    @required this.onPressed,
    this.icon,
    this.iconSize,
    this.radius,
    this.bgColor,
    this.iconColor,
  }) : super(key: key);
  final String title;
  final TextStyle style;
  final Function onPressed;
  final IconData icon;
  final double iconSize;
  final double radius;
  final Color bgColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircularButtonIcon(
            onPressed: () {},
            icon: icon,
            iconSize: iconSize,
            radius: radius,
            bgColor: bgColor,
            iconColor: iconColor),
        SizedBox(height: 5),
        Text(
          title,
          style: style,
        )
      ],
    );
  }
}
