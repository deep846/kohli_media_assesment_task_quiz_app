class Question {
  String questions;
  String option1;
  String option2;
  String option3;
  Question(String q, String a , String b, String c) {
    questions = q;
    this.option1 = a;
    this.option2 = b;
    this.option3 = c;
  }
}

class Answer{
  String correct;
  Answer(String c)
  {
    this.correct = c;
  }
}