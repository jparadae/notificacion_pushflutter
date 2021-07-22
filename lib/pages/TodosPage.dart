// biblioteca asíncrona de dart a la que nos referiremos cuando configuremos actualizaciones en tiempo real
import 'dart:async';
// flutter and ui libraries
import 'package:flutter/material.dart';
// paquetes de amplify que necesitaremos usar
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';


// configuración y los modelos que deberían haber sido generados para ti por amplify
import '../amplifyconfiguration.dart';
import '../models/ModelProvider.dart';
import '../models/Todo.dart';
// presentational widgets
import '../pages/AddTodoForm.dart';
import '../widgets/TodosList.dart';

class TodosPage extends StatefulWidget {
  @override
  _TodosPageState createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
// suscripción a eventos de actualización del modelo Todo: se inicializará en tiempo de ejecución
  late StreamSubscription _subscription;

// cargando estado de la interfaz de usuario: inicialmente establecido en un estado de carga
  bool _isLoading = true;

// Lista de Todos - inicialmente vacía
  List<Todo> _todos = [];

  // amplify plugins
  final AmplifyAPI _apiPlugin = AmplifyAPI();
  final AmplifyAuthCognito _authPlugin = AmplifyAuthCognito();
  final AmplifyDataStore _dataStorePlugin =
      AmplifyDataStore(modelProvider: ModelProvider.instance);

  @override
  void initState() {
// iniciar la inicialización de la aplicación
    _initializeApp();

    super.initState();
  }

  @override
  void dispose() {
// cancela la suscripción cuando el estado se elimina del listado
    _subscription.cancel();
    super.dispose();
  }

  Future<void> _initializeApp() async {
    // configure Amplify
    await _configureAmplify();

   // escucha las actualizaciones de las entradas de las tareas pasando el Todo classType a
    // Amplify.DataStore.observe() 
    /*y cuando se produce un evento de actualización, recupera el lista de quehaceres
 tenga en cuenta que esta estrategia puede no escalar bien con una mayor cantidad de entradas*/ 
    _subscription = Amplify.DataStore.observe(Todo.classType).listen((event) {
      _fetchTodos();
    });

   // recupera las entradas del Todo de DataStore
    await _fetchTodos();

 /* después de configurar Amplify y obtener entradas de Todo, actualice la carga
    estado de la interfaz de usuario al estado cargado */
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _configureAmplify() async {
    try {
      // add Amplify plugins
      await Amplify.addPlugins([_dataStorePlugin, _apiPlugin, _authPlugin]);
// configurar Amplify
      await Amplify.configure(amplifyconfig);
    } catch (e) {
// manejo de errores
      print('Se produjo un error al configurar Amplify: $e');
    }
  }

  Future<void> _fetchTodos() async {
    try {
      // consulta para todas las tareas de Todo pasando el Todo classType a
      // Amplify.DataStore.query()
      List<Todo> updatedTodos = await Amplify.DataStore.query(Todo.classType);

   // actualiza el estado de la interfaz de usuario para reflejar todos los datos obtenidos
      setState(() {
        _todos = updatedTodos;
      });
    } catch (e) {
      print('Se produjo un error al consultar la lista de tareas: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tareas'),
      ),
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
        tooltip: 'Añadir Tarea',
        label: Row(
          children: [Icon(Icons.add), Text('Añadir Tarea')],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
