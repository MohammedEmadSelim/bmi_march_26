import 'package:bmi/const/color.dart';
import 'package:bmi/widgets/Icons_buttom.dart';
import 'package:flutter/material.dart';

class CustomInputCounter extends StatelessWidget {
  final String label;
  final double value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CustomInputCounter({
    super.key,
    required this.label,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label, // استخدام الـ label الممرر
          style: TextStyle(
            fontFamily: 'DM Sans',
            fontSize: 16,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.center,
          height: 45,
          width: 340,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Appcolor.primcolor,
          ),
          child: Row(
            children: [
              const Spacer(flex: 1),
              Icons_buttom(
                on_pers: onDecrement, // تنفيذ ميثود النقص
                iconData: Icons.remove,
              ),
              const Spacer(flex: 7),
              Text(
                '$value', // عرض القيمة الممررة
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(flex: 7),
              Icons_buttom(
                on_pers: onIncrement, // تنفيذ ميثود الزيادة
                iconData: Icons.add,
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ],
    );
  }
}