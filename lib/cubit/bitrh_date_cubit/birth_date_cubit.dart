import 'package:flutter_bloc/flutter_bloc.dart';

class BirthDateCubit extends Cubit<String> {
  // بنبدأ بنص فاضي كحالة ابتدائية
  BirthDateCubit() : super(""); 

  // دالة بنناديها عشان نحدث التاريخ
  void updateDate(String newDate) {
    emit(newDate); // بيبعت القيمة الجديدة فوراً لأي حد بيسمع
  }
}