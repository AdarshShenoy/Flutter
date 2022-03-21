import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

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
              Expanded(child: ReusableCard(
                colour:Color(0xFF1D1E33),
                cardChild:GenderWidget(
                icon: FontAwesomeIcons.mars,
                label: 'MALE',) ,)),
              Expanded(child: ReusableCard(
                  colour:Color(0xFF1D1E33),
              cardChild: GenderWidget(icon: FontAwesomeIcons.venus, label: 'Female'),)),
            ],
          )),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(colour:Color(0xFF1D1E33))),
            ],
          )),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(colour:Color(0xFF1D1E33))),
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

class GenderWidget extends StatelessWidget {
  GenderWidget({required this.icon,required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon,size: 80.0,),
        SizedBox(height: 15.0,),
        Text(label, style: TextStyle(fontSize: 18.0,color: Color(0xFF8D8E98)),)
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {

  ReusableCard({required this.colour, required this.cardChild});
  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,

      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: colour,
      ),



    );
  }
}
