import 'package:flutter/material.dart';
import 'package:todoey/models/Task.dart';
import 'package:todoey/widgets/TaskTile.dart';

class TasksList extends StatefulWidget {
  Set<Task> tasks;

  TasksList(this.tasks);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: widget.tasks.elementAt(index).name,
          isChecked: widget.tasks.elementAt(index).isDone,
          checkboxCallback: (checkBoxState) {
            setState(() {
              widget.tasks.elementAt(index).isToggleDone();
            });
          },
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
