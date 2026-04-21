import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HeightAndWeightTextField extends StatelessWidget {
  const HeightAndWeightTextField({
    super.key,
    required this.heightController,
  });

  final TextEditingController heightController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      textAlign: TextAlign.center,
      controller: heightController,
      decoration: InputDecoration(
        prefixIcon: GestureDetector(
          onTap: () {
            var res = int.tryParse(heightController.text);
            if (res != null) {
              var finalRes = --res;

              heightController.text = finalRes.toString();
            }
          },
          child: Icon(Icons.remove),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            var res = int.tryParse(heightController.text);
            if (res != null) {
              var finalRes = ++res;

              heightController.text = finalRes.toString();
            }
          },
          child: Icon(Icons.add),
        ),
        hintText: 'your height',
        filled: true,
        fillColor: const Color(0xffE9E7EA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}