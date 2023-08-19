import 'package:default_project/cubits/tab/tab_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabCubit extends Cubit<TabState> {
  TabCubit() : super(MathScreenState());

  int i = 0;

  updateScreen({required int index}) {

    if (index == 0) {
      i = index;
      print("Farruxxxxxxxx   $i");
      emit(MathScreenState());
    } else {
      i = index;
      print("Farruxxxxxxxx   $i");
      emit(LoginScreenState());
    }
  }
}
