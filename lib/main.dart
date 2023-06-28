import 'package:chatee/Pages/home_page.dart';
import 'package:chatee/Pages/welcome_page.dart';
import 'package:chatee/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chatee',
      theme: lightTheme,
      darkTheme: darkTheme,
      getPages: pageRoutes,
      home: const WelcomePage(),
    );
  }
}
