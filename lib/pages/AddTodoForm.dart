// biblioteca asíncrona de dart a la que nos referiremos cuando configuremos actualizaciones en tiempo real
import 'dart:async';
// flutter and ui libraries
import 'package:flutter/material.dart';
// package de amplify necesarios
import 'package:amplify_flutter/amplify.dart';
//modelos y configuracion generada por amplify para ti
import '../models/ModelProvider.dart';
import '../models/Todo.dart';

class AddTodoForm extends StatefulWidget {
  @override
  _AddTodoFormState createState() => _AddTodoFormState();
}

class _AddTodoFormState extends State<AddTodoForm> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  Future<void> _saveTodo() async {
// obtener el contenido actual del campo de texto
    String name = _nameController.text;
    String description = _descriptionController.text;

/* crea una nueva tarea en la variable Todo a partir de los valores del formulario 
`isComplete` también es obligatorio, pero debería comenzar en falso en una nueva tarea*/
    Todo newTodo = Todo(
        name: name,
        description: description.isNotEmpty ? description : null,
        isComplete: false);

    try {
// para escribir datos en DataStore, simplemente pasamos una instancia de un modelo a
      // Amplify.DataStore.save()
      await Amplify.DataStore.save(newTodo);
// después de crear un nueva tarea se cierra el formulario
      Navigator.of(context).pop();
    } catch (e) {
      print('Un error ocurrio al guardar la tarea: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Añadir Tarea'),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(filled: true, labelText: 'Nombre')),
              TextFormField(
                  controller: _descriptionController,
                  decoration:
                      InputDecoration(filled: true, labelText: 'Descripcion')),
              ElevatedButton(onPressed: _saveTodo, child: Text('Guardar'))
            ],
          ),
        ),
      ),
    );
  }
}
