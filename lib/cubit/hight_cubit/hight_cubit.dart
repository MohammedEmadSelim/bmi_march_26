import 'package:flutter_bloc/flutter_bloc.dart';

class HightCubit extends Cubit<double> {
  // القيمة الابتدائية للعداد هي 0
  HightCubit() : super(180);

  // دالة الزيادة
  void increment() => emit(state + 1);

  // دالة النقصان
  void decrement() {
    if(state >0){
      emit(state - 1);
    }
    }
}