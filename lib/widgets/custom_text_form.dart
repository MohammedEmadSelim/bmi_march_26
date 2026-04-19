import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.nameController,
    required this.title,
    required this.hint,
    this.readOnly = false,
    this.onTap, this.onChanged,
  });

  final TextEditingController nameController;
  final String title;
  final String hint;
  final bool? readOnly;
  final void Function(String)? onChanged;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff333333),
              ),
            ),
          ],
        ),
        SizedBox(height: 18),
        TextFormField(
          onChanged:onChanged,
          controller: nameController,
          readOnly: readOnly!,
          onTap: onTap,
          decoration: InputDecoration(
            hintText: hint,
            fillColor: Color(0xffB3B2EA).withAlpha(50),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}