import 'package:default_project/cubits/tab/tab_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabCubit extends Cubit<TabState> {
  TabCubit() : super(MathScreenState());

  updateScreen({required int index}) {
    if (index == 0) {
      emit(MathScreenState());
    } else {
      emit(LoginScreenState());
    }
  }
}
