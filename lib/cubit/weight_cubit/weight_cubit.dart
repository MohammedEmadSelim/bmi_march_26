import 'package:flutter_bloc/flutter_bloc.dart';

class WeightCubit extends Cubit<int> {
  WeightCubit() : super(0);

 void increment() {
  if (state >=0) {
   emit(state + 1); 
   
   }
 }
  void decrement() {
    if (state > 0) {
     emit(state - 1); 
    } 
  }
}