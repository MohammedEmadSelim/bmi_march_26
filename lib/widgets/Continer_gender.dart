import 'package:flutter/material.dart';

class Continer_gender extends StatelessWidget {
  final String label;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap; // إضافة callback لإخبار الأب عند الضغط

  const Continer_gender({
    super.key,
    required this.label,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap, // استدعاء الوظيفة عند الضغط
          child: Container(
            width: 135,
            height: 120,
            decoration: BoxDecoration(
              border: Border.all(
                  color: isSelected ? Colors.green : Colors.grey, width: 3),
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xffB3B2EA).withAlpha(50),
            ),
            child: Image.asset(imagePath),
          ),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 15)),
      ],
    );
  }
}