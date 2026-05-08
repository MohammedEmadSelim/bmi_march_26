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
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Form(
              key: key,
              child: Column(
                children: [
                  const Text(
                    "BMI",
                    style: TextStyle(
                      letterSpacing: 10,
                      fontWeight: FontWeight.w900,
                      fontSize: 36,
                      color: Color(0xff01502E),
                    ),
                  ),
                  const SizedBox(height: 45),

                  CustomTextFormField(
                    nameController: nameController,
                    title: "Name",
                    hint: "Enter your name",
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 20),

                  CustomTextFormField(
                    nameController: dateController,
                    hint: "Birthdate",
                    title: "Birthdate",
                    readOnly: true,
                    onTap: () async {
                      var res = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime.now(),
                      );
                      if (res != null) {
                        String date = res.toIso8601String();
                        dateController.text = date.substring(0, 10);
                      }
                    },
                  ),
                  const SizedBox(height: 36),

                  GenderSelection(
                    selectedGender: (value) {
                      gender = value;
                    },
                  ),

                  const SizedBox(height: 40),
                  CalculatedTextFormField(
                    title: "Your Height (cm)",
                    hint: "e.g. 170",
                    controller: heightController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Height field can't be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),
                  CalculatedTextFormField(
                    title: "Your Weight (kg)",
                    hint: "e.g. 70",
                    controller: weightController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Weight field can't be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40),

                  SizedBox(
                    width: 400,
                    child: ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () async {
                        if (key.currentState!.validate()) {
                          // ✅ حفظ الـ context قبل الـ async
                          final navigator = Navigator.of(context);
                          final messenger =
                          ScaffoldMessenger.of(context);

                          setState(() {
                            isLoading = true;
                          });

                          try {
                            var res = await fetchBmi(
                              height: heightController.text,
                              weight: weightController.text,
                            );

                            var bmi = BmiResponse.fromJson(res.data);

                            navigator.push(
                              MaterialPageRoute(
                                builder: (context) => ResScreen(
                                  bmi: bmi,
                                  name: nameController.text,
                                  birthdate: dateController.text,
                                ),
                              ),
                            );
                          } catch (e) {
                            messenger.showSnackBar(
                              SnackBar(content: Text("Error: $e")),
                            );
                          } finally {
                            if (mounted) {
                              setState(() {
                                isLoading = false;
                              });
                            }
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: const Color(0xff484783),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: isLoading
                          ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                          : const Text(
                        "Calculate BMI",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<Response<dynamic>> fetchBmi({
    required String height,
    required String weight,
  }) async {
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
      throw "Network error: ${ec.message}";
    } catch (e) {
      throw "An unexpected error occurred";
    }
  }
}