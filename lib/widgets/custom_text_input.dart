import 'package:bmi/const/color.dart';
import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    super.key,
    required this.controller,
    required this.text, this.on_tap, this.read_only = false,
  });
  final TextEditingController controller;
  final String text;
  final Function()? on_tap;
  final bool? read_only;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // النص (Label) الموجود فوق الحقل
        Text(
          text,
          style: TextStyle(
            fontFamily: 'DM Sans',
            fontSize: 16,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),

        TextFormField(
          controller: controller,
          onTap: on_tap,
          readOnly: read_only!,
          decoration: InputDecoration(
            fillColor: Appcolor.primcolor,
            filled: true,
            border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
               borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none
            )
          ),
        ),

        // حقل الإدخال
        //   TextField(
        //     // ربط الحقل بالـ Cubit هنا مباشرة
        //     onSubmitted: (value) {
        //       context.read<NameCubit>().updateName(value);
        //     },
        //     decoration: InputDecoration(
        //       // تصميم الحقل ليكون مطابقاً للصورة
        //       filled: true,
        //       fillColor:  Appcolor.primcolor, // لون مقارب جداً للصورة
        //       border: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(8.0),
        //         borderSide: BorderSide.none, // إخفاء الحدود العادية
        //       ),
        //       enabledBorder: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(8.0),
        //         borderSide: BorderSide(color: Colors.grey.shade300, width: 0.5),
        //       ),
        //       focusedBorder: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(8.0),
        //         borderSide: BorderSide(color: Colors.blue.shade300, width: 1),
        //       ),
        //       contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        //     ),
        //   ),
      ],
    );
  }
}
