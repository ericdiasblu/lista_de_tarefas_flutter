import 'package:flutter/material.dart';
import 'package:lista_de_tarefas_curso/widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TodoListPage> {
  final TextEditingController todoController = TextEditingController();

  List<String> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: todoController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Adicione uma tarefa',
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                      onPressed: () {
                        String text = todoController.text;
                        setState(() {
                          todos.add(text);
                        });
                        todoController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          padding: EdgeInsets.all(13.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      child: const Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.white,
                      )),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (String todo in todos) TodoListItem(),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text('Você possui 0 tarefas pendentes'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          padding: const EdgeInsets.all(13.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      child: const Text(
                        'Limpar tudo',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ))
                ],
              )
            ],
          )),
    ));
  }
}
