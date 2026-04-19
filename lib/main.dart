import 'package:bmi_march_26/screens/Splash_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp( Bmi_App());
}

class Bmi_App extends StatelessWidget {
   Bmi_App({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashScreen(),
    );
  }
}