import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'brain.dart';


enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height =180;
  int weight =60;
  int age = 15;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BMI Calculator")),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                onPress: (){

                  setState(() {
                    selectedGender= Gender.male;
                    print("Press");
                  });
                },
                colour:selectedGender == Gender.male? kActiveCardColor: kInactiveCardColor,
                cardChild:GenderWidget(
                icon: FontAwesomeIcons.mars,
                label: 'MALE',) ,)),
              Expanded(child: ReusableCard(
                onPress: (){
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                  colour:selectedGender == Gender.female? kActiveCardColor: kInactiveCardColor,
              cardChild: GenderWidget(icon: FontAwesomeIcons.venus, label: 'FEMALE'),)),
            ],
          )),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                onPress: (){},
                colour:kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('HEIGHT',style: labelTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(), style: kNumberTextStyle),
                        Text('cm', style: labelTextStyle,),
                      ],
                    ),
                    Slider(

                      value: height.toDouble(),
                      min :120.0,
                      max: 220.0,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });

                      },
                    )

                  ],
                ),)),
            ],
          )),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                colour:Color(0xFF1D1E33),
                onPress: (){},
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('WEIGHT', style: labelTextStyle,),
                    Text(weight.toString(), style: kNumberTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          iconColor: Colors.white,
                          onPressed: (){
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                        SizedBox(width: 8.0,height: 0.0,),
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          iconColor: Colors.white,
                            onPressed: (){
                              setState(() {
                                weight--;
                              });
                            }),
                      ],
                    ),

                  ],
                ),)),
              Expanded(child: ReusableCard(
                colour:Color(0xFF1D1E33),
                onPress: (){},
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('AGE', style: labelTextStyle,),
                    Text(age.toString(),style: kNumberTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(icon: FontAwesomeIcons.plus, iconColor: Colors.white, onPressed: (){setState(() {age++;});}),
                        SizedBox(width: 8.0,height: 0.0,),
                        RoundIconButton(icon: FontAwesomeIcons.minus, iconColor: Colors.white, onPressed: (){setState(() {age--;});}),
                      ],
                    )
                  ],
                ),)),
            ],
          )),

          CalculateButton(onTap: (){
            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);


            Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultsPage(
              bmiResult: calc.calculateBMI(),
              resultText: calc.getResult(),
              interpretation: calc.getInterpretation(),
            )));
          },buttonTitle: 'CALCULATE',),
        ],

      ),

    );





    
  }
}

class CalculateButton extends StatelessWidget {
  CalculateButton({required this.buttonTitle, required this.onTap});
  final Function()? onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(

        child: Center(child: Text(buttonTitle, style: kLargeButtonTextStyle,)),
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: 80.0,
      ),
    );
  }
}
class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.iconColor, required this.onPressed});
  final IconData icon;
  final Color iconColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon,color: iconColor),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      onPressed: onPressed,

    );
  }
}




