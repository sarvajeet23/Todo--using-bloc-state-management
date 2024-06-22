import 'package:flutter/material.dart';
import 'package:myapp/modules/counter/counter_screen.dart';
import 'package:myapp/modules/todo/todo_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CounterPage(),
                  ),
                );
              },
              child: const Text('Counter Page'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TodoPage(),
                  ),
                );
              },
              child: const Text('To-Do Page'),
            ),
          ],
        ),
      ),
    );
  }
}
