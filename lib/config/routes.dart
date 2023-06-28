import 'package:chatee/Pages/chat_contact_page.dart';
import 'package:chatee/Pages/home_page.dart';
import 'package:chatee/Pages/welcome_page.dart';
import 'package:get/get.dart';

var pageRoutes = [
  GetPage(
    name: "/home-page",
    page: () => HomePage(),
  ),
  GetPage(
    name: "/welcome-page",
    page: () => const WelcomePage(),
  ),
  GetPage(
    name: "/chat-contact-page",
    page: () => const ChatContactPage(),
  ),
];
