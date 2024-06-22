// lib/views/todo_page.dart
import 'package:flutter/material.dart';
import 'package:myapp/modules/todo/components/add_todo_button.dart';
import 'package:myapp/modules/todo/components/todo_list.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
        actions: const [
          AddTodoButton(),
        ],
      ),
      body: const TodoList(),
    );
  }
}
