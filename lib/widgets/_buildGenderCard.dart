import 'package:bmi/const/color.dart';
import 'package:bmi/cubit/gender_cubit/gender_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class buildGenderCard extends StatelessWidget {
  const buildGenderCard({
    super.key,
    required this.context,
    required this.label,
    required this.imagePath,
    required this.isSelected,
  });

  final BuildContext context;
  final String label;
  final String imagePath;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // بنبعت الاختيار للـ Cubit
        context.read<GenderCubit>().selectGender(label);
      },
      child: Column(
        children: [
          Container(
            width: 112,
            height: 100,
            decoration: BoxDecoration(
              color: Appcolor.primcolor,
              borderRadius: BorderRadius.circular(16),
              // التحديد الأخضر بيظهر لو isSelected بـ true
              border: Border.all(
                color: isSelected ? Colors.green : Colors.transparent,
                width: 2.5,
              ),
            ),
            child: Center(
              child: Image.asset(
                imagePath,
                width: 100,
                height: 100,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: isSelected ? Colors.green : Colors.black54,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontFamily: 'DM Sans',
            ),
          ),
        ],
      ),
    );
  }
}