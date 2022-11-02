import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  bool isChecked = true;
  final String? taskTitle;
  final Function checkboxCallback;
  final void Function()? longPressCallback;

  TaskTile({required this.isChecked,required this.taskTitle, required this.checkboxCallback,this.longPressCallback});

  @override
  Widget build(BuildContext context) => ListTile(
    onLongPress: longPressCallback,
      title: Text(taskTitle!,style: TextStyle(decoration: isChecked ? TextDecoration.lineThrough: null),),
      trailing: Checkbox(
        activeColor: Colors.purple.shade700,
        value: isChecked,
        onChanged: (newValue){
          checkboxCallback(newValue);
        },
      )
    );
}

