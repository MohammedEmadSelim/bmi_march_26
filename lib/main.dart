
import 'package:bmi/cubit/gender_cubit/gender_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Pages/SplachScreen.dart';

void main() {
  runApp(const Bmi2());
}

class Bmi2 extends StatelessWidget {
  const Bmi2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenderCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplachScreen(),
      ),
    );
  }
}
