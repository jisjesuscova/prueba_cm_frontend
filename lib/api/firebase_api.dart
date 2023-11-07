import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:aplicacion/services/token.dart';
import 'package:http/http.dart' as http;
import 'package:aplicacion/services/globals.dart';
import 'dart:convert';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}');
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final token =
        await _firebaseMessaging.getToken() ?? ''; // Use '' if token is null
    http.Response response = await TokenServices.store_token(token);

    print(response.body);
    print('Token: $token');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
