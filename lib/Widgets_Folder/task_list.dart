import 'package:flutter/material.dart';
import 'package:todo_flutter/Widgets_Folder/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_data.dart';

class TasksView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return TaskTile(
            taskTitle: task.name,
            isChecked: task.isDone,
            checkBoxCallBack: (checkBoxState) {
              taskData.updateTask(task);
            },
            longPressCallBack: (){
              taskData.taskDelete(task);
            },
          );
        },
        itemCount: taskData.taskCount,
      );
    });
  }
}
