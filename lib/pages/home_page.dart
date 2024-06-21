import 'package:flutter/material.dart';
import 'package:todo_app/utils/dialog_popup.dart';
import 'package:todo_app/utils/todo_task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List todoList = [
    ['Study Java', false],
    ['Make a Flutter App', true],
    ['Learn Python', true],
    ['Study Data Structures', false],
    ['Learn Algorithms', false],
  ];

  // Function to change the status of the Task checkbox
  void checkboxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = value!;
    });
  }

  // Function to save the new task
  void saveNewTask() {
    setState(() {
      todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // Function to create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogPopup(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // Function to delete a task
  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
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
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.yellow,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return TodoTask(
            taskName: todoList[index][0],
            taskCompleted: todoList[index][1],
            onStatusChanged: (value) => checkboxChanged(value, index),
            deleteTask: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
