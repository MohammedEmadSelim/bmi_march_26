import 'package:bmi_march_26/models/bmi_model.dart';
import 'package:bmi_march_26/screens/res_screen.dart';
import 'package:bmi_march_26/widgets/calc_height_and_weight_Text_field.dart';
import 'package:bmi_march_26/widgets/custom_text_form.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../widgets/gender_selection.dart';

class InfScreen extends StatefulWidget {
  const InfScreen({super.key});

  @override
  State<InfScreen> createState() => _InfScreenState();
}

class _InfScreenState extends State<InfScreen> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  final TextEditingController weightController = TextEditingController();
  int? gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: key,
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
                    CustomTextForm(
                      label: 'Name',
                      readOnly: false,
                      controller: nameController, hint: 'Name',
                    ),
                    CustomTextForm(
                      label: 'Birthdate',
                      readOnly: true,
                      onTap: () async {
                        var res = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1980),
                          lastDate: DateTime.now(),
                        );
                        if (res != null) {
                          String date = res.toIso8601String();

                          dateController.text = date.substring(0, 10);
                        }

                      }, hint:'Birthdate',
                      controller: dateController,
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
                    HeightAndWeightTextField(
                      heightController: heightController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Height field can't be empty";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 25),
                    Row(children: [Text('   Your weight(Kg)')]),
                    SizedBox(height: 5),
                    HeightAndWeightTextField(
                      heightController: weightController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Weight field can't be empty";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () async {
                        if (key.currentState!.validate()) {
                          var res = await fetchBmi(
                            height: heightController.text,
                            weight: weightController.text,
                          );
                          var bmi = BmiResponse.fromJson(res.data);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResScreen(
                                bmi: bmi,
                                name: nameController.text,
                                birthdate: dateController.text,
                              ),
                            ),
                          );
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        width: 350,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Color(0xff484783),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Calculate BMI',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
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
      ),
    );
  }
}

Future<Response<dynamic>> fetchBmi({
  required String height,
  required String weight,
}) async {
  Dio dio = Dio();
  try {
    var res = await dio.get(
      "https://api.apiverve.com/v1/bmicalculator?weight=$weight&height=$height&unit=metric",
      options: Options(
        headers: {"x-api-key": "ff870e7d-5d78-4309-82bc-0b5e0347db0f"},
      ),
    );
    return res;
  } on DioException catch (ex) {
    throw ex;
  } catch (e) {
    throw e;
  }
}
