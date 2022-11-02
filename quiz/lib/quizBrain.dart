import 'dart:math';

import 'questions.dart';

class QuizBrain{
  // '_' Private variables, can only be accessed from this class
  int _quesNumber = 0;


  List<Questions> _questionBank =[
    Questions(q: "Plants observe oxygen from atmosphere?", a: false),
    Questions(q: 'Nepal is the only country in the world which does not have a rectangular flag?', a: true),
    Questions(q: 'The knight is the only piece in chess which can only move diagonally?', a: false),
    Questions(q: "First ODI (Cricket) in India was played in Ahemadabad", a: true),
    Questions(q: "You can lead a cow down stairs but not up stairs", a: false),
    Questions(q: "Approximately one quarter of human bones are in the feet", a: true),
    Questions(q: "A slug\'s blood is green", a: true),
    Questions(q: 'Mount Kilimanjaro is the highest mountain in the world?', a: false),
    Questions(q: 'A group of swans is known as a bevy?', a: true),
    Questions(q: 'Sydney is the capital of Australia?', a: false),
    Questions(q: 'A heptagon has eight sides?', a: false),
    Questions(q: 'The star sign Capricorn is represented by a goat?', a: true),
    Questions(q: 'Fish cannot blink?', a: true),
  ];

  var list = [1,2,3,4,5,6,7,8,9,10,11,12];



  String getQuestion(){
  return _questionBank[_quesNumber].question;
}

  bool getAnswer(){
    return _questionBank[_quesNumber].answer;
  }

  void nextQuestion(){
    //var list = Iterable<int>.generate(_questionBank.length).toList();

  while(true && list.isNotEmpty){
    Random random = new Random();
    int randomNum = random.nextInt(_questionBank.length);
    if(list.contains(randomNum)){
      _quesNumber = randomNum;
      list.remove(randomNum);
      break;
    }
    else if(list.isEmpty){
      _quesNumber =  0;
        break;
    }
  }
  }
bool isFinished(){

  if(list.isEmpty){
    _quesNumber = 0;
    list = [0,1,2,3,4,5,6,7,8,9,10,11,12];
    return true;
  }
  else{
    return false;
  }
}

}