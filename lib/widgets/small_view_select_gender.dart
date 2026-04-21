import 'package:bmi/widgets/Continer_gender.dart';
import 'package:flutter/material.dart';

class small_view_select_gender extends StatefulWidget {
  const small_view_select_gender({super.key});

  @override
  State<small_view_select_gender> createState() =>
      _small_view_select_genderState();
}

class _small_view_select_genderState extends State<small_view_select_gender> {
  int? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Continer_gender(
          label: 'Male',
          imagePath: 'assets/images/bmi_nti/Group.png',
          isSelected: selectedGender == 0,
          onTap: () {
            setState(() {
              selectedGender = 0;
            });
          },
        ),
        SizedBox(width: 20),
        Continer_gender(
          label: 'Female',
          imagePath: 'assets/images/bmi_nti/female.png',
          isSelected: selectedGender == 1,
          onTap: () {
            setState(() {
              selectedGender = 1;
            });
          },
        ),
      ],
    );
  }
}
