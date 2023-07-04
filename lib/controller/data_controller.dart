import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  final db = FirebaseFirestore.instance;
  TextEditingController emailController = TextEditingController();
  RxBool isSearching = false.obs;
  RxString profileUrl = ''.obs;
  var user = {}.obs;
  void searchUserByEmail() async {
    try {
      isSearching.value = true;
      var result = await db
          .collection("users")
          .where("email", isEqualTo: emailController.text)
          .get()
          .then(
            (value) => {
              if (value.docs.length > 0)
                {
                  user.value = value.docs[0].data(),
                  print(value.docs[0].data()),
                  profileUrl.value = value.docs[0].data()["profileUrl"],
                }
              else
                {
                  // Get.snackbar(
                  //   "Error",
                  //   "User not found",
                  //   snackPosition: SnackPosition.BOTTOM,
                  // ),
                }
            },
          );

      isSearching.value = false;
    } catch (ex) {
      print(ex);
    }
  }
}
