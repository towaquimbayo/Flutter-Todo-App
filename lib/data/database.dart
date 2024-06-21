import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  final _todoBox = Hive.box("todos");
  List todoList = [];

  // Function to initialize the database with initial data 
  void createInitialData() {
    todoList = [
      ["Buy groceries", false],
      ["Walk the dog", false],
      ["Cook dinner", false],
    ];
  }

  // Function to load data from the database
  void loadData() {
    todoList = _todoBox.get("todolist", defaultValue: []);
  }

  // Function to save data to the database
  void updateDb() {
    _todoBox.put("todolist", todoList);
  }
}