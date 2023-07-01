import 'package:chatee/data/chat_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/search_new_user.dart';
import '../config/colors.dart';

class NewContactPage extends StatelessWidget {
  const NewContactPage({super.key});

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
              Text(
                "120 contacts",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  fontFamily: "Poppins",
                ),
              ),
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
            Column(
                children: chatData
                    .map((e) => ListTile(
                          minVerticalPadding: 10,
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  e.profileUrl!,
                                ),
                                fit: BoxFit.cover,
                              ),
                              color: lightColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          title: Text(
                            e.name!,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          subtitle: Text(
                            e.lastMessage!,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ))
                    .toList())
          ],
        ));
  }
}
