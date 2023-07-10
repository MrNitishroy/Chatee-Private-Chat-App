import 'package:chatee/Pages/chat_page.dart';
import 'package:chatee/controller/chat_controller.dart';
import 'package:chatee/controller/data_controller.dart';
import 'package:chatee/data/chat_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/search_new_user.dart';
import '../config/colors.dart';

class NewContactPage extends StatelessWidget {
  const NewContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    DataController dataController = Get.put(DataController());
    ChatController chatController = Get.put(ChatController());
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
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select contact",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  fontFamily: "Poppins",
                ),
              ),
              Obx(
                () => Text(
                  dataController.allUsers.length.toString() + " contacts",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: "Poppins",
                  ),
                ),
              )
            ],
          ),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              color: lightColor,
            ),
          ],
        ),
        body: ListView(
          children: [
            SizedBox(height: 10),
            ListTile(
              onTap: () {
                SearchNewUser(context);
              },
              leading: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(Icons.add),
              ),
              title: Text(
                "New contact",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Obx(
              () => Column(
                  // ignore: invalid_use_of_protected_member
                  children: dataController.allUsers.value
                      .map((e) => ListTile(
                            onTap: () {
                              if (e != null) {
                                dataController.user.value = e;
                              }
                              chatController.createtChatRoomID(e["email"]);
                              // dataController.user = e;
                              Get.to(
                                ChatPage(
                                  name: e["name"],
                                  bio: e['bio'],
                                  profileUrl: e['profileUrl'],
                                ),
                              );
                            },
                            minVerticalPadding: 10,
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(e["profileUrl"]),
                                  fit: BoxFit.cover,
                                ),
                                color: lightColor,
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            title: Text(
                              e["name"],
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            subtitle: Text(
                              e["email"],
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ))
                      .toList()),
            )
          ],
        ));
  }
}
