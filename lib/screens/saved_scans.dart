import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:qr_penguin/reusables/constants.dart';
import 'package:qr_penguin/reusables/size_config.dart';

class SavedScans extends StatelessWidget {
  static const id = 'SavedScans';
  const SavedScans({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final codesBox = Hive.box('qrcode');
    bool isBoxEmpty = codesBox.length == 0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity),
          Text(
            'Saved QR Codes',
            style: kHeader1.copyWith(color: Colors.white),
          ),
          isBoxEmpty
              ? Container(
                  padding: EdgeInsets.symmetric(
                    vertical: getPercentageOfHeight(5),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Nothing Saved Yet!',
                        style: kHeader3.copyWith(color: Colors.white),
                      ),
                      SizedBox(
                        height: getPercentageOfHeight(7),
                      ),
                      SvgPicture.asset(
                        'assets/images/sad.svg',
                        width: 200,
                      ),
                    ],
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: codesBox.length,
                    itemBuilder: (context, index) {
                      return Container();
                    },
                  ),
                )
        ],
      ),
    );
  }
}
