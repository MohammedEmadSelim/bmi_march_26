import 'package:bmi_march_26/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
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

              Row(
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
              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 130,
                    decoration: BoxDecoration(
                      color: Color(0xffB3B2EA).withAlpha(50),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.end,

                      children: [
                        Image.asset("assets/male.png"),
                      ],
                    ) ,
                  ),
                  SizedBox(width: 40,),
                  Container(
                    width: 120,
                    height: 130,
                    decoration: BoxDecoration(
                      color: Color(0xffB3B2EA).withAlpha(50),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset("assets/female.png",),
                      ],
                    ) ,

                  ),

                ],
              ),
              SizedBox(height: 40),
              SizedBox(
                width: 400,
                child: ElevatedButton(
                  onPressed: () {
                    // navigation to info screen
                    print(nameController.text);
                    print(dateController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Color(0xff484783),
                  ),

                  child: const Text(
                    "Get Started",
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
    );
  }
}
