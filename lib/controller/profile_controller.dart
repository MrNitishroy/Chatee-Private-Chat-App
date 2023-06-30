import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  RxBool isEmailEnable = false.obs;
  RxBool isPhoneEnable = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    email.text = auth.currentUser!.email!;
  }

  void onEmailUpdate() {
    isEmailEnable.value = !isEmailEnable.value;
  }
}
