import 'package:flutter_bloc/flutter_bloc.dart';

class GenderCubit extends Cubit<String> {
  // القيمة الابتدائية نص فاضي (يعني مفيش حاجة متحددة في البداية)
  GenderCubit() : super(""); 

  // الدالة دي هنناديها لما اليوزر يضغط على كارت معين
  void selectGender(String gender) {
    emit(gender);
  }
}