import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const activeCardColor = Color(0xFF111328);
const inactiveCardColor = Color(0xFF1D1E33);

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = inactiveCardColor;
  Color femaleCardColour = inactiveCardColor;

  void updateColor(int gender){
    if(gender ==1){
      if(maleCardColour == inactiveCardColor){
        maleCardColour = activeCardColor;
        femaleCardColour = inactiveCardColor;
      }else{
        maleCardColour= inactiveCardColor;
      }
    }else{
      if(femaleCardColour == inactiveCardColor){
        femaleCardColour = activeCardColor;
        maleCardColour = inactiveCardColor;
      }else{
        femaleCardColour= inactiveCardColor;
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BMI Calculator")),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: GestureDetector(
                onTap: (){
                  setState(() {
                    updateColor(1);
                  });

                },
                child: ReusableCard(
                  colour:maleCardColour,
                  cardChild:GenderWidget(
                  icon: FontAwesomeIcons.mars,
                  label: 'MALE',) ,),
              )),
              Expanded(child: GestureDetector(
                onTap: (){
                  setState(() {
                    updateColor(2);
                  });
                },
                child: ReusableCard(
                    colour:femaleCardColour,
                cardChild: GenderWidget(icon: FontAwesomeIcons.venus, label: 'FEMALE'),),
              )),
            ],
          )),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(colour:Color(0xFF1D1E33),cardChild: Container(),)),
            ],
          )),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(colour:Color(0xFF1D1E33),cardChild: Container(),)),
            ],
          )),
          Container(
            color: Color(0xFFEB1555),
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: 80.0,
          ),
        ],

      ),

    );





    
  }
}




