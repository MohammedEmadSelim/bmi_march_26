import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  CustomTextForm({
    super.key,
    this.controller,
    required this.label,
    required this.readOnly,
    this.onTap, required this.hint
  });
  TextEditingController? controller = TextEditingController();
  final String label;
  final String hint;
  final bool readOnly;
   final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(children: [Text('   $label')]),
        SizedBox(height: 5),
        TextFormField(
          onTap: onTap,
          readOnly: readOnly,
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: const Color(0xffE9E7EA),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
