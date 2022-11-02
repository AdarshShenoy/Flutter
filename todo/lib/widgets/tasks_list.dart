import 'package:flutter/material.dart';
import 'package:todo/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todo/task_data.dart';


class TasksList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      //taskData, that's what we're listening for
      builder: (context,taskData,child){
        return ListView.builder(itemBuilder: (context, index){
          final task= taskData.tasks[index];
          return TaskTile(
              isChecked: task.isDone,
              taskTitle: task.name,
              checkboxCallback: (bool checkboxState){
               taskData.updateTask(taskData.tasks[index]);
              },
              longPressCallback: (){
                taskData.deleteTask(task);
          },);

        }, itemCount:taskData.taskCount,);
      },

    );
  }
}