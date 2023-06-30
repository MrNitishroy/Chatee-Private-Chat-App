import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBackButton extends StatelessWidget {
  final double? width;
  const MyBackButton({super.key, this.width});

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
            width: width,
          ),
        ),
      ],
    );
  }
}
