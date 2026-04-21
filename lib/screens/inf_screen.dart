import 'package:bmi_march_26/widgets/calc_height_and_weight_Text_field.dart';
import 'package:bmi_march_26/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/gender_selection.dart';

class InfScreen extends StatefulWidget {
  const InfScreen({super.key});

  @override
  State<InfScreen> createState() => _InfScreenState();
}

class _InfScreenState extends State<InfScreen> {
  final TextEditingController heightController = TextEditingController();

  final TextEditingController dateController = TextEditingController();

  final TextEditingController weightController = TextEditingController();
  int? gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  Text(
                    'B M I',
                    style: TextStyle(
                      fontWeight: FontWeight(900),
                      fontSize: 40,
                      color: Color(0xff1A6143),
                    ),
                  ),
                  CustomTextForm(label: 'Name', enable: true),
                  CustomTextForm(
                    label: 'Birthdate',
                    enable: false,
                    onTap: () async {
                      print("Birthdate field taped");
                      var res = await showDatePicker(
                        context: context,
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                      );
                      print(res);
                      if (res != null) {
                        String date = res.toIso8601String();

                        dateController.text = date.substring(0, 10);
                      }
                    },
                  ),
                  SizedBox(height: 30),
                  GenderSelection(
                    selectedGender: (value) {
                      gender = value;
                    },
                  ),
                  SizedBox(height: 25),
                  Row(children: [Text('   Your Height(cm)')]),
                  SizedBox(height: 5),
                  HeightAndWeightTextField(heightController: heightController),
                  SizedBox(height: 25),
                  Row(children: [Text('   Your weight(cm)')]),
                  SizedBox(height: 5),
                  HeightAndWeightTextField(heightController: weightController),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InfScreen()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Calculate BMI',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
