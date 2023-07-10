import 'package:chatee/models/user_model.dart';
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
    user1 = auth.currentUser?.email ?? "";
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
            .collection("UsersChatRoom")
            .doc(roomID.value)
            .collection("messages")
            .add(
          {
            "message": message.text,
            "sender": user1,
            "time": DateTime.now(),
          },
        );
        // updateLastMessage();
        addUser();
        message.clear();
      }
    } catch (ex) {
      print(ex);
    }
  }

  void addUserToChatDB() async {
    await db
        .collection("UsersChatRoom")
        .doc(auth.currentUser!.uid)
        .collection("users")
        .add({
      "name": dataController.user["name"],
      "profileUrl": dataController.user["profileUrl"],
      "bio": dataController.user["bio"],
      "lastSeen": DateTime.now(),
      "isOnline": dataController.user["isOnline"],
      "isTyping": dataController.user["isTyping"],
      "email": dataController.user["email"]
    });

    print("user added to chatroom");
  }

  void updateLastMessage() async {
    DocumentReference userRef = db
        .collection("UsersChatRoom")
        .doc(auth.currentUser!.uid)
        .collection("users")
        .doc(dataController.user["email"]);

    await userRef.get().then((snapshot) {
      if (snapshot.exists) {
        userRef.update({
          "lastMessage":
              message.text, // Update the desired field with the new value
        }).then((_) {
          print("Data updated successfully.");
        }).catchError((error) {
          print("Failed to update data: $error");
        });
      } else {
        print("User document does not exist.");
      }
    }).catchError((error) {
      print("Failed to fetch user document: $error");
    });
  }

  void addUser() async {
    await db
        .collection("UsersChatRoom")
        .doc(auth.currentUser!.uid)
        .collection("users")
        .where("email", isEqualTo: dataController.user["email"])
        .get()
        .then(
          (value) => {
            if (value.docs.length > 0)
              {
                message.clear(),
                printInfo(info: "User already exists in chatroom"),
              }
            else
              {
                message.clear(),
                printError(info: "User not found in chatroom"),
                addUserToChatDB(),
              }
          },
        );
    print("user added to chatroom");
  }
}
