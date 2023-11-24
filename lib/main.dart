import 'package:flutter/material.dart';

import 'package:project/Splash_screen.dart';
//import 'package:project/Splash_screen.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: splashScreen(),
    ),
  ));
}
