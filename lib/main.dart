
import 'package:flutter/material.dart';

import 'Pages/SplachScreen.dart';

void main() {
  runApp(const Bmi2());
}

class Bmi2 extends StatelessWidget {
  const Bmi2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplachScreen(),
    );
  }
}
