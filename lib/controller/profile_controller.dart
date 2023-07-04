import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  TextEditingController email = TextEditingController();
  TextEditingController bio = TextEditingController(text: "i am a agronomist");
  RxBool isBioEnabled = false.obs;
  RxBool isPhoneEnable = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    email.text = auth.currentUser!.email!;
  }

  void editEnabled() {
    isBioEnabled.value = !isBioEnabled.value;
  }

  void onEmailUpdate() async {
    if (isBioEnabled.value) {
      try {
        await auth.currentUser!.updateEmail(email.text);
        await db
            .collection("users")
            .doc(auth.currentUser!.uid)
            .update({"email": email.text});
        Get.snackbar("Success", "Email Updated Successfully",
            snackPosition: SnackPosition.BOTTOM);
        editEnabled();
      } catch (e) {
        Get.snackbar("Error", e.toString(),
            snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      isBioEnabled.value = !isBioEnabled.value;
    }
  }
}
