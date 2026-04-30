import 'package:bmi/const/color.dart';
import 'package:bmi/cubit/name_cubit/name_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNameInput extends StatelessWidget {
  const CustomNameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // النص (Label) الموجود فوق الحقل
        Text(
          "Name",
          style: TextStyle(
            fontFamily: 'DM Sans',
            fontSize: 16,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        
        // حقل الإدخال
        TextField(
          // ربط الحقل بالـ Cubit هنا مباشرة
          onSubmitted: (value) {
            context.read<NameCubit>().updateName(value);
          },
          decoration: InputDecoration(
            // تصميم الحقل ليكون مطابقاً للصورة
            filled: true,
            fillColor:  Appcolor.primcolor, // لون مقارب جداً للصورة
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none, // إخفاء الحدود العادية
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 0.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.blue.shade300, width: 1),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
      ],
    );
  }
}