import 'package:bmi_march_26/model/bmi_model.dart';
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

  int? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
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
                ),
                SizedBox(height: 14),
                CalculatedTextFormField(
                  title: "Your Weight(cm)",
                  hint: "Your Weight",
                  controller: weightController,
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: 400,
                  child: ElevatedButton(
                    onPressed: () async {
                      // navigation to info screen
                      print(nameController.text);
                      print(dateController.text);
                      print(gender);
                      print(heightController.text);
                      print(weightController.text);

                      var res = await fetchBmi();
                      var bmi = BmiResponse.fromJson(res.data);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResScreen(res: bmi),
                        ),
                      );
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
    );
  }

  Future<Response<dynamic>> fetchBmi() async {
    Dio apiObj = Dio();
    try {
      var res = await apiObj.get(
        "https://api.apiverve.com/v1/bmicalculator?weight=70&height=170&unit=metric",
        options: Options(
          headers: {"x-api-key": "ff870e7d-5d78-4309-82bc-0b5e0347db0f"},
        ),
      );
      return res;
    } on DioException catch (ec) {
      throw ec;
      print(ec.response);
    } catch (e) {
      throw e;

      print("========>${e}");
    }
  }
}

class ResScreen extends StatelessWidget {
  const ResScreen({super.key, this.res});

  final BmiResponse? res;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(res?.data?.bmi.toString() ?? "no data")));
  }
}