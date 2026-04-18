import 'package:flutter_bloc/flutter_bloc.dart';

class WeightCubit extends Cubit<double> {
  // القيمة الابتدائية للعداد هي 0
  WeightCubit() : super(80);

  // دالة الزيادة
  void increment() => emit(state + 1);

  // دالة النقصان
  void decrement() {
    if(state >0){
      emit(state - 1);
    }
    }
}