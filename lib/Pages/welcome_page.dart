import 'package:chatee/components/button.dart';
import 'package:chatee/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/splace_controller.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SplaceController splaceController = Get.put(SplaceController());
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enjoy Your",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    "Comunnication",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Row(
                    children: [
                      Text(
                        "With",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Chatee",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(color: buttonColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Image.asset("assets/images/welcome.png"),
            Padding(
              padding: const EdgeInsets.all(10),
              child: CustomeButton(
                btnName: "Let's Started",
                onTap: () {
                  Get.toNamed("/login-page");
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
