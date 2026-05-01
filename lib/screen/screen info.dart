import 'package:bmi_march_26/screen/result_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/model.dart';
import '../widget/custom text.dart';

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

  int selectedGender = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                  hint: "Name",
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
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2030),
                    );
                    if (res != null) {
                      String date = res.toIso8601String();
                      dateController.text = date.substring(0, 10);
                    }
                  },
                ),
                const SizedBox(height: 30),

                GenderSelection(
                  selectedGender: (value) {
                    selectedGender = value;
                  },
                ),

                const SizedBox(height: 30),

                CalculatedTextFormField(
                  controller: heightController,
                  title: "Height (cm)",
                  hint: "Enter height",String: null,

                ),
                const SizedBox(height: 20),

                CalculatedTextFormField(
                  controller: weightController,
                  title: "Weight (kg)",
                  hint: "Enter weight", String: null,
                ),

                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      print(nameController.text);
                      print(dateController.text);
                      print(heightController.text);
                      print(weightController.text);
                      print(selectedGender);
                      var res = await fetchBmi();
                      var bmi = BmiResponse.fromJson(res.data);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => resultscreen(bmi: bmi,      name: nameController.text,
                            birthdate: dateController.text,),
                        ),
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: const Color(0xff484783),
                    ),
                    child: const Text(
                      "Calculated BMI",
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
    );
  }
}



class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key, required this.selectedGender});

  final ValueChanged<int> selectedGender;

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  int genderSelection = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Text(
              "Choose Gender",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff333333),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                genderSelection = 0;
                widget.selectedGender(genderSelection);
                setState(() {});
              },
              child: Container(
                width: 120,
                height: 130,
                decoration: BoxDecoration(
                  color: const Color(0xffB3B2EA).withAlpha(50),
                  borderRadius: BorderRadius.circular(16),
                  border: genderSelection == 0
                      ? Border.all(color: Colors.lightGreenAccent, width: 2)
                      : null,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset("assets/male.png"),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 40),
            GestureDetector(
              onTap: () {
                genderSelection = 1;
                widget.selectedGender(genderSelection);
                setState(() {});
              },
              child: Container(
                width: 120,
                height: 130,
                decoration: BoxDecoration(
                  color: const Color(0xffB3B2EA).withAlpha(50),
                  borderRadius: BorderRadius.circular(16),
                  border: genderSelection == 1
                      ? Border.all(color: Colors.lightGreenAccent, width: 2)
                      : null,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset("assets/female.png"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}



class CalculatedTextFormField extends StatefulWidget {
  const CalculatedTextFormField({
    super.key,
    required this.controller,
    required this.title,
    required this.hint, required String
  });

  final TextEditingController controller;
  final String title;
  final String hint;

  @override
  State<CalculatedTextFormField> createState() =>
      _CalculatedTextFormFieldState();
}

class _CalculatedTextFormFieldState
    extends State<CalculatedTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff333333),
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),

        TextFormField(
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          textAlign: TextAlign.center,
          controller: widget.controller,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                var res = int.tryParse(widget.controller.text);
                if (res != null) {
                  widget.controller.text = (++res).toString();
                }
              },
              child: const Icon(Icons.add),
            ),
            prefixIcon: GestureDetector(
              onTap: () {
                var res = int.tryParse(widget.controller.text);
                if (res != null) {
                  widget.controller.text = (--res).toString();
                }
              },
              child: const Icon(Icons.remove),
            ),
            hintText: widget.hint,
            fillColor: const Color(0xffB3B2EA).withAlpha(50),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
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