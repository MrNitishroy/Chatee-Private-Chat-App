import 'package:chatee/Pages/chat_contact_page.dart';
import 'package:chatee/Pages/chat_page.dart';
import 'package:chatee/Pages/home_page.dart';
import 'package:chatee/Pages/login_page.dart';
import 'package:chatee/Pages/login_with_phone.dart';
import 'package:chatee/Pages/profile_page.dart';
import 'package:chatee/Pages/user_profile_page.dart';
import 'package:chatee/Pages/verify_otp_page.dart';
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
  GetPage(
    name: "/chat-page",
    page: () => const ChatPage(),
  ),
  GetPage(
    name: "/login-page",
    page: () => const LoginPage(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/login-with-phone",
    page: () => const LoginWithPhoneNumber(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/otp-page",
    page: () => const VerifyOtpPage(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/user-profile-page",
    page: () => const UserProfilePage(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/profile-page",
    page: () => const ProfilePage(),
    transition: Transition.rightToLeft,
  ),
];
