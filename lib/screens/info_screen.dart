import 'package:bmi_march_26/model/bmi_model.dart';
import 'package:bmi_march_26/screens/res_screen.dart';
import 'package:bmi_march_26/widgets/calculated_text_form.dart';
import 'package:bmi_march_26/widgets/custom_text_form.dart';
import 'package:bmi_march_26/widgets/gender_selection.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  int? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Form(
              key: key,
              child: Column(
                children: [
                  Text(
                    "BMI",
                    style: TextStyle(
                      letterSpacing: 10,
                      fontWeight: FontWeight.w900,
                      fontSize: 36,
                      color: Color(0xff01502E),
                    ),
                  ),
                  SizedBox(height: 45),

                  CustomTextFormField(
                    nameController: nameController,
                    title: "Name",
                    hint: "Name",
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                  SizedBox(height: 20),

                  CustomTextFormField(
                    nameController: dateController,
                    hint: "Birthdate",
                    title: "Birthdate",
                    readOnly: true,
                    onTap: () async {
                      print("Birthdate field taped");
                      var res = await showDatePicker(
                        context: context,
                        firstDate: DateTime(2010),
                        lastDate: DateTime(2030),
                      );
                      print(res);
                      if (res != null) {
                        String date = res.toIso8601String();

                        dateController.text = date.substring(0, 10);
                      }
                    },
                  ),
                  SizedBox(height: 36),

                  GenderSelection(
                    selectedGender: (value) {
                      print("the gender is:$value");
                      gender = value;
                    },
                  ),

                  SizedBox(height: 40),
                  CalculatedTextFormField(
                    title: "Your Height(cm)",
                    hint: "Your Height",
                    controller: heightController,
                    validator: (value){
                      // final emailRegex = RegExp(
                      //   r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$',
                      // );
                      if(value == null||value.isEmpty){
                        return "Height field can't be empty";

                      }
                      return null;

                      // if (!emailRegex.hasMatch(value.trim())) {
                      //   return 'Enter a valid email address';
                      // }

                    },
                  ),
                  SizedBox(height: 14),
                  CalculatedTextFormField(
                    title: "Your Weight(cm)",
                    hint: "Your Weight",
                    controller: weightController,
                    validator: (value){
                      if(value == null||value.isEmpty){
                        return "Weight field can't be empty";
                      }
                      return null;

                    },
                  ),
                  SizedBox(height: 40),
                  SizedBox(
                    width: 400,
                    child: ElevatedButton(
                      onPressed: () async {

                        if(key.currentState!.validate()){
                          var res = await fetchBmi(
                            height:heightController.text,
                            weight:weightController.text,
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
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Color(0xff484783),
                      ),

                      child: const Text(
                        "Calculate BMI",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
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

  Future<Response<dynamic>> fetchBmi({required String height,required String weight}) async {
    Dio apiObj = Dio();
    try {
      var res = await apiObj.get(
        "https://api.apiverve.com/v1/bmicalculator?weight=$weight&height=$height&unit=metric",
        options: Options(
          headers: {"x-api-key": "ff870e7d-5d78-4309-82bc-0b5e0347db0f"},
        ),
      );
      return res;
    } on DioException catch (ec) {
      throw ec;

    } catch (e) {
      throw e;


    }
  }
}
