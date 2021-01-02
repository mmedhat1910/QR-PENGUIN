import 'package:flutter/material.dart';
import 'package:qr_penguin/screens/generate_screen.dart';
import 'package:qr_penguin/screens/home_screen.dart';
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

enum screens { scan, saved, generate }
var screenMap = {
  screens.saved: SavedScans(index: 2),
  screens.scan: ScanScreen(),
  screens.generate: GenerateQRScreen()
};
