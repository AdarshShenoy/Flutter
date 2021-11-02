import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildKey('b'),
                buildKeyWithFlat('aa','a'),
                buildKeyWithFlat('g','gg'),
                buildKeyWithFlat('f','ff'),
                buildKey('e'),
                buildKeyWithFlat('d','dd'),
                buildKeyWithFlat('c','cc'),


              ],
            )

        ),

      ),

    );
  }

}
Expanded buildKey(String note) {
  return Expanded(
    flex: 1,
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0, right: 3.0),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: MaterialButton(
              enableFeedback: false,
              color: Colors.white,
              onPressed: () {
                final player = AudioCache();
                player.play('$note.mp3');
              },
            ),
          ),
        ),


      ],
    ),

  );
}
Expanded buildKeyWithFlat(String note, String flat) {
  return Expanded(
    flex: 1,
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0, right: 3.0),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: MaterialButton(
                enableFeedback: false,
                color: Colors.white,
                onPressed: () {
                  final player = AudioCache();
                  player.play('$note.mp3');
                },
                child: null
            ),
          ),
        ),

        Positioned(
            top: -32.0,
            child: Container(
              width: 250.0,
              height: 60.0,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  child: null,
                  //enableFeedback: false,
                  //color: Colors.black,
                  onPressed: () {
                    final player = AudioCache();
                    player.play('$flat.mp3');
                  }
              ),
            ))
      ],
    ),

  );
}





