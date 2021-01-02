import 'package:flutter/material.dart';
import 'package:qr_penguin/screens/saved_scans.dart';

Widget getActiveScreen(int index) {
  return SavedScans(index: index);
}
