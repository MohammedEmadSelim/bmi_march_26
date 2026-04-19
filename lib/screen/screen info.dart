import 'package:bmi_march_26/widget/custum%20text.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  int? gender;

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
              SizedBox(height: 20),
              GenderSelection(
                selectedGender: (value) {
                  print(value);
                  gender = value;
                },
              ),
              SizedBox(height: 40),
              SizedBox(
                width: 400,
                child: ElevatedButton(
                  onPressed: () {
                    // navigation to info screen
                    print(nameController.text);
                    print(dateController.text);
                    print(gender);
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

class GenderSelection extends StatefulWidget {
  GenderSelection({super.key, required this.selectedGender});

  final ValueChanged<int> selectedGender;

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  int genderSelection = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                print("male");
                genderSelection = 0;
                widget.selectedGender(genderSelection);
                setState(() {});
              },
              child: Container(
                width: 120,
                height: 130,
                decoration: BoxDecoration(
                  color: Color(0xffB3B2EA).withAlpha(50),
                  borderRadius: BorderRadius.circular(16),
                  border: genderSelection == 0
                      ? Border.all(color: Colors.lightGreenAccent, width: 2)
                      : null,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Image.asset("assets/male.png")],
                ),
              ),
            ),
            SizedBox(width: 40),
            GestureDetector(
              onTap: () {
                print("female");
                genderSelection = 1;
                widget.selectedGender(genderSelection);
                setState(() {});
              },
              child: Container(
                width: 120,
                height: 130,
                decoration: BoxDecoration(
                  color: Color(0xffB3B2EA).withAlpha(50),
                  borderRadius: BorderRadius.circular(16),
                  border: genderSelection == 1
                      ? Border.all(color: Colors.lightGreenAccent, width: 2)
                      : null,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Image.asset("assets/female.png")],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 40),
        SizedBox(
          width: 400,
          child: ElevatedButton(
            onPressed: () {
              // print(nameController.text);
              // print(dateController.text);
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
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     children: [
  //       Row(
  //         children: [
  //           Text(
  //             "Choose Gender",
  //             style: TextStyle(
  //               fontSize: 14,
  //               fontWeight: FontWeight.w500,
  //               color: Color(0xff333333),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  //   // ],
  //   // ),
  //   // SizedBox(height: 20),
  //   //
  //   // Row(
  //   // mainAxisAlignment: MainAxisAlignment.center,
  //   // children: [
  //   // Container(
  //   // width: 120,
  //   // height: 130,
  //   // decoration: BoxDecoration(
  //   // color: Color(0xffB3B2EA).withAlpha(50),
  //   // borderRadius: BorderRadius.circular(16),
  //   // ),
  //   // child:Column(
  //   // mainAxisAlignment: MainAxisAlignment.end,
  //   // Row(
  //   // mainAxisAlignment: MainAxisAlignment.center,
  //   // children: [
  //   // GestureDetector(
  //   // onTap: () {
  //   // print("male");
  //   // genderSelection = 0;
  //   // widget.selectedGender(genderSelection);
  //   // setState(() {});
  //   // },
  //   // child: Container(
  //   // width: 120,
  //   // height: 130,
  //   // decoration: BoxDecoration(
  //   // color: Color(0xffB3B2EA).withAlpha(50),
  //   // borderRadius: BorderRadius.circular(16),
  //   // border: genderSelection == 0
  //   // ? Border.all(color: Colors.lightGreenAccent, width: 2)
  //   //     : null,
  //   // ),
  //   // child: Column(
  //   // mainAxisAlignment: MainAxisAlignment.end,
  //   //
  //   // children: [
  //   // Image.asset("assets/male.png"),
  //   // ],
  //   // ) ,
  //   // ),
  //   // SizedBox(width: 40,),
  //   // Container(
  //   // width: 120,
  //   // height: 130,
  //   // decoration: BoxDecoration(
  //   // color: Color(0xffB3B2EA).withAlpha(50),
  //   // borderRadius: BorderRadius.circular(16),
  //   // ),
  //   // child:Column(
  //   // mainAxisAlignment: MainAxisAlignment.end,
  //   // children: [
  //   // Image.asset("assets/female.png",),
  //   // ],
  //   // ) ,
  //   //
  //   // ),
  //   //
  //   // ],
  //   // children: [Image.asset("assets/male.png")],
  //   // ),
  //   // ),
  //   // ),
  //   //
  //   // SizedBox(width: 40),
  //   // GestureDetector(
  //   // onTap: () {
  //   // print("female");
  //   // genderSelection = 1;
  //   // widget.selectedGender(genderSelection);
  //   // setState(() {});
  //   // },
  //   // child: Container(
  //   // width: 120,
  //   // height: 130,
  //   // decoration: BoxDecoration(
  //   // color: Color(0xffB3B2EA).withAlpha(50),
  //   // borderRadius: BorderRadius.circular(16),
  //   // border: genderSelection == 1
  //   // ? Border.all(color: Colors.lightGreenAccent, width: 2)
  //   //     : null,
  //   // ),
  //   // child: Column(
  //   // mainAxisAlignment: MainAxisAlignment.end,
  //   // children: [Image.asset("assets/female.png")],
  //   // ),
  //   // ),
  //   // SizedBox(height: 40),
  //   // SizedBox(
  //   // width: 400,
  //   // child: ElevatedButton(
  //   // onPressed: () {
  //   // // navigation to info screen
  //   // print(nameController.text);
  //   // print(dateController.text);
  //   // },
  //   // style: ElevatedButton.styleFrom(
  //   // shape: RoundedRectangleBorder(
  //   // borderRadius: BorderRadius.circular(12),
  //   // ),
  //   // backgroundColor: Color(0xff484783),
  //   // ),
  //   //
  //   // child: const Text(
  //   // "Get Started",
  //   // style: TextStyle(
  //   // color: Colors.white,
  //   // fontSize: 18,
  //   // fontWeight: FontWeight.w600,
  //   // ),
  //   // ),
  //   // ),
  //   // ),
  //   // ],
  //   // ),
  //   // ),
  //   // ),
  //   // ),
  //   // ],
  //   // )
  //   // ,
  //   // ]
  //   // ,
  //   // );
  // }
}
