import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatedTextFormField extends StatelessWidget {
  const CalculatedTextFormField({
    super.key,
    required this.controller,
    required this.title,
    required this.hint,
    required this.validator,
  });

  final TextEditingController controller;
  final String title;
  final String hint;
  final String? Function(String?)? validator;


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
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          textAlign: TextAlign.center,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                var res = int.tryParse(controller.text);
                if (res != null) {
                  var finalRes = ++res;

                  controller.text = finalRes.toString();
                }
              },
              child: Icon(Icons.add),
            ),
            prefixIcon: GestureDetector(

              onTap: () {
                var res = int.tryParse(controller.text);
                if (res != null) {
                  var finalRes = --res;

                  controller.text = finalRes.toString();
                }
              },
              child: Icon(Icons.remove),
            ),
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
