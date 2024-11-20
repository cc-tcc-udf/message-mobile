import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:permission_handler/permission_handler.dart';

import '../usuarios/data/models/response_data_user_model.dart';
import '../usuarios/data/models/response_list_courses_model.dart';
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

  Future<void> registerFirebaseFromLogin() async {
    var user = await userController.getUser();
    if (user == null) {
      return;
    }
    CourseModel? c = user.course;
    await registerFirebase(
        CourseGroup(id: user.course?.courseGroupId, name: user.group),
        Course(id: c?.id, name: c?.name));
  }

  Future<void> registerFirebase(CourseGroup group, Course course) async {
    var user = await userController.getUser();
    if (user == null) {
      if (kDebugMode) {
        print('Usuário não encontrado');
      }
      return;
    }

    try {
      String? token = await FirebaseMessaging.instance.getToken();
      if (token == null || token.isEmpty) {
        throw Exception("Token de notificação inválido");
      }

      print('getToken :: $token');

      // Verifica se o documento já existe e atualiza apenas o token
      var studentDocRef = firebaseFirestore
          .collection('groups')
          .doc(group.name)
          .collection("courses")
          .doc(course.name)
          .collection("students")
          .doc(user.email);

      await studentDocRef.set({
        'id': user.id,
        'name': user.name,
        'email': user.email,
        'notificationToken': token,
      });

      // Escuta mudanças no token
      FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
        if (newToken.isNotEmpty && newToken != token) {
          print('onTokenRefresh :: $newToken');
          await studentDocRef.update({
            'notificationToken': newToken,
          }).catchError((e) {
            print('Erro ao atualizar token no Firestore: $e');
          });
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print('Erro ao registrar token no Firestore: $e');
      }
    }
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

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
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channel_id', 'Campus Connect',
            channelDescription: 'Channel Description',
            importance: Importance.max,
            priority: Priority.max,
            ticker: 'ticker');
    int notificationId = 1;

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
      notificationId,
      message.notification!.title,
      message.notification!.body,
      notificationDetails,
      payload: message.data['id_msg'],
    );
  }
}
