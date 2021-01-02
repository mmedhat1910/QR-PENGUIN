import 'package:flutter/material.dart';
import 'package:qr_penguin/constants.dart';

class CoolButton extends StatelessWidget {
  const CoolButton({
    Key key,
    this.topLeftRadius = 0,
    this.topRightRadius = 0,
    this.bottomLeftRadius = 0,
    this.bottomRightRadius = 0,
    @required this.onPress,
    @required this.height,
    @required this.width,
    @required this.color,
    this.highlightColor,
    @required this.text,
    @required this.icon,
    this.iconColor = Colors.white,
    this.iconSize,
    this.textStyle,
  }) : super(key: key);

  final Function onPress;
  final String text;
  final IconData icon;
  final double height;
  final double width;
  final Color color;
  final Color highlightColor;
  final double topLeftRadius;
  final double topRightRadius;
  final double bottomLeftRadius;
  final double bottomRightRadius;
  final double iconSize;
  final Color iconColor;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FlatButton(
        onPressed: onPress,
        disabledColor: Colors.grey[600],
        highlightColor: highlightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeftRadius),
            bottomLeft: Radius.circular(bottomLeftRadius),
            bottomRight: Radius.circular(bottomRightRadius),
            topRight: Radius.circular(topRightRadius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: textStyle,
            ),
            Icon(icon, size: iconSize, color: iconColor)
          ],
        ),
        color: color,
      ),
    );
  }
}
