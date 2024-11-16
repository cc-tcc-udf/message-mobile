import 'package:campus_connect/core/design/themes/theme.dart';
import 'package:campus_connect/features/login/presentation/pages/onboarding.dart';
import 'package:campus_connect/features/service/notification_service.dart';
import 'package:campus_connect/routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:permission_handler/permission_handler.dart';
import 'core/injection/app_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInjection.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await LocalNotificationService().requestPermission();
  await LocalNotificationService().init();
  await requestPermissions();

  String initialTheme = await _getInitialTheme();
  if (initialTheme == 'light') {
    themeNotifier.value = ThemeMode.light;
  } else if (initialTheme == 'dark') {
    themeNotifier.value = ThemeMode.dark;
  } else {
    themeNotifier.value = ThemeMode.system;
  }

  runApp(const MyApp());
}

Future<String> _getInitialTheme() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('selectedTheme') ?? 'system';
}

final themeNotifier = ValueNotifier<ThemeMode>(ThemeMode.system);

Future<void> requestPermissions() async {
  PermissionStatus cameraStatus = await Permission.camera.request();
  PermissionStatus photosStatus = await Permission.photos.request();

  if (!cameraStatus.isGranted || !photosStatus.isGranted) {
    print("Permissões necessárias não foram concedidas.");
  }
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

  void notificationHandler() {
    FirebaseMessaging.onMessage.listen((event) async {
      LocalNotificationService().showNotification(event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, currentTheme, child) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          themeMode: currentTheme,
          theme: TAppTheme.lightTheme,
          darkTheme: TAppTheme.darkTheme,
          onGenerateRoute: Routes().onGenerateRoute,
          home: const OnBoardingScreen(),
        );
      },
    );
  }
}
