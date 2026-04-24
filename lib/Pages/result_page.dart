import 'package:bmi/Models/bmi_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, this.respon});
final BmiResponse? respon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          respon?.data?.bmi.toString() ?? "no data"
        ),
      ),
    );
  }
}