//Pushnotificacionservice key firebase
//SHA-1: FB:C8:0D:B7:F7:B1:BA:F1:A3:45:D4:B2:7D:F4:7C:5E:0A:C4:41:51

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;

  static Future _backgroundHandler(RemoteMessage message) async {
    //Puedes guardarlo en una db
    print('Mensaje en 2do plano ${message.messageId}');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    //Puedes guardarlo en una db
    print('Mensaje en 2do plano ${message.messageId}');
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    //Puedes guardarlo en una db _onMessageOpenApp
    print('_onMessageOpenApp ${message.messageId}');
  }

  //Iniciar la instancia para generar el token del dispositivo
  static Future initializeApp() async {
    //notificacion push
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('Token dispositivo: $token');

    //Envio a firebase
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

    //Notificacion local
  }
}
