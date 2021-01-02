import 'package:flutter/material.dart';
import 'package:qr_penguin/screens/generate_screen.dart';
import 'package:qr_penguin/screens/home_screen.dart';
import 'package:qr_penguin/screens/landing_screen.dart';
import 'package:qr_penguin/screens/scan_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: LandingScreen.id,
      routes: {
        LandingScreen.id: (context) => LandingScreen(),
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}
