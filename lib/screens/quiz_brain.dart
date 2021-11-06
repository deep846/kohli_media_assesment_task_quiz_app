import 'package:quizzler/screens/questions.dart';
class QuizBrain
{
  int _questionNumber =0;
  List<Question> _questionset =
  [
    Question('What does BBC stand for?', "British Big Circle","British Broadcasting Corporation","British Big Central"),
    Question('The tree sends down roots from its branches to the soil is know as:', "Oak","Pine","Banyan"),
    Question('Electric bulb filament is made of',"Tungsten", "Copper","Aluminum"),
    Question('Brass gets discoloured in air because of the presence of which of the following gases in air?', "Oxygen","Nitrogen","Carbon dioxide"),
    Question('Which of the following is a non metal that remains liquid at room temperature?', "Phosphorous","Bromine","Chlorine"),
    Question('Chlorophyll is a naturally occurring chelate compound in which central metal is', "Copper","Iron","Magnesium"),
    Question('Which of the following is used in pencils?', "Graphite","Silicon","Charcoal"),
    Question('Which of the following metals forms an amalgam with other metals?', "Tin","Mercury","Lead"),
    Question('Chemical formula for water is', "H2O","Al2O3","NaA1O2"),
    Question('The gas usually filled in the electric bulb is', "Nitrogen","Hydrogen","Oxygen"),
    Question('Washing soda is the common name for', "Sodium Carbonate","Calcium Bicarbonate","Calcium Carbonate"),
  ];
  List<Answer> _answerset =
  [
    Answer("British Broadcasting Corporation"),
    Answer("Banyan"),
    Answer("Tungsten"),
    Answer("Nitrogen"),
    Answer("Bromine"),
    Answer("Magnesium"),
    Answer("Graphite"),
    Answer("Mercury"),
    Answer("H2O"),
    Answer("Nitrogen"),
    Answer("Sodium Carbonate"),
  ];
  void NextQuetion()
  {
    if(_questionNumber < _questionset.length-1)
    {
      _questionNumber++;
    }
  }
  int total_question_number()
  {
    return _questionset.length;
  }
  String getquestion()
  {
    return _questionset[_questionNumber].questions;
  }
  String op1()
  {
    return _questionset[_questionNumber].option1;
  }
  String op2()
  {
    return _questionset[_questionNumber].option2;
  }
  String op3()
  {
    return _questionset[_questionNumber].option3;
  }
  String getanswers()
  {
    return _answerset[_questionNumber].correct;
  }
  bool isfinish()
  {
   if (_questionNumber == _questionset.length-1)
   {
     return true;
   }
   else
     {
       return false;
     }
  }
  void reset()
  {
    _questionNumber =0;
  }
}