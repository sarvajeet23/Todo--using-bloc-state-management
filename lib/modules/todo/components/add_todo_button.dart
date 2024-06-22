// lib/views/todo_page.dart

import 'package:flutter/material.dart';
import 'package:myapp/modules/todo/components/add_todo_bottom_sheet.dart';
import 'package:myapp/modules/todo/todo_pages.dart';

class AddTodoButton extends StatelessWidget {
  const AddTodoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled:
                true, // Ensure bottom sheet covers entire screen height
            builder: (context) => const AddTodoBottomSheet());
      },
    );
  }
}
