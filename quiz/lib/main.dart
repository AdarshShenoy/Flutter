import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> scoreKeeper =[];
  int scoreCount =0;
  
  void checkAnswer(bool userPickedAnswer)
  {
    bool correctAnswer = brain.getAnswer();
    setState(() {
      if(brain.isFinished()==true){

        //Alert(context: context, title: "Completed", desc: "You've scored $scoreCount out of 13").show();
        showDialog(context: context,
            builder: (context){return AlertDialog(
              title: Text("Completed"),
              content: Text("Do you wanna go again?"),
              actions: [
                TextButton(onPressed: (){
                  Navigator.pop(context);},
                  child: Text("Yes"),),
              TextButton(onPressed: (){SystemNavigator.pop();}, child: Text("No"))]
            );});

        scoreKeeper =[];
        scoreCount=0;
      }

  else{
    if(userPickedAnswer ==correctAnswer){
      scoreKeeper.add(Icon(Icons.check, color: Colors.green,));
      scoreCount++;
    }
    else{
      scoreKeeper.add(Icon(Icons.close,color: Colors.red,));
    }

      brain.nextQuestion();
    }});
  }



  QuizBrain brain = QuizBrain();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                brain.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),//Question Text
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green.shade800,
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),//True Button
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red.shade900,
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),//False Button
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}