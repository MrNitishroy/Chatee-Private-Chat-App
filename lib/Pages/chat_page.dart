import 'package:chatee/components/back_button.dart';
import 'package:chatee/components/chat_comming_bubble.dart';
import 'package:chatee/components/chat_going_bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/colors.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          onTap: (){
            Get.toNamed("/profile-page");
          },
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(
                      "assets/images/profile/profile (1).jpg",
                    ),
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
                "Saloni Kumari",
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
            child: ListView(
          children: [
            ChatCommingBubble(
                message:
                    "aj ke bad hm apakse kabhi bat na karenge kyu ki apko meri koi fikar na hai"),
            ChatGoingBubble(message: "Welcome to chatee app "),
            ChatGoingBubble(message: "Hello 😮"),
            ChatCommingBubble(
                message:
                    "aj ke bad hm apakse kabhi bat na karenge kyu ki apko meri koi fikar na hai"),
            ChatGoingBubble(message: "Welcome to chatee app "),
            ChatGoingBubble(message: "Hello 😮"),
            ChatCommingBubble(
                message:
                    "aj ke bad hm apakse kabhi bat na karenge kyu ki apko meri koi fikar na hai"),
            ChatGoingBubble(message: "Welcome to chatee app "),
            ChatGoingBubble(message: "Hello 😮"),
          ],
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
                onPressed: () {},
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
