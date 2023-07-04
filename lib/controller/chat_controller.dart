import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data_controller.dart';

class ChatController extends GetxController {
  DataController dataController = Get.put(DataController());
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  TextEditingController message = TextEditingController();
  String user1 = "";
  RxString roomID = "".obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    user1 = auth.currentUser?.displayName ?? "";
  }

  void createtChatRoomID(String user2) async {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2[0].toLowerCase().codeUnits[0]) {
      roomID.value = "$user1$user2";

      print("We are Created ChatRoomId of $user1 and $user2 is $roomID");
    } else {
      roomID.value = "$user2$user1";
      print(roomID.value);
    }
  }

  void createChatRoom() {}

  void sendMessage() async {
    try {
      if (message.text.isNotEmpty) {
        await db
            .collection("chatRoom")
            .doc(roomID.value)
            .collection("messages")
            .add(
          {
            "message": message.text,
            "sender": user1,
            "time": DateTime.now(),
          },
        );
        message.clear();
      }
    } catch (ex) {
      print(ex);
    }
  }
}
