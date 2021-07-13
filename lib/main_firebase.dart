import 'package:flutter/material.dart';
import 'package:notificacion_push/screen/home_screen.dart';
import 'package:notificacion_push/screen/message_screen.dart';
import 'package:notificacion_push/services/key_sha.dart';

void main() async {
  //Ejecutando cuando esta listo el context
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//Var para navegar a la 2da pantalla con argumentos
  final GlobalKey<NavigatorState> navagacionKey =
      new GlobalKey<NavigatorState>();

  final GlobalKey<ScaffoldMessengerState> messageKey =
      new GlobalKey<ScaffoldMessengerState>();

  //Metodo initstate
  @override
  void initState() {
    super.initState();
    //accedo al conext y muestro la notificacioncita
    PushNotificationService.streamMessageController.listen((message) {
      print('El mensaje de la app: $message');

      navagacionKey.currentState?.pushNamed('message', arguments: message);

      final snackBar = SnackBar(content: Text(message));
      messageKey.currentState?.showSnackBar(snackBar);
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: 'message',
      navigatorKey: navagacionKey,
      scaffoldMessengerKey: messageKey,
      routes: {
        'home': (_) => HomeScreen(), //(_) no le pase el context
        'message': (_) => MessageScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}
