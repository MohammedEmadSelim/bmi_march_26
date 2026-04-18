import 'package:bmi/cubit/name_cubit/name_sta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameCubit extends Cubit<NameState> {
  NameCubit() : super(NameState());

  // دالة لتحديث الاسم
  void updateName(String newName) {
    emit(NameState(name: newName));
  }

}