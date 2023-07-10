import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class DataController extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  RxBool isSearching = false.obs;
  RxString profileUrl = ''.obs;
  var user = {}.obs;
  RxList allUsers = RxList();
  RxList allConnectedUsers = RxList();
  RxString lastMessage = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllConnectedUsers();
  }

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

  void getAllUsers() async {
    try {
      allUsers.clear();
      await db.collection("users").get().then((value) => {
            allUsers.value = value.docs.map((e) => e.data()).toList(),
            printInfo(info: "Geting uesr")
          });
    } catch (ex) {
      print(ex);
    }
  }

  void getAllConnectedUsers() async {
    try {
      await db
          .collection("UsersChatRoom")
          .doc(auth.currentUser!.uid)
          .collection("users")
          .get()
          .then(
            (value) => {
              allConnectedUsers.value =
                  value.docs.map((e) => e.data()).toList(),
              printInfo(info: "Geting uesr")
            },
          );
    } catch (ex) {
      print(ex);
    }
  }
}
