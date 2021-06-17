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
  //Metodo initstate
  @override
  void initState() {
    super.initState();
    //accedo al conext y muestro la notificacioncita
    PushNotificationService.streamMessageController.listen((message) {
      print('El mensaje de la app: $message');
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
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
