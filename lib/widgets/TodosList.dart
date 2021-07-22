import 'package:flutter/material.dart';
// modelo generado de amplify
import '../models/Todo.dart';
// widgets de presentacion
import 'TodoItem.dart';

class TodosList extends StatelessWidget {
  final List<Todo> todos;

  TodosList({required this.todos});

  @override
  Widget build(BuildContext context) {
    return todos.length >= 1
        ? ListView(
            padding: EdgeInsets.all(8),
            children: todos.map((todo) => TodoItem(todo: todo)).toList())
        : Center(child: Text('Toca el btn para agregar una tarea!'));
  }
}
