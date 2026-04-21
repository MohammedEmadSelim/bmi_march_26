import 'package:flutter_bloc/flutter_bloc.dart';

class GenderCubit extends Cubit<int?> {
  GenderCubit() : super(null);
  void select(int selectedGender) {
    emit(selectedGender);
  }
  
}