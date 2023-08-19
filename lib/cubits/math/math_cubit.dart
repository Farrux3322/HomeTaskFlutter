import 'package:default_project/cubits/math/math_temp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MathCubit extends Cubit<MathTemp> {
  MathCubit() : super(MathTemp());

  void initialA(int a) {
    emit(state.copyWith(a:a));
  }

  void initialB(int b) {
    emit(state.copyWith(b: b));
  }

  void mathCalc() {
    int c = 1;
    for (int i = 0; i < state.b; i++) {
      c = c*state.a;
    }
    emit(state.copyWith(answer: c));
  }
}
