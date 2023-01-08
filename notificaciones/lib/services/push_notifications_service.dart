//! SHA1:  B0:4A:B9:05:D4:99:4A:5D:85:56:73:A5:90:71:7D:F7:69:5D:93:44

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static final StreamController<String> _messageStream =
      StreamController.broadcast();
  static Stream<String> get messagesStream => _messageStream.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
    //print("onBackground Handler ${message.messageId}");
    // ignore: avoid_print
    print(message.data);

    _messageStream.add(message.data["product"] ?? "No data");
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    //print("onMessage Handler ${message.messageId}");
    // ignore: avoid_print
    print(message.data);

    _messageStream.add(message.data["product"] ?? "No data");
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    //print("onMessageOpenApp Handler ${message.messageId}");
    // ignore: avoid_print
    print(message.data);

    _messageStream.add(message.data["product"] ?? "No data");
  }

  static Future initializaApp() async {
    //Notificaciones
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    // ignore: avoid_print
    print('Token: $token');

    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
  }

  static closeStreams() {
    _messageStream.close();
  }
}
