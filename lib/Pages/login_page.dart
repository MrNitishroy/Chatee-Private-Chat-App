import 'package:chatee/components/back_button.dart';
import 'package:chatee/components/button.dart';
import 'package:chatee/config/colors.dart';
import 'package:chatee/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              MyBackButton(),
              SizedBox(height: 30),
              Image.asset(
                'assets/logo.png',
                width: 200,
              ),
              Text(
                "Welcome to",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                "Chatee",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: buttonColor),
              ),
              Spacer(),
              Obx(
                () => InkWell(
                  onTap: () {
                    authController.googleLogin();
                  },
                  child: Container(
                    height: 60,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: authController.isLoading.value
                        ? Center(
                            child: CircularProgressIndicator(
                              color: buttonColor,
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/logo/google.svg",
                                  color: Theme.of(context).colorScheme.primary),
                              SizedBox(width: 30),
                              Text(
                                "Sign in with Google",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
