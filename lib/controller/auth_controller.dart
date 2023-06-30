import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController otpNumber = TextEditingController();
  PhoneAuthCredential? phoneAuthCredential;

  final auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? user;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void googleLogin() async {
    try {
      isLoading.value = true;
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth!.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential user = await auth.signInWithCredential(credential);
      print(user.user!.displayName);
      print(user.user!.email);
      isLoading.value = false;
      Get.offAllNamed('/chat-contact-page');
    } catch (e) {
      print(e);
      isLoading.value = false;
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void loginWithMobileNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+917033161175',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void logOut() async {
    await googleSignIn.disconnect();
    await googleSignIn.signOut();
    await auth.signOut();
    Get.offAllNamed('/welcome-page');
  }
}
