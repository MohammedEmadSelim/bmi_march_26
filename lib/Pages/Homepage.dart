import 'package:bmi/Models/bmi_model.dart';
import 'package:bmi/Pages/calculate_bmi_page.dart';
import 'package:bmi/cubit/gender_cubit/gender_cubit.dart';
import 'package:bmi/cubit/height_cubit/hight_cubit.dart';
import 'package:bmi/cubit/weight_cubit/weight_cubit.dart';
import 'package:bmi/widgets/Buttom_send.dart';
import 'package:bmi/widgets/CustomInputCounter.dart';
import 'package:bmi/widgets/custom_text_input_num.dart';
import 'package:bmi/widgets/custoum_text_input.dart';
import 'package:bmi/widgets/small_view_select_gender.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';

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
              CustomTextInput(controller: nameEditingController, text: 'Name'),
              SizedBox(height: 10),
              CustomTextInput(
                controller: dateEditingController,
                text: 'Birth Date',
                read_only: true,
                on_tap: () async {
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
              BlocBuilder<HeightCubit, int>(
                builder: (context, state) {
                  return CustomInputCounter(
                    label: 'Your Height(cm)',
                    value: state,
                    onIncrement: () => context.read<HeightCubit>().increment(),
                    onDecrement: () => context.read<HeightCubit>().decrement(),
                  );
                },
              ),
              // CustomTextInputNum_Height(
              //   controller: heightEditingController,
              //   title: 'Your Height(cm)',
              // ),
              SizedBox(height: 10),
                  BlocBuilder<WeightCubit, int>(
                        builder: (context, state) {
                          return CustomInputCounter(
                            label: 'Your Weight(kg)',
                            value: state,
                            onIncrement:
                                () => context.read<WeightCubit>().increment(),
                            onDecrement:
                                () => context.read<WeightCubit>().decrement(),
                          );
                        },
                      ),
              // CustomTextInputNum_Weight(
              //   controller: weightEditingController,
              //   title: 'Your Weight(kg)',
              // ),
              SizedBox(height: 20),
                 Buttom_send(
                        on_pers: ()async {
                          String name,  birth_date;
                          var height, weight,gender;
                          name = nameEditingController.text;
                          birth_date = dateEditingController.text;
                          gender = context.read<GenderCubit>().state;
                          height = context.read<HeightCubit>().state;
                          weight = context.read<WeightCubit>().state;
                           String gender_s =
                      context.read<GenderCubit>().state == 0
                          ? 'Male'
                          : context.read<GenderCubit>().state == 1
                          ? 'Female'
                          : 'Not Selected';
                          if (name != '' &&
                              birth_date != '' &&
                              gender_s != '' &&
                              height != 0 &&
                              weight != 0) {
                       var res = await fetchBmi(height: height.toString(), weight: weight.toString());
                       var bmi = BmiResponse.fromJson(res.data);  
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (c) {
                                  return CalculateBmiPage(
                                   bmi: bmi,
                                   name: name,
                                   birthDate: birth_date,
                                   gender: gender_s,
                                  );
                                },
                              ),
                            );
                          } else {
                            // إظهار الرسالة في نص الشاشة لو في بيانات ناقصة
                            showDialog(
                              context: context,
                              builder:
                                  (context) => AlertDialog(
                                    title: const Text(
                                      'Error',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    content: const Text(
                                      'Please fill in all the data to calculate BMI',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('OK'),
                                      ),
                                    ],
                                  ),
                            );
                          }
                        },
                        text: 'Calculate BMI',
                      ),
              // Buttom_send(
              //   on_pers: () async {
              //     String gender =
              //         context.read<GenderCubit>().state == 0
              //             ? 'Male'
              //             : context.read<GenderCubit>().state == 1
              //             ? 'Female'
              //             : 'Not Selected';
              //     // log(gender);
              //     // log('Name: ${nameEditingController.text}');
              //     // log('Birth Date: ${dateEditingController.text}');
              //     // log('Height: ${heightEditingController.text} cm');
              //     // log('Weight: ${weightEditingController.text} kg');
              //   },
              //   text: 'Calculate BMI',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}  Future<Response<dynamic>> fetchBmi({required String height,required String weight}) async {
    Dio apiObj = Dio();
    try {
      var res = await apiObj.get(
        "https://api.apiverve.com/v1/bmicalculator?weight=$weight&height=$height&unit=metric",
        options: Options(
          headers: {"x-api-key": "ff870e7d-5d78-4309-82bc-0b5e0347db0f"},
        ),
      );
      return res;
    } on DioException catch (ec) {
      throw ec;
      print(ec.response);

    } catch (e) {
      throw e;

      print("========>${e}");

    }
  }

