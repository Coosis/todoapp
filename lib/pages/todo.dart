import 'package:flutter/material.dart';
import 'package:todoapp/util/DialogBox.dart';
import 'package:todoapp/util/todotile.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _controller = TextEditingController();

  List todos = [
    ["Make a Dish", false],
    ["Do Laundry", false],
    ["Finish Homework", false],
  ];

  void deleteTask(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  void checkBoxToggled(bool? value, int index) {
    setState(() {
      todos[index][1] = !todos[index][1];
    });
  }

  void saveTask() {
    setState(() {
      todos.add([_controller.text, false]);
    });
    Navigator.pop(context);
  }

  void CreateNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onCancel: () => Navigator.pop(context),
          onSave: () {
            saveTask();
            _controller.clear();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: CreateNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return TodoTile(
            title: todos[index][0],
            isDone: todos[index][1],
            onChanged: (value) => checkBoxToggled(value, index),
            onDelete: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
