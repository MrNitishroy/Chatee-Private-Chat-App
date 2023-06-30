import 'package:chatee/components/back_button.dart';
import 'package:chatee/components/button.dart';
import 'package:chatee/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class VerifyOtpPage extends StatelessWidget {
  const VerifyOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyBackButton(),
                  Image.asset(
                    "assets/images/otp.png",
                    width: 280,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Fill the OTP",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 250,
                child: TextFormField(
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 3,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(6),
                  ],
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).colorScheme.primaryContainer,
                    filled: true,
                    hintText: "000000",
                    hintStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 3,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Did't get the code ?",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text("Resend",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: buttonColor,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ],
              ),
              Spacer(),
              SizedBox(
                width: 200,
                child: CustomeButton(
                  btnName: "Verify",
                  onTap: () {
                    Get.offAllNamed("/chat-contact-page");
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
