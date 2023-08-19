class MathTemp {
   int a;
   int b;
   int answer;

  MathTemp({ this.a = 1,  this.b = 1,this.answer = 1});

  MathTemp copyWith({int? a, int? b = 1,int? answer}) {
    return MathTemp(a: a ?? this.a, b: b ?? this.b,answer: answer ?? this.answer );
  }

  clearAB(){
    a = 1;
    b = 1;
  }
}
