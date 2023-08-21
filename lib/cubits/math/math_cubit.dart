import 'package:default_project/cubits/math/math_temp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MathCubit extends Cubit<MathTemp> {
  MathCubit() : super(MathTemp());

  void initialA(int a) {
    emit(state.copyWith(a: a));
  }

  String s = "";

  void initialB(int b) {
    emit(state.copyWith(b: b));
  }

  void mathCalc() {
    int c = 1;
    for (int i = 0; i < state.b; i++) {
      c = c * state.a;
    }
    emit(state.copyWith(answer: c));
    formatAnswer();
  }

  void formatAnswer() {
    String q = "";
    List<String> w = state.answer.toString().split("");
    for (int i = w.length - 1; i > -1; i--) {
      q += w[i];
    }
    emit(state.copyWith(answer: int.parse(q)));
    s = "";
    List<String> f = state.answer.toString().split("");
    for (int i = 0; i < f.length; i++) {
      if (i % 3 == 0) {
        s += " ";
      }
      s += f[i];
    }
    String e = "";
    List<String> r = s.split("");
    for (int i = r.length - 1; i > -1; i--) {
      e += r[i];
    }
    emit(state.copyWith(formatAnswer: e));
  }
}
