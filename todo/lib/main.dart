import 'package:flutter/material.dart';
import 'package:todo/task.dart';
import 'screens/task_screen.dart';
import 'package:provider/provider.dart';
import 'task_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context)=>TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TaskScreen(),
      ),
    );
  }
}

