// flutter and ui libraries
import 'package:flutter/material.dart';
// amplify packages we will need to use
import 'package:amplify_flutter/amplify.dart';
// modelo generado por amplify
import '../models/Todo.dart';

class TodoItem extends StatelessWidget {
  final double iconSize = 24.0;
  final Todo todo;

  TodoItem({required this.todo});

  void _deleteTodo(BuildContext context) async {
    try {
      // para eliminar datos de DataStore, pasamos la instancia del modelo a
      // Amplify.DataStore.delete()
      await Amplify.DataStore.delete(todo);
    } catch (e) {
      print('An error occurred while deleting Todo: $e');
    }
  }

  Future<void> _toggleIsComplete() async {
 // copiamos la tarea que deseamos actualizar, pero con propiedades actualizadas
    Todo updatedTodo = todo.copyWith(isComplete: !todo.isComplete);
    try {
// para actualizar los datos en DataStore, pasamos nuevamente una instancia de un modelo a
      // Amplify.DataStore.save()
      await Amplify.DataStore.save(updatedTodo);
    } catch (e) {
      print('Ocurrió un error al guardar la tarea: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          _toggleIsComplete();
        },
        onLongPress: () {
          _deleteTodo(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(todo.name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(todo.description ?? 'Sin descripcion'),
                ],
              ),
            ),
            Icon(
                todo.isComplete
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                size: iconSize),
          ]),
        ),
      ),
    );
  }
}
