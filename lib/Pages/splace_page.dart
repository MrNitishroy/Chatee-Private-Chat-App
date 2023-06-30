import 'package:chatee/controller/splace_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplacePage extends StatelessWidget {
  const SplacePage({super.key});

  @override
  Widget build(BuildContext context) {
    SplaceController splaceController = Get.put(SplaceController());
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/animations/blueChat.json',
          width: 200,
        ),
      ),
    );
  }
}
