import 'package:flutter/material.dart';
import 'package:qr_penguin/reusables/constants.dart';

import 'package:qr_penguin/reusables/size_config.dart';
import 'package:qr_penguin/widgets/circular_button_with_title.dart';

class UtilitiesBar extends StatelessWidget {
  final Function save;
  final Function share;
  final Function download;
  const UtilitiesBar({
    Key key,
    this.save,
    this.share,
    this.download,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getPercentageOfWidth(10),
      ),
      // TODO: Make these buttons function
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircularButtonWithTitle(
            title: 'Save',
            style: kCircularButton,
            onPressed: () {},
            icon: Icons.bookmark,
            iconSize: 35,
            radius: 35,
            bgColor: kSecondary,
            iconColor: Colors.white,
          ),
          CircularButtonWithTitle(
            title: 'Download',
            style: kCircularButton,
            onPressed: () {},
            icon: Icons.file_download,
            iconSize: 35,
            radius: 35,
            bgColor: kSecondary,
            iconColor: Colors.white,
          ),
          CircularButtonWithTitle(
            title: 'Share',
            style: kCircularButton,
            onPressed: () {},
            icon: Icons.share,
            iconSize: 35,
            radius: 35,
            bgColor: kSecondary,
            iconColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
