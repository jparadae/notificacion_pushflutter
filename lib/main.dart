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

class MyApp extends StatelessWidget {
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
