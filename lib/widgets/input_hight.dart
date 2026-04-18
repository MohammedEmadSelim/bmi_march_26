import 'package:bmi/const/color.dart';
import 'package:bmi/cubit/hight_cubit/hight_cubit.dart';
import 'package:bmi/widgets/Icons_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputHight extends StatelessWidget {
  const InputHight({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Your Height(cm)',
          style: TextStyle(
            fontFamily: 'DM Sans',
            fontSize: 16,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.center,
          height: 45,
          width: 340,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Appcolor.primcolor,
          ),
          child: Row(
            children: [
              Spacer(flex: 1),
              Icons_buttom(
                on_pers: () {
                  context.read<HightCubit>().decrement();
                },
                iconData: Icons.remove,
              ),
              Spacer(flex: 7),
              BlocBuilder<HightCubit, double>(
                builder: (context, state) {
                  return Text(
                    '$state',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
              // BlocBuilder<HightCubit,int>()(
              //   child: Text(
              //     '${context.read<HightCubit>().state}',
              //     style: TextStyle(
              //       color: Colors.red,
              //       fontSize: 38,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              Spacer(flex: 7),
              Icons_buttom(
                on_pers: () {
                  context.read<HightCubit>().increment();
                },
                iconData: Icons.add,
              ),
              Spacer(flex: 1),
            ],
          ),
        ),
      ],
    );
  }
}
