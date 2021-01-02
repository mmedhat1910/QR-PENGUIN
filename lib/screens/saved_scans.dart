import 'package:flutter/material.dart';
import 'package:qr_penguin/constants.dart';
import 'package:qr_penguin/size_config.dart';

class SavedScans extends StatelessWidget {
  static const id = 'SavedScans';
  const SavedScans({
    Key key,
    @required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
            Text('$index'),
          ],
        ),
      ),
    );
  }
}
