import 'package:bmi/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'input_page.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({required this.bmiResult,required this.resultText, required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BMI CALCULATOR")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text('Your Result', style: kTitleTextStyle,),
          )),
          Expanded(flex: 5,child: ReusableCard(colour: kActiveCardColor,onPress: (){},cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[Text(resultText.toUpperCase(), style: TextStyle(color: Color(0xFF24D876), fontSize: 22.0, fontWeight:  FontWeight.bold),),
            Text(bmiResult,style: TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold),),
            Text(interpretation,style: TextStyle(fontSize: 22.0),)],
          ),)),
          CalculateButton(buttonTitle: "RECALCULATE", onTap: (){
            Navigator.pop(context);
    })
        ],
      ),
    );
  }
}
