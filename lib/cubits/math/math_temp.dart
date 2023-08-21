class MathTemp {
   int a;
   int b;
   int answer;
   String formatAnswer;

  MathTemp({ this.a = 1,  this.b = 1,this.answer = 1,this.formatAnswer = ""});

  MathTemp copyWith({int? a, int? b = 1,int? answer,String? formatAnswer }) {
    return MathTemp(a: a ?? this.a, b: b ?? this.b,answer: answer ?? this.answer ,formatAnswer: formatAnswer ?? this.formatAnswer);
  }


  clearAB(){
    a = 1;
    b = 1;
  }
}
