// lib/views/todo_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/modules/todo/todo_bloc/todo_bloc.dart';
import 'package:myapp/modules/todo/todo_bloc/todo_event.dart';
import 'package:myapp/modules/todo/todo_bloc/todo_state.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController updateTitleController = TextEditingController();
    final TextEditingController updateDescriptionController =
        TextEditingController();
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.todos.length,
          itemBuilder: (context, index) {
            final todo = state.todos[index];
            return Card(
              child: ListTile(
                title: Text(todo.title),
                subtitle: Row(
                  children: [
                    Text(todo.description),
                    const SizedBox(width: 8),
                    Text(
                      "Status: ${todo.isCompleted ? 'done' : 'pending'}",
                      style: TextStyle(
                        color: todo.isCompleted ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
                leading: Checkbox(
                  value: todo.isCompleted,
                  onChanged: (bool? value) {
                    context.read<TodoBloc>().add(ToggleTodoCompletion(index));
                  },
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        updateTitleController.text = todo.title;
                        updateDescriptionController.text = todo.description;
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Update Task'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  controller: updateTitleController,
                                  decoration: const InputDecoration(
                                    labelText: 'Title',
                                  ),
                                ),
                                TextField(
                                  controller: updateDescriptionController,
                                  decoration: const InputDecoration(
                                    labelText: 'Description',
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  if (updateTitleController.text.isNotEmpty &&
                                      updateDescriptionController
                                          .text.isNotEmpty) {
                                    context.read<TodoBloc>().add(UpdateTodo(
                                          index,
                                          updateTitleController.text,
                                          updateDescriptionController.text,
                                        ));
                                    Navigator.of(context).pop();
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Title and Description cannot be empty'),
                                      ),
                                    );
                                  }
                                },
                                child: const Text('Update'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        context.read<TodoBloc>().add(DeleteTodo(index));
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
