import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;


  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  int temperature=0;
  int condition=0;
  String cityName="";
  String main ="";
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }
  void updateUI(dynamic weatherData){
    setState(() {
      if(weatherData==null){
        temperature=0;
        main = 'Error';
        return;
      }
    });
    double temp = weatherData['main']['temp'];
    temperature = temp.toInt()-273;
    condition = weatherData['weather'][0]['id'];
    cityName = weatherData['name'];
    main = weatherData['weather'][0]['main'];

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-1.0,-1),
          end: Alignment(-1.0, 1),
          colors: const[Color(0xff272F6C), Color(0xff9561A1)]
        ),
      ),
      child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[


              DefaultTextStyle(style: TextStyle(color: Colors.white, fontSize: 140.0, ),child: Text('$temperature°',)),
              DefaultTextStyle(style: TextStyle(color: Colors.white, fontSize: 40.0, ),child: Text('$main',)),

            ],


      ),
    );
  }
}
