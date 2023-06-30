import 'package:chatee/components/back_button.dart';
import 'package:chatee/components/button.dart';
import 'package:chatee/config/colors.dart';
import 'package:chatee/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginWithPhoneNumber extends StatelessWidget {
  const LoginWithPhoneNumber({super.key});

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
              SizedBox(height: 50),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Enter Your Number",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Mobile Number",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: authController.mobileNumber,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.4,
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                ],
                decoration: InputDecoration(
                  fillColor: Theme.of(context).colorScheme.primaryContainer,
                  filled: true,
                  hintText: "0000000000",
                  hintStyle: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 20,
                  ),
                  prefix: Container(
                    decoration: BoxDecoration(),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "+91",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "We will send you six digit \n of OTP to verify you number",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              Spacer(),
              CustomeButton(
                btnName: "Next",
                onTap: () {
                  // authController.signupEmail();
                  authController.loginWithMobileNumber();
                  Get.toNamed("/otp-page");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
