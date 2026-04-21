
import 'package:flutter/material.dart';

class Text_form_field_custom extends StatelessWidget {
  const Text_form_field_custom({super.key, required this.nameController, required this.title,this.onTap, this.readonly});
  final TextEditingController nameController;
  final String title;
  final void Function()? onTap;
  final bool? readonly;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.grey, fontSize: 17),
            ),
          ],
        ),
        SizedBox(height: 8,),
        TextFormField(
          controller: nameController,
          onTap: onTap,
          readOnly: readonly!,
          decoration: InputDecoration(
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
