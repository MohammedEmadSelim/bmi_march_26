import 'package:bmi/cubit/height_cubit/hight_cubit.dart';
import 'package:bmi/cubit/weight_cubit/weight_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextInputNum_Height extends StatelessWidget {
  const CustomTextInputNum_Height({super.key, required this.controller, required this.title});
  final TextEditingController controller;
  final String title;
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
                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 0, 0, 0) ),
                controller: controller,
                textAlign: TextAlign.center,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  prefixIcon: GestureDetector(
                    onTap: () {
                    
                    context.read<HeightCubit>().decrement();
                   controller.text =  context.read<HeightCubit>().state.toString();
                    },
                    child: Icon(Icons.remove,size: 30,color: Color(0xff484783),)),
                  suffixIcon: GestureDetector(
                    onTap: () {
                     context.read<HeightCubit>().increment();
                     controller.text =  context.read<HeightCubit>().state.toString();
                     
                    },
                    child: Icon(Icons.add,size: 30,color: Color(0xff484783))) ,
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
                )
                
              )
      ],
    );
  }
}




class CustomTextInputNum_Weight extends StatelessWidget {
  const CustomTextInputNum_Weight({super.key, required this.controller, required this.title});
  final TextEditingController controller;
  final String title;
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
                controller: controller,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 0, 0, 0) ),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  prefixIcon: GestureDetector(
                    onTap: () {
                      context.read<WeightCubit>().decrement();
                      controller.text =  context.read<WeightCubit>().state.toString();
                    },
                    child: Icon(Icons.remove,size: 30,color: Color(0xff484783),)),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      context.read<WeightCubit>().increment();
                      controller.text =  context.read<WeightCubit>().state.toString();
                     
                    },
                    child: Icon(Icons.add,size: 30,color: Color(0xff484783))) ,
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
                )
                
              )
      ],
    );
  }
}