import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  final db = FirebaseFirestore.instance;
  TextEditingController emailController = TextEditingController();
  RxBool isSearching = false.obs;

  var user = {}.obs;
  void searchUserByEmail() async {
    try {
      isSearching.value = true;
      var result = await db
          .collection("users")
          .where("email", isEqualTo: emailController.text)
          .get();
      // print(
      //   result.docs[0].data(),
      // );
      user.value = result.docs[0].data();
      isSearching.value = false;
    } catch (ex) {
      print(ex);
    }
  }
}
