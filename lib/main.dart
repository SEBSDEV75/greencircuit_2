import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:greencircuit/auth/mainpage.dart';
import 'package:greencircuit/firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:greencircuit/core/theme_notifier.dart';
import 'package:greencircuit/data/firebase_service/control.dart';

import 'core/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeNotifier()),
        ChangeNotifierProvider(
            create: (context) =>
                RegistrationController()), // Agrega el ChangeNotifierProvider para RegistrationController
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            primaryColor: primary,
          ),
          darkTheme: ThemeData.dark().copyWith(
            primaryColor: secondary,
          ),
          themeMode:
              themeNotifier.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
          home: const ScreenUtilInit(
            designSize: Size(375, 812),
            child: MainPage(),
          ),
        );
      },
    );
  }
}
