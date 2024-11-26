import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:todoey/models/Task.dart';

class TaskData extends ChangeNotifier {
  final Set<Task> _tasks = {
    Task(name: "Get Groceries"),
    Task(name: "Pay Bills"),
    Task(name: "Car Wash"),
  };

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newValue) {
    final task = Task(name: newValue);
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.isToggleDone();
    notifyListeners();
  }
}
