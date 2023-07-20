import 'package:chatee/Pages/new_contact_page.dart';
import 'package:chatee/components/contact_row.dart';
import 'package:chatee/components/story.dart';
import 'package:chatee/config/colors.dart';
import 'package:chatee/controller/auth_controller.dart';
import 'package:chatee/controller/chat_controller.dart';
import 'package:chatee/controller/story_controller.dart';
import 'package:chatee/data/chat_data.dart';
import 'package:chatee/data/user_story_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/data_controller.dart';
import 'chat_page.dart';

class ChatContactPage extends StatelessWidget {
  const ChatContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    DataController dataController = Get.put(DataController());
    AuthController authController = Get.put(AuthController());
    ChatController chatController = Get.put(ChatController());
    StoryController storyController = Get.put(StoryController());
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "assets/logo.png",
          width: 20,
          height: 20,
        ),
        title: const Text("C H A T E E"),
        actions: [
          IconButton(
            onPressed: () {
              // authController.loginWithMobileNumber();
              storyController.getAllStory();
            },
            icon: Icon(Icons.search),
            color: lightColor,
          ),
          IconButton(
            onPressed: () {
              Get.toNamed("/profile-page");
            },
            icon: Icon(Icons.more_vert),
            color: lightColor,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dataController.getAllUsers();
          Get.to(NewContactPage());
        },
        backgroundColor: buttonColor,
        child: Icon(
          Icons.message,
          color: lightColor,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: InkWell(
                      onTap: () {
                        storyController.pickImage();
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: lightColor,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                width: 1.3,
                                color: buttonColor,
                              ),
                            ),
                            child: Icon(Icons.add),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Add story",
                            style: Theme.of(context).textTheme.labelSmall,
                          )
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () => Row(
                      children: storyController.storys
                          .map(
                            (e) => StoryWidget(
                              name: e.name,
                              isViewed: false,
                              profileUrl: e.profileUrl,
                            ),
                          )
                          .toList(),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Obx(
              () => Expanded(
                  child: Column(
                children: dataController.allConnectedUsers.value
                    .map(
                      (e) => InkWell(
                        onTap: () {
                          if (e != null) {
                            dataController.user.value = e;
                          }
                          chatController.createtChatRoomID(e["email"]);
                          Get.to(ChatPage(
                            name: e["name"],
                            profileUrl: e["profileUrl"],
                            bio: e["bio"],
                          ));
                        },
                        child: ContactRow(
                          name: e["name"],
                          lastMessage: e["lastMessage"],
                          time: e["time"],
                          isOnline: e["isOnline"],
                          isDelivered: e["isDelivered"],
                          isSeen: e["isSeen"],
                          isTyping: e["isTyping"],
                          notificationCount: e["notificationCount"],
                          profileUrl: e["profileUrl"],
                        ),
                      ),
                    )
                    .toList(),
              )),
            )
          ]),
        ),
      ),
    );
  }
}






// InkWell(
//                               onTap: () {
//                                 Get.to(ChatPage(
//                                   name: snapshot.data!.docs[index]["name"],
//                                   profileUrl: snapshot.data!.docs[index]
//                                       ["profileUrl"],
//                                   bio: snapshot.data!.docs[index]["bio"],
//                                 ));
//                               },
//                               child: ContactRow(
//                                 name: snapshot.data!.docs[index]["name"],
//                                 lastMessage: snapshot.data!.docs[index]
//                                     ["lastMessage"],
//                                 time: snapshot.data!.docs[index]["time"],
//                                 isOnline: snapshot.data!.docs[index]
//                                     ["isOnline"],
//                                 isDelivered: snapshot.data!.docs[index]
//                                     ["isDelivered"],
//                                 isSeen: snapshot.data!.docs[index]["isSeen"],
//                                 isTyping: snapshot.data!.docs[index]
//                                     ["isTyping"],
//                                 notificationCount: snapshot.data!.docs[index]
//                                     ["notificationCount"],
//                                 profileUrl: snapshot.data!.docs[index]
//                                     ["profileUrl"],
//                               ),
//                             );