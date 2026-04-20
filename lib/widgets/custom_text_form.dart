import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  CustomTextForm({
    super.key,
    this.controller,
    required this.label,
    required this.enable,
    this.onTap
  });
  TextEditingController? controller = TextEditingController();
  final String label;
  final bool enable;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(children: [Text('   $label')]),
        SizedBox(height: 5),
        TextFormField(
          onTap: onTap,
          enabled: enable,
          controller: controller,
          decoration: InputDecoration(
            hintText: label,
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
