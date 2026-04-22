import 'dart:developer';

import 'package:bmi/cubit/gender_cubit/gender_cubit.dart';
import 'package:bmi/widgets/Buttom_send.dart';
import 'package:bmi/widgets/custom_text_input_num.dart';
import 'package:bmi/widgets/small_view_select_gender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';

import '../widgets/Textformfield.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController dateEditingController = TextEditingController();

  final TextEditingController heightEditingController = TextEditingController(
    text: '0',
  );
  final TextEditingController weightEditingController = TextEditingController(
    text: '0',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 15, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 13),
              Center(
                child: Text(
                  'B M I',
                  style: TextStyle(color: Colors.green, fontSize: 40),
                ),
              ),
              Text_form_field_custom(
                title: 'Name',
                nameController: nameEditingController,
                readonly: false,
              ),
              SizedBox(height: 10),
              Text_form_field_custom(
                title: 'Birth Date',
                nameController: dateEditingController,
                readonly: true,
                onTap: () async {
                  var result = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2050),
                  );
                  if (result != null) {
                    // 'yyyy-MM-dd'
                    String formattedDate = DateFormat(
                      'yyyy-MM-dd',
                    ).format(result);
                    dateEditingController.text = formattedDate;
                  }
                },
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'Choose Gender',
                    style: TextStyle(color: Colors.grey, fontSize: 17),
                  ),
                ],
              ),
              SizedBox(height: 10),
              small_view_select_gender(),
              SizedBox(height: 12),
              CustomTextInputNum_Height(
                controller: heightEditingController,
                title: 'Your Height(cm)',
              ),
              SizedBox(height: 10),
              CustomTextInputNum_Weight(
                controller: weightEditingController,
                title: 'Your Weight(kg)',
              ),
              SizedBox(height: 12,),
              Buttom_send(on_pers: (){
                String gender = context.read<GenderCubit>().state == 0 ? 'Male' : context.read<GenderCubit>().state == 1 ? 'Female' : 'Not Selected';
                log(gender);
                log('Name: ${nameEditingController.text}');
                log('Birth Date: ${dateEditingController.text}');
                log('Height: ${heightEditingController.text} cm');
                log('Weight: ${weightEditingController.text} kg');
              }, text: 'Calculate BMI')
            ],
          ),
        ),
      ),
    );
  }
}
