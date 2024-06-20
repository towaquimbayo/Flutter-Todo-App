import 'package:flutter/material.dart';
import 'package:todo_app/utils/todo_task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todoList = [
    ['Study Java', false],
    ['Make a Flutter App', true],
    ['Learn Python', true],
    ['Study Data Structures', false],
    ['Learn Algorithms', false],
  ];

  void checkboxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('Todo App'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return TodoTask(
            taskName: todoList[index][0],
            taskCompleted: todoList[index][1],
            onStatusChanged: (value) => checkboxChanged(value, index),
          );
        },
      ),
    );
  }
}
