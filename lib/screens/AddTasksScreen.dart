import 'package:flutter/material.dart';

class AddTasksScreen extends StatelessWidget {
  final Function addTasksCallback;

  AddTasksScreen(this.addTasksCallback);

  @override
  Widget build(BuildContext context) {
    late String newTaskTitle;
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      foregroundColor: Colors.white,
      minimumSize: const Size(88, 44),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
      backgroundColor: Colors.blue,
    );
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              cursorColor: Colors.lightBlueAccent,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlueAccent),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlueAccent),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlueAccent),
                ),
              ),
              onChanged: (value) {
                newTaskTitle = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                //add task later
                addTasksCallback(newTaskTitle);
              },
              style: flatButtonStyle,
              child: const Text(
                "Add",
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
