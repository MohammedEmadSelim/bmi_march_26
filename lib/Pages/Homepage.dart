import 'package:bmi/cubit/gender_cubit/gender_cubit.dart';
import 'package:bmi/widgets/small_view_select_gender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../widgets/Textformfield.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController dateEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenderCubit(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 15, vertical: 20),
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
              ],
            ),
          ),   
        ),
    );
  }
}

