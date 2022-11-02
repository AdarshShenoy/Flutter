import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/task.dart';
import 'package:provider/provider.dart';
import 'package:todo/task_data.dart';

class AddTaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Add Task',textAlign: TextAlign.center, style: TextStyle(fontSize: 30.0,
            color: Colors.purple.shade700,),),
            TextField(autofocus: true,textAlign: TextAlign.center,onChanged: (newText){
              newTaskTitle= newText;
            },
            decoration: new InputDecoration(focusColor: Colors.purple),),
            ElevatedButton(onPressed: (){
              
              Provider.of<TaskData>(context,listen: false).addTask(newTaskTitle!);
              Navigator.pop(context);
            }, child: Text('Add',),style: ElevatedButton.styleFrom(primary: Colors.purple.shade700),),
          ],
        ),
      ),
    );
  }
}
