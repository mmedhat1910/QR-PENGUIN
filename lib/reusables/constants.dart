import 'package:flutter/material.dart';
import 'package:qr_penguin/reusables/fact.dart';
import 'package:qr_penguin/screens/generate_screen.dart';

import 'package:qr_penguin/screens/saved_scans.dart';
import 'package:qr_penguin/screens/scan_screen.dart';

Color kMain = Color(0xFFAB46FF);
Color kMainLight = Color(0xFFCE92FF);
Color kMainDark = Color(0xFF8938CC);

Color kSecondary = Color(0xFFFFB127);
Color kTertiary = Color(0xFF6A5B75);

TextStyle kHeader1 = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.bold,
);
TextStyle kHeader2 = TextStyle(fontSize: 25.0, fontFamily: 'Montserrat');
TextStyle kHeader3 = TextStyle(fontSize: 20.0, fontFamily: 'Montserrat');
TextStyle kHeader4 = TextStyle(fontSize: 15.0, fontFamily: 'Montserrat');
TextStyle kBtnLg = TextStyle(
  fontSize: 25.0,
  fontFamily: 'Montserrat',
  color: Colors.white,
);
TextStyle kBtnMd = TextStyle(
  fontSize: 20.0,
  fontFamily: 'Montserrat',
);

TextStyle kCircularButton = TextStyle(
  color: Colors.white,
  fontSize: 15,
  fontFamily: 'Montserrat',
);

enum screens { scan, saved, generate }
var screenMap = {
  screens.saved: SavedScans(index: 2),
  screens.scan: ScanScreen(),
  screens.generate: GenerateQRScreen()
};

const qrFact = [
  Fact(
    title: 'QR codes were created in 1994',
    desc:
        'Denso Wave, a global automotive components manufacturer based in Japan, created the matrix barcode back in 1994 in order to track vehicles during manufacture via high-speed component scanning.',
  ),
  Fact(
    title: 'QR codes are a physical link',
    desc:
        'The best way to understand what a QR code is and how it can be used is to think of it as a link. Instead of having people use their smartphones to type in web addresses, they can simply scan a QR code to access the content. The action is fast and simple. All you need is a mobile device with an integrated camera and a QR code reader.',
  ),
];
