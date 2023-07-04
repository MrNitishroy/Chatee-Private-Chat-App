import 'package:chatee/components/back_button.dart';
import 'package:chatee/components/chat_comming_bubble.dart';
import 'package:chatee/components/chat_going_bubble.dart';
import 'package:chatee/controller/chat_controller.dart';
import 'package:chatee/controller/data_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/chat_bubble.dart';
import '../config/colors.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    DataController dataController = Get.put(DataController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: lightColor,
            size: 20,
          ),
        ),
        title: InkWell(
          onTap: () {
            Get.toNamed("/profile-page");
          },
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(dataController.profileUrl.value),
                    fit: BoxFit.cover,
                  ),
                  color: lightColor,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    width: 1.3,
                    color: buttonColor,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                dataController.user["name"],
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 23,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.call),
            color: lightColor,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
            color: lightColor,
          ),
        ],
      ),
      body: Column(children: [
        Expanded(
            child: StreamBuilder<QuerySnapshot>(
          stream: chatController.db
              .collection('chatRoom')
              .doc(chatController.roomID.value)
              .collection("messages")
              .orderBy("time", descending: false)
              .snapshots(),
          // ignore: avoid_types_as_parameter_names
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.data != null) {
              return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  return ChatBubble(
                    message: snapshot.data!.docs[index]["message"],
                    isMe: snapshot.data!.docs[index]["sender"],
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        )),
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add),
                color: Theme.of(context).colorScheme.primary,
              ),
              Expanded(
                child: TextFormField(
                  controller: chatController.message,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.0,
                  ),
                  maxLines: 10,
                  minLines: 1,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Type a message..."),
                ),
              ),
              IconButton(
                onPressed: () {
                  chatController.sendMessage();
                },
                icon: Icon(Icons.send),
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
