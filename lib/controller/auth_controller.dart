import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController otpNumber = TextEditingController();
  PhoneAuthCredential? phoneAuthCredential;

  final auth = FirebaseAuth.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void emailSignIn() async {
    await auth.signInWithEmailAndPassword(
      email: "nroy7033@gmail.com",
      password: "Niloy@1234",
    );
  }

  void signupEmail() async {
    await auth.createUserWithEmailAndPassword(
        email: "nroy7033@gmail.com", password: "Niloy@1234");
  }

  void mobileNumberLogin() async {
    print('+91${mobileNumber.text}');
    await auth.verifyPhoneNumber(
      phoneNumber: '+91${mobileNumber.text}',
      verificationCompleted: (s) {},
      verificationFailed: (s) {},
      codeSent: (s, d) {},
      codeAutoRetrievalTimeout: (w) {},
    );
  }
}


//  await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: '+91${mobileNumber.text}',
//       verificationCompleted: (PhoneAuthCredential credential) {
//         phoneAuthCredential = credential;
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         if (e.code == 'invalid-phone-number') {
//           Get.snackbar('Error', 'The provided phone number is not valid.');
//         }
//         if (e.code == 'too-many-requests') {
//           Get.snackbar('Error', 'Too many requests. Try again later.');
//         }
//         if (e.code == 'session-expired') {
//           Get.snackbar('Error', 'Session expired. Try again later.');
//         }
//         if (e.code == 'invalid-verification-code') {
//           Get.snackbar('Error', 'Invalid verification code.');
//         }
//       },
//       codeSent: (String verificationId, int? resendToken) {
//         Get.snackbar('Success', 'OTP sent successfully.');
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {
//         Get.snackbar('Error', 'Time out. Try again later.');
//       },
//     );
