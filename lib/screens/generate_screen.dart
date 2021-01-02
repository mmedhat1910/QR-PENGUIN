import 'package:expandable/expandable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_penguin/constants.dart';
import 'package:qr_penguin/screens/qrcode_screen.dart';
import 'package:qr_penguin/size_config.dart';
import 'package:qr_penguin/widgets/cool_button.dart';

class GenerateQRScreen extends StatefulWidget {
  const GenerateQRScreen({
    Key key,
  }) : super(key: key);

  @override
  _GenerateQRScreenState createState() => _GenerateQRScreenState();
}

class _GenerateQRScreenState extends State<GenerateQRScreen> {
  String fieldInput;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity),
          Center(
            child: TextField(
              onChanged: (value) {
                fieldInput = value;
              },
              style: kHeader1.copyWith(
                  fontWeight: FontWeight.bold, color: Colors.white),
              // textAlignVertical: TextAlignVertical.center,
              textAlign: TextAlign.center,
              cursorColor: kSecondary,

              cursorWidth: 5,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter Text or URL',
                hintStyle: kHeader1.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: getPercentageOfHeight(20),
          ),
          SizedBox(
            height: getPercentageOfHeight(5),
          ),
          CoolButton(
            text: 'Generate',
            icon: Icons.arrow_forward,
            topRightRadius: 30,
            bottomLeftRadius: 30,
            height: 60,
            width: 250,
            color: kSecondary,
            highlightColor: kMainLight,
            textStyle: kHeader2.copyWith(color: Colors.white),
            iconColor: Colors.white,
            onPress: () {
              print(fieldInput);
              if (fieldInput != null) {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, a, b) => QRCodeScreen(
                      input: fieldInput,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
