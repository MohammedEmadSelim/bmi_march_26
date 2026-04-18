import 'package:bmi/class/human.dart';
import 'package:bmi/cubit/bitrh_date_cubit/birth_date_cubit.dart';
import 'package:bmi/cubit/gender_cubit/gender_cubit.dart';
import 'package:bmi/cubit/hight_cubit/hight_cubit.dart';
import 'package:bmi/cubit/name_cubit/name_cubit.dart';
import 'package:bmi/cubit/weight_cubit/weight_cubit.dart';
import 'package:bmi/pages/calculate_bmi_page.dart';
import 'package:bmi/widgets/Buttom_send.dart';

import 'package:bmi/widgets/CustomDateInput.dart';
import 'package:bmi/widgets/Custom_input.dart';
import 'package:bmi/widgets/gender_select.dart';
import 'package:bmi/widgets/hi_we.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NameCubit>(create: (context) => NameCubit()),
        BlocProvider<BirthDateCubit>(create: (context) => BirthDateCubit()),
        BlocProvider<GenderCubit>(create: (context) => GenderCubit()),
        BlocProvider<HightCubit>(create: (context) => HightCubit()),
        BlocProvider<WeightCubit>(create: (context) => WeightCubit()),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'B M I',
                        style: TextStyle(
                          color: Color(0xff1A6143),
                          fontSize: 50,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w900
                        ),
                      ),
                    ),
                    SizedBox(height: 2),
                    CustomNameInput(),
                    SizedBox(height: 20),
                    CustomDateInput(),
                    SizedBox(height: 20),
                    GenderSelector(),
                    SizedBox(height: 20),
                    // InputHight(),
                    BlocBuilder<HightCubit, double>(
                      builder: (context, state) {
                        return CustomInputCounter(
                          label: 'Your Height(cm)',
                          value: state,
                          onIncrement:
                              () => context.read<HightCubit>().increment(),
                          onDecrement:
                              () => context.read<HightCubit>().decrement(),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    BlocBuilder<WeightCubit, double>(
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
                    SizedBox(height: 20),
                    Buttom_send(
                      on_pers: () {
                        var name, gender, birth_date;
                        var height, weight;
                        name = context.read<NameCubit>().state;
                        birth_date = context.read<BirthDateCubit>().state;
                        gender = context.read<GenderCubit>().state;
                        height = context.read<HightCubit>().state;
                        weight = context.read<WeightCubit>().state;
                        if (name.name != '' &&
                            birth_date != '' &&
                            gender != '' &&
                            height != 0 &&
                            weight != 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (c) {
                                return CalculateBmiPage(
                                  human: Human(
                                    name: name.name,
                                    birth_date: birth_date,
                                    gender: gender,
                                    height: height,
                                    weight: weight,
                                  ),
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
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  //   @override
  // Widget build(BuildContext context) {
  //   return MultiBlocProvider(
  //     providers: [
  //       BlocProvider<NameCubit>(create: (context) => NameCubit()),
  //       BlocProvider<BirthDateCubit>(create: (context) => BirthDateCubit()),
  //       BlocProvider<GenderCubit>(create: (context) => GenderCubit()),
  //       BlocProvider<HightCubit>(create: (context) => HightCubit()),
  //       BlocProvider<WeightCubit>(create: (context) => WeightCubit()),
  //     ],
  //     // استخدمنا Builder هنا عشان نطلع Context جديد (سنسميه childContext)
  //     child: Builder(
  //       builder: (childContext) {
  //         return Scaffold(
  //           body: Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
  //             child: SingleChildScrollView(
  //               child: Column(
  //                 children: [
  //                   const Center(
  //                     child: Text(
  //                       'BMI',
  //                       style: TextStyle(
  //                         color: Colors.green,
  //                         fontSize: 40,
  //                         fontFamily: 'DM Sans',
  //                       ),
  //                     ),
  //                   ),
  //                   const SizedBox(height: 20),
  //                   const CustomNameInput(),
  //                   const SizedBox(height: 20),
  //                   const CustomDateInput(),
  //                   const SizedBox(height: 20),
  //                   const GenderSelector(),
  //                   const SizedBox(height: 20),

  //                   // لاحظ هنا استخدمنا childContext بدلاً من context الأصلي
  //                   BlocBuilder<HightCubit, double>(
  //                     builder: (childContext, state) {
  //                       return CustomInputCounter(
  //                         label: 'Your Height(cm)',
  //                         value: state,
  //                         onIncrement: () => childContext.read<HightCubit>().increment(),
  //                         onDecrement: () => childContext.read<HightCubit>().decrement(),
  //                       );
  //                     },
  //                   ),
  //                   const SizedBox(height: 20),
  //                   BlocBuilder<WeightCubit, double>(
  //                     builder: (childContext, state) {
  //                       return CustomInputCounter(
  //                         label: 'Your Weight(kg)',
  //                         value: state,
  //                         onIncrement: () => childContext.read<WeightCubit>().increment(),
  //                         onDecrement: () => childContext.read<WeightCubit>().decrement(),
  //                       );
  //                     },
  //                   ),
  //                   const SizedBox(height: 20),
  //                   Buttom_send(
  //                     on_pers: () {
  //                       // هنا نستخدم childContext اللي شايف الـ Cubits
  //                       final name = childContext.read<NameCubit>().state;
  //                       final birthDate = childContext.read<BirthDateCubit>().state;
  //                       final gender = childContext.read<GenderCubit>().state;
  //                       final height = childContext.read<HightCubit>().state;
  //                       final weight = childContext.read<WeightCubit>().state;

  //                       if (name != '' && birthDate != '' && height != 0 && weight != 0) {
  //                         Navigator.pushReplacement(
  //                           childContext,
  //                           MaterialPageRoute(builder: (c) {
  //                             return CalculateBmiPage(
  //                               human: Human(
  //                                 name: name.name,
  //                                 birth_date: birthDate,
  //                                 gender: gender,
  //                                 height: height,
  //                                 weight: weight,
  //                               ),
  //                             );
  //                           }),
  //                         );
  //                       }
  //                     },
  //                     text: 'Calculate BMI',
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ),
  //         );
  //       }
  //     ),
  //   );
  // }
}
            //  BlocBuilder<NameCubit,NameState>(builder: (context,s){
            //   return Container(
            //     alignment: Alignment.center,
            //   height: 100,
            //   width: 200,
            //   color: Colors.black,
            //   child: Text(s.name,style: TextStyle(color: Colors.white,fontSize: 12),),
            //  )  ;  
            //  })  


            //                        BlocBuilder<BirthDateCubit,String>(builder: (context,s){
            //   return Container(
            //     alignment: Alignment.center,
            //   height: 100,
            //   width: 200,
            //   color: Colors.black,
            //   child: Column(
            //     children: [
            //       Text(s,style: TextStyle(color: Colors.white,fontSize: 12),),
            //      // Text(s,style: TextStyle(color: Colors.white,fontSize: 12),),
            //     ],
            //   ),
            //  )  ;  
            //  }) 

                      //  Container(
          //       alignment: Alignment.center,
          //     height: 100,
          //     width: 200,
          //     color: Colors.black,
          //     child: Text(: TextStyle(color: Colors.white,fontSize: 12),))
 
