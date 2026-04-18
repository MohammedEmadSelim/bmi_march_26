import 'package:bmi/cubit/gender_cubit/gender_cubit.dart';
import 'package:bmi/widgets/_buildGenderCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 // تأكد من مسار الفايل

class GenderSelector extends StatelessWidget {
  const GenderSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          'Choose Gender',
          style: TextStyle(
         fontFamily: 'DM Sans',
            fontSize: 16,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        // هنا بنستخدم BlocBuilder عشان نتصنت على GenderCubit
        BlocBuilder<GenderCubit, String>(
          builder: (context, selectedGender) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildGenderCard(context: context, label: 'Male', imagePath: 'assets/images/bmi_nti/Group.png', isSelected: selectedGender == 'Male'),
                buildGenderCard(context: context, label: 'Female', imagePath: 'assets/images/bmi_nti/female.png', isSelected: selectedGender == 'Female'),
              ],
            );
          },
        ),
      ],
    );
  }

  // دالة بناء الكارت
}

