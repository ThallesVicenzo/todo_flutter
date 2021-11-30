import 'package:flutter/cupertino.dart';
import 'package:todo_flutter/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier{

  List<Task> _tasks = [
    Task(name: 'Work until 6PM'),
    Task(name: 'Buy cocaine'),
    Task(name: 'Workout until 10PM'),
  ];

  UnmodifiableListView <Task> get tasks{
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle){
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask (Task task){
    task.toggleDone();
    notifyListeners();
  }

  void taskDelete(Task task){
    _tasks.remove(task);
    notifyListeners();
  }

}