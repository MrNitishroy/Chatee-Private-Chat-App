import 'package:chatee/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chatee"),
        leading: IconButton(
          onPressed: () {
            themeController.changeTheme();
          },
          icon: const Icon(Icons.dark_mode),
        ),
      ),
      body: Center(
        child: Text("data"),
      ),
    );
  }
}
