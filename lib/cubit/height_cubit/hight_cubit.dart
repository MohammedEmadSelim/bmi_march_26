import 'package:flutter_bloc/flutter_bloc.dart';

class HeightCubit extends Cubit<int> {
  HeightCubit() : super(180);

 void increment() {
  if (state >=0) {
   emit(state + 1); 
   
   }
 }
  void decrement() {
    if (state > 0 ) {
     emit(state - 1); 
    } 
  }
}
