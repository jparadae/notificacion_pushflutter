// dart async library we will refer to when setting up real time updates
import 'dart:async';
// flutter and ui libraries
import 'package:flutter/material.dart';
// amplify packages we will need to use
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
// amplify configuration and models that should have been generated for you
import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';
import 'models/Todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amplified Todo',
      home: TodosPage(),
    );
  }
}

class TodosPage extends StatefulWidget {
  @override
  _TodosPageState createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
    // subscription to Todo model update events - to be initialized at runtime
  late StreamSubscription _subscription;

  // loading ui state - initially set to a loading state
  bool _isLoading = true;

  // list of Todos - initially empty
  List<Todo> _todos = [];

  // amplify plugins
  final AmplifyDataStore _dataStorePlugin =
      AmplifyDataStore(modelProvider: ModelProvider.instance);
  @override
  void initState() {
     // kick off app initialization
  _initializeApp();
    // to be filled in a later step
    super.initState();
  }

  @override
  void dispose() {
     // cancel the subscription when the state is removed from the tree
  _subscription.cancel();
    // to be filled in a later step
    super.dispose();
  }

  Future<void> _initializeApp() async {
    // to be filled in a later step
   // configure Amplify
  await _configureAmplify();
  // listen for updates to Todo entries by passing the Todo classType to
  // Amplify.DataStore.observe() and when an update event occurs, fetch the
  // todo list
  // 
  // note this strategy may not scale well with larger number of entries 
  _subscription = Amplify.DataStore.observe(Todo.classType).listen((event) {
    _fetchTodos();
  });


  
    // fetch Todo entries from DataStore
  await _fetchTodos();

  // after configuring Amplify, update loading ui state to loaded state
  setState(() {
    _isLoading = false;
  });


  }

  Future<void> _configureAmplify() async {
    // to be filled in a later step

    try {

    // add Amplify plugins
    await Amplify.addPlugins([_dataStorePlugin]);

    // configure Amplify
    // 
    // note that Amplify cannot be configured more than once!
    await Amplify.configure(amplifyconfig);
  } catch (e) {

    // error handling can be improved for sure!
    // but this will be sufficient for the purposes of this tutorial
    print('An error occurred while configuring Amplify: $e');
  }
  }

  Future<void> _fetchTodos() async {
    // to be filled in a later step
    try {

    // query for all Todo entries by passing the Todo classType to
    // Amplify.DataStore.query()
    List<Todo> updatedTodos = await Amplify.DataStore.query(Todo.classType);

    // update the ui state to reflect fetched todos
    setState(() {
      _todos = updatedTodos;
    });
  } catch (e) {
    print('An error occurred while querying Todos: $e');
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi lista de tareas'),
      ),
      //body: Center(child: CircularProgressIndicator()),
       body: _isLoading
           ? Center(child: CircularProgressIndicator())
           : TodosList(todos: _todos),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTodoForm()),
          );
        },
        tooltip: 'Add Tarea',
        label: Row(
          children: [Icon(Icons.add), Text('Add tarea')],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class TodosList extends StatelessWidget {
  final List<Todo> todos;

  TodosList({required this.todos});

  @override
  Widget build(BuildContext context) {
    return todos.length >= 1
        ? ListView(
            padding: EdgeInsets.all(8),
            children: todos.map((todo) => TodoItem(todo: todo)).toList())
        : Center(child: Text('Toca el boton de abajo para añadir la tarea!'));
  }
}

class TodoItem extends StatelessWidget {
  final double iconSize = 24.0;
  final Todo todo;

  TodoItem({required this.todo});

  void _deleteTodo(BuildContext context) async {
    // to be filled in a later step

    try {
    // to delete data from DataStore, we pass the model instance to
    // Amplify.DataStore.delete()
    await Amplify.DataStore.delete(todo);
  } catch (e) {
    print('An error occurred while deleting Todo: $e');
  }

  }

  Future<void> _toggleIsComplete() async {
    // to be filled in a later step

     // copy the Todo we wish to update, but with updated properties
  Todo updatedTodo = todo.copyWith(isComplete: !todo.isComplete);
  try {

    // to update data in DataStore, we again pass an instance of a model to
    // Amplify.DataStore.save()
    await Amplify.DataStore.save(updatedTodo);
    print('guardo: $updatedTodo');
  } catch (e) {
    print('An error occurred while saving Todo: $e');
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
                  Text(todo.description ?? 'No description'),
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

class AddTodoForm extends StatefulWidget {
  @override
  _AddTodoFormState createState() => _AddTodoFormState();
}

class _AddTodoFormState extends State<AddTodoForm> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  Future<void> _saveTodo() async {
    // to be filled in a later step
    // get the current text field contents
  String name = _nameController.text;
  String descripcion = _descriptionController.text;

  // create a new Todo from the form values
  // `isComplete` is also required, but should start false in a new Todo
  Todo newTodo = Todo(
     
      name: name,
      description: descripcion,
      isComplete: true);

  try {
    // to write data to DataStore, we simply pass an instance of a model to
    //Amplify.DataStore.save(newTodo);
    await Amplify.DataStore.save(newTodo);
     print('variables: $name');

    // after creating a new Todo, close the form
    Navigator.of(context).pop();
  } catch (e) {
    print('An error occurred while saving Todo: $e');
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Tarea'),
        backgroundColor: Colors.deepPurple,
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