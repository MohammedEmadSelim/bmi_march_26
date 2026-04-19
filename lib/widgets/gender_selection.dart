



import 'package:flutter/material.dart';

class GenderSelection extends StatefulWidget {
  GenderSelection({super.key, required this.selectedGender});

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
      ],
    );
  }
}
