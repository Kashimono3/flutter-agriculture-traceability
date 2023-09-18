import 'package:demo/pages/qr_scanner/test.dart';
import 'package:demo/pages/welcome/welcome.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme:  ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        )
      ),
      home:   welcome_scenner(),
      debugShowCheckedModeBanner: false,
      title: 'LaFarm',
    );
  }
}



