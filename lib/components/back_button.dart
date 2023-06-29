import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Image.asset(
            "assets/images/back.png",
          ),
        ),
      ],
    );
  }
}
