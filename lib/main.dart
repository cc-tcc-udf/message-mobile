import 'package:campus_connect/core/design/themes/theme.dart';
import 'package:campus_connect/features/login/presentation/pages/onboarding.dart';
import 'package:campus_connect/firebase_options.dart';
import 'package:campus_connect/routes.dart';
// import 'package:campus_connect/notification_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/injection/app_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await AppInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
