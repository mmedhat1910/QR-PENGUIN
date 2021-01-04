import 'package:flutter/material.dart';
import 'package:qr_penguin/screens/saved_scans.dart';
import 'package:url_launcher/url_launcher.dart';

Widget getActiveScreen(int index) {
  return SavedScans(index: index);
}

void launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
