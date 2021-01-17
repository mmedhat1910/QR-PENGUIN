import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

part 'qr_code_data.g.dart';

@HiveType(typeId: 0)
class QRCodeData {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String url;

  @HiveField(2)
  final Color fgColor;

  @HiveField(3)
  final Color bgColor;

  QRCodeData({this.title, this.url, this.fgColor, this.bgColor});
}
