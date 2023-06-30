import 'package:chatee/components/contact_row.dart';
import 'package:chatee/components/story.dart';
import 'package:chatee/config/colors.dart';
import 'package:chatee/data/chat_data.dart';
import 'package:chatee/data/user_story_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chat_page.dart';

class ChatContactPage extends StatelessWidget {
  const ChatContactPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {},
            icon: Icon(Icons.search),
            color: lightColor,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
            color: lightColor,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
                  Row(
                    children: storyData
                        .map(
                          (e) => StoryWidget(
                            name: e.useName,
                            isViewed: e.isViewed,
                            profileUrl: e.profileUrl!,
                          ),
                        )
                        .toList(),

                    // ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: chatData
                    .map(
                      (e) => ContactRow(
                        onTap: () {
                          Get.to(ChatPage());
                        },
                        name: e.name,
                        lastMessage: e.lastMessage,
                        time: e.time,
                        isOnline: e.isOnline,
                        isDelivered: e.isDelivered,
                        isSeen: e.isSeen,
                        isTyping: e.isTyping,
                        notificationCount: e.notificationCount,
                        profileUrl: e.profileUrl,
                      ),
                    )
                    .toList(),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
