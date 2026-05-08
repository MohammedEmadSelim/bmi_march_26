import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:bmi_march_26/model/bmi_model.dart';
import 'package:bmi_march_26/screens/res_screen.dart';
import 'package:bmi_march_26/widgets/calculated_text_form.dart';
import 'package:bmi_march_26/widgets/custom_text_form.dart';
import 'package:bmi_march_26/widgets/gender_selection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff484783)),
        useMaterial3: true,
      ),
      // نقطة البداية الآن هي شاشة الترحيب
      home: const WelcomeScreen(),
    );
  }
}

// --- شاشة الترحيب (Welcome Screen) ---
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          // تأكدي من وجود الصورة في مجلد assets وتسجيلها في pubspec.yaml
          Expanded(child: Image.asset('assets/first_img.png', fit: BoxFit.contain)),
          Container(
            width: double.infinity, // أفضل من الرقم الثابت لتجنب الـ Overflow
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            decoration: const BoxDecoration(
              color: Color(0xff7876CD),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Know Your Body Better, Get Your BMI Score in Less Than a Minute!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'It takes just 30 seconds – and your health is worth it!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 30),
                const Divider(color: Colors.white24),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const InfoScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      backgroundColor: const Color(0xff484783),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// --- شاشة إدخال البيانات (Info Screen) ---
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
                        dateController.text = res.toIso8601String().substring(0, 10);
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
                    validator: (value) => (value == null || value.isEmpty) ? "Height is required" : null,
                  ),
                  const SizedBox(height: 14),
                  CalculatedTextFormField(
                    title: "Your Weight (kg)",
                    hint: "e.g. 70",
                    controller: weightController,
                    validator: (value) => (value == null || value.isEmpty) ? "Weight is required" : null,
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : () async {
                        if (key.currentState!.validate()) {
                          setState(() => isLoading = true);
                          try {
                            var res = await fetchBmi(
                              height: heightController.text,
                              weight: weightController.text,
                            );
                            var bmi = BmiResponse.fromJson(res.data);
                            if (!mounted) return;
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
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Error: $e")),
                            );
                          } finally {
                            setState(() => isLoading = false);
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        backgroundColor: const Color(0xff484783),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text("Calculate BMI", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
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

  Future<Response<dynamic>> fetchBmi({required String height, required String weight}) async {
    Dio apiObj = Dio();
    try {
      return await apiObj.get(
        "https://api.apiverve.com/v1/bmicalculator?weight=$weight&height=$height&unit=metric",
        options: Options(headers: {"x-api-key": "6e197938-ab34-4cb9-bbd9-c82602f67767"}),
      );
    } on DioException catch (e) {
      throw e.message ?? "Network error";
    }
  }
}