import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:permission_handler/permission_handler.dart';

import '../usuarios/presentation/controllers/usuario_controller.dart';

class LocalNotificationService {
  final firebaseFirestore = FirebaseFirestore.instance;
  final UsuarioController userController = GetIt.I<UsuarioController>();

  Future<void> requestPermission() async {
    // Permissão para receber notificações
    PermissionStatus status = await Permission.notification.request();
    if (status != PermissionStatus.granted) {
      throw Exception("Permissão negada");
    }
  }

  Future<void> uploadFcmToken() async {
    try {
      await FirebaseMessaging.instance.getToken().then((token) async {
        print('getToken :: $token');
        await firebaseFirestore.collection('user').doc(userController.usuario!.uid).set({
          'notificationToken': token,
          'email': userController.usuario!.email,
        });
      });

      FirebaseMessaging.instance.onTokenRefresh.listen((token) async {
        print('onTokenRefresh :: $token');
        await firebaseFirestore.collection('user').doc(userController.usuario!.uid).set({
          'notificationToken': token,
          'email': userController.usuario!.email,
        });
      });
    } catch (e) {
      print(e.toString());
    }
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // Configurar o canal de notificação
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'channel_id',
      'Campus Connect',
      description: 'Channel Description',
      importance: Importance.high,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }


  showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      'channel_id',
      'Campus Connect',
      channelDescription: 'Channel Description',
      importance: Importance.max,
      priority: Priority.max,
      ticker: 'ticker'
    );
    int notificationId = 1;

    const NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
      notificationId,
      message.notification!.title,
      message.notification!.body,
      notificationDetails,
      payload: 'Not present',

    );
  }
}
