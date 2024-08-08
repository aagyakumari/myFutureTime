import 'package:flutter/material.dart';
import 'package:flutter_application_1/mainlogo.dart';

import 'dashboard_page.dart';
import 'horoscope_page.dart';
import 'compatibility_page.dart';
import 'auspicious_page.dart';
import 'w1_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Astrology App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: W1Page(), // Set W1Page as the home page
      routes: {
        '/dashboard': (context) => DashboardPage(),
        '/horoscope': (context) => HoroscopePage(),
        
        '/compatibility': (context) => CompatibilityPage(),
        '/auspiciousTime': (context) => AuspiciousTimePage(),
        '/w1': (context) => W1Page(),
        '/mainlogo': (context) => MainLogo(),
      },
    );
  }
}
