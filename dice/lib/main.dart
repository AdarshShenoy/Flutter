import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';


void main() {
  return (
      runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false, //Removes the debug mode banner from the app
        home: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text('Dice', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: DicePage(), //A Separate class for the body of the Scaffold

        ),
      )
  ));
}


class DicePage extends StatefulWidget {

  // This widget part is the root of this application.
  @override
  _DicePageState createState() => _DicePageState();
}



//This is the state part which tracks and updates the screen the part which gets updated is a little lower than here
class _DicePageState extends State<DicePage> {
  int leftDiceNumber =1;
  int rightDiceNumber = 3;

  void changeDiceFace(){
    leftDiceNumber= Random().nextInt(6)+1;  //Generates a random number and sets it to the dice value
    rightDiceNumber= Random().nextInt(6)+1;
  }
  @override


  Widget build(BuildContext context) {
    //from here on the code with these parenthesis gets updated everytime setState() is called
    //Anything above or outside this widget build does not get called


    return Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [

        Row(
          children: <Widget>[
            Expanded( //Expanded to take up as much space as possible in the row
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('images/dice$leftDiceNumber.png'),
              ),
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset('images/dice$rightDiceNumber.png'),
                )
            )
          ],

        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: (){
                  setState(() { //build function gets called.

                  });
                  changeDiceFace();
                },
                child: Text('Roll'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.red),
              ),
            ),
          ],
        ),
      ],
    );


  }
}

/*         ||The app build tree:||
                  ()Scaffold
                    /    \
                   /      \
             ()AppBar     ()Row
                /          /   \
               /          /     \
           ()Text     ()Image   ()Image
                          |         |
                          |         |
                      dice.png   dice.png
* */
