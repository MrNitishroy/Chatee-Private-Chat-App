import 'package:chatee/components/button.dart';
import 'package:chatee/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
            CustomeButton(
              btnName: "Let's Started",
              onTap: () {
                Get.toNamed("/chat-contact-page");
              },
            ),
          ],
        ),
      ),
    ));
  }
}
