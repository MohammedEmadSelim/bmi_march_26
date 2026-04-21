import 'package:bmi/cubit/gender_cubit/gender_cubit.dart';
import 'package:bmi/widgets/Continer_gender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class small_view_select_gender extends StatelessWidget {
  small_view_select_gender({super.key});
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<GenderCubit, int?>(
      builder: (context, selectedGender) {
         return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Continer_gender(
          label: 'Male',
          imagePath: 'assets/images/bmi_nti/Group.png',
          isSelected: selectedGender == 0,
          onTap: () {
            context.read<GenderCubit>().select(0);
          },
        ),
        SizedBox(width: 20),
        Continer_gender(
          label: 'Female',
          imagePath: 'assets/images/bmi_nti/female.png',
          isSelected: selectedGender == 1,
          onTap: () {
            context.read<GenderCubit>().select(1);
          },
        ),
        // });
      ],
    );
  }); 
  }
}