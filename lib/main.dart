import 'package:campus_connect/core/design/themes/theme.dart';
import 'package:campus_connect/features/login/presentation/pages/onboarding.dart';
import 'package:campus_connect/features/service/notification_service.dart';
import 'package:campus_connect/routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'core/injection/app_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInjection.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await LocalNotificationService().requestPermission();
  await LocalNotificationService().init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    notificationHandler();
  }

  void notificationHandler(){
    FirebaseMessaging.onMessage.listen((event) async {
      LocalNotificationService().showNotification(event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      onGenerateRoute: Routes().onGenerateRoute,
      home: const OnBoardingScreen(),
    );
  }
}
