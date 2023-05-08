import 'package:al_waha/widget/appbar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../../widget/back_drop_filter.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  void requestsPermission() async{
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      carPlay: false,
      criticalAlert: false,
      announcement: false,
      provisional: false,
    );
    if(settings.authorizationStatus==AuthorizationStatus.authorized){
      print('User Granted Permissions');
    }
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Title : ${message.notification?.title}  |||'
          '  Subject : ${message.notification?.body}');
    });
  }

  @override
  void initState() {
    requestsPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
          children: [
            const BackgroundFilter(),
            Column(
          children: [
            App_Bar(text: 'Notification'),
          ],
        ),
      ]),
    );
  }
}
