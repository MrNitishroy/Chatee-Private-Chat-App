import 'package:chatee/controller/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBackButton extends StatelessWidget {
  final double? width;
  const MyBackButton({super.key, this.width});

  @override
  Widget build(BuildContext context) {
    DataController dataController = Get.put(DataController());
    return Row(
      children: [
        InkWell(
          onTap: () {
            Get.back();
            dataController.getAllConnectedUsers();
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
