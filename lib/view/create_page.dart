import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/todo_provider.dart';
import 'package:go_router/go_router.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final controller = TextEditingController();

  Color get olive => const Color(0xFF6B7A40);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: olive.withOpacity(0.1),
      appBar: AppBar(
        backgroundColor: olive,
        foregroundColor: Colors.white,
        title: const Text("Nueva tarea"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: "Título",
                labelStyle: TextStyle(color: olive),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: olive, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: olive),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: olive,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () async {
                  final title = controller.text;

                  if (title.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text("Ingrese el título de la tarea"),
                        backgroundColor: olive,
                      ),
                    );
                    return;
                  }

                  await context.read<TodoProvider>().addNewTodo(title);
                  context.pop();
                },
                child: const Text("Guardar"),
              ),
            )
          ],
        ),
      ),
    );
  }
}