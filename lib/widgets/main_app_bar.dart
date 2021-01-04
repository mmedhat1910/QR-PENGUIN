import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_penguin/reusables/functions.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    Key key,
    this.appBar,
  }) : super(key: key);
  final AppBar appBar;
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
            onPressed: () =>
                launchURL('https://github.com/mmedhat1910/QR-PENGUIN'),
          ),
        ),
      ],
      title: Text('QR PENGUIN'),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
