import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'todo_store.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TodoStore todoStore = TodoStore();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('MobX To-Do List')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'New To-Do'),
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    todoStore.addTodo(value);
                  }
                },
              ),
              SizedBox(height: 16),

              Expanded(
                child: Observer(
                  builder: (_) => ListView.builder(
                    itemCount: todoStore.todos.length,
                    itemBuilder: (_, index) {
                      final todo = todoStore.todos[index];
                      return ListTile(
                        title: Text(todo),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            todoStore.removeTodoAt(index); // Remove item
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
