import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  final bool isChecked;
  final Function checkboxCallback;

  TaskTile(
      {required this.taskTitle,
      required this.isChecked,
      required this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(taskTitle,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null)),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback as void Function(bool?)?,
      ),
    );
  }
}
