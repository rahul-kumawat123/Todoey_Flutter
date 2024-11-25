import 'package:flutter/material.dart';
import 'package:todoey/widgets/TasksList.dart';
import 'package:todoey/screens/AddTasksScreen.dart';
import 'package:todoey/models/Task.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  Set<Task> tasks = {
    Task(name: "Get Groceries"),
    Task(name: "Pay Bills"),
    Task(name: "Car Wash"),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddTasksScreen((newValue) {
                        setState(() {
                          tasks.add(Task(name: newValue));
                        });
                        Navigator.pop(context);
                      }))));
        },
        backgroundColor: Colors.lightBlueAccent,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 80, left: 30, bottom: 30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.list,
                  size: 30,
                  color: Colors.lightBlueAccent,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Todoey",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "${tasks.length} Tasks",
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ]),
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: TasksList(tasks),
          ))
        ],
      ),
    );
  }
}
