import 'package:chatee/Pages/chat_contact_page.dart';
import 'package:chatee/Pages/user_profile_page.dart';
import 'package:chatee/Pages/splace_page.dart';
import 'package:chatee/Pages/welcome_page.dart';
import 'package:chatee/config/routes.dart';
import 'package:chatee/controller/splace_controller.dart';
import 'package:chatee/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Pages/profile_page.dart';
import 'config/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chatee',
      theme: darkTheme,
      darkTheme: darkTheme,
      getPages: pageRoutes,
      home: SplacePage(),
      // home: const ProfilePage(),
      // home: const ChatContactPage(),
    );
  }
}
