import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/todo_provider.dart';
import '../model/todo.dart';

class DetailPage extends StatelessWidget {
  final int id;

  const DetailPage({super.key, required this.id});

  Color get olive => const Color(0xFF6B7A40);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TodoProvider>();
    final Todo todo = provider.todos.firstWhere((t) => t.id == id);

    return Scaffold(
      backgroundColor: olive.withOpacity(0.1),
      appBar: AppBar(
        backgroundColor: olive,
        foregroundColor: Colors.white,
        title: const Text("Detalle"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              todo.todo,
              style: TextStyle(fontSize: 22, color: olive, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SwitchListTile(
              title: Text(
                "¿Completada?",
                style: TextStyle(color: olive, fontWeight: FontWeight.w600),
              ),
              activeColor: olive,
              value: todo.completed,
              onChanged: (value) async {
                await provider.updateTodoStatus(todo.id, value);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("Tarea actualizada"),
                    backgroundColor: olive,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}