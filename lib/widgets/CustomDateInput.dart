import 'package:bmi/const/color.dart';
import 'package:bmi/cubit/bitrh_date_cubit/birth_date_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDateInput extends StatefulWidget {
  const CustomDateInput({super.key});

  @override
  State<CustomDateInput> createState() => _CustomDateInputState();
}

class _CustomDateInputState extends State<CustomDateInput> {
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  // دالة فتح التقويم
  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900), // أقدم تاريخ ممكن
      lastDate: DateTime.now(), // بنمنع اختيار تاريخ في المستقبل
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Color.fromARGB(255, 255, 0, 0), // لون الهيدر والزراير عشان يمشي مع تصميمك
            ),
          ),
          child: child!,
        );
      },
    );

// بعد ما تجيب الـ pickedDate وتعمل له format
if (pickedDate != null) {
  String formattedDate = "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
  
  // هنا بننادي الكيوبيت ونبعت القيمة
  context.read<BirthDateCubit>().updateDate(formattedDate);
  
  _dateController.text = formattedDate; // عشان يظهر لليوزر في الـ TextField
}
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          'Birth Date',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
            fontFamily: 'DM Sans',
          ),
        ),
         SizedBox(height: 8),
        TextFormField(
          controller: _dateController,
          readOnly: true, // مهم جداً عشان الكيبورد متفتحش
          onTap: () => _selectDate(context),
          decoration: InputDecoration(
            hintText: 'YYYY-MM-DD',
            filled: true,
            fillColor: Appcolor.primcolor, // لون مقارب للـ UI بتاعك
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            suffixIcon: const Icon(Icons.calendar_today, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}