import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/todo_provider.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Color get olive => const Color(0xFF6B7A40);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TodoProvider>();

    return Scaffold(
      backgroundColor: olive.withOpacity(0.1),
      appBar: AppBar(
        backgroundColor: olive,
        foregroundColor: Colors.white,
        title: const Text("TaskMaster AP"),
      ),
      body: provider.loading
          ? Center(child: CircularProgressIndicator(color: olive))
          : ListView.builder(
              itemCount: provider.todos.length,
              itemBuilder: (_, i) {
                final todo = provider.todos[i];
                return Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: olive.withOpacity(0.4)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    title: Text(
                      todo.todo,
                      style: TextStyle(color: olive, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      todo.completed ? "Completada" : "Pendiente",
                      style: TextStyle(color: olive.withOpacity(0.7)),
                    ),
                    onTap: () => context.push("/detail/${todo.id}"),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: olive,
        foregroundColor: Colors.white,
        onPressed: () => context.push("/create"),
        child: const Icon(Icons.add),
      ),
    );
  }
}
