import 'package:chatee/controller/data_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/colors.dart';
import 'contact_row.dart';

Future<dynamic> SearchNewUser(BuildContext context) {
  DataController dataController = Get.put(DataController());
  return Get.bottomSheet(Container(
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      color: Theme.of(context).colorScheme.primaryContainer,
    ),
    child: Column(children: [
      Text("New contact"),
      SizedBox(height: 20),
      TextFormField(
        controller: dataController.emailController,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onBackground,
          fontSize: 18,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.0,
        ),
        maxLines: 10,
        minLines: 1,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            fillColor: Theme.of(context).colorScheme.background,
            filled: true,
            border: InputBorder.none,
            hintText: "Enter Email"),
      ),
      SizedBox(height: 20),
      Obx(
        () => InkWell(
          onTap: () {
            dataController.searchUserByEmail();
          },
          child: Container(
            // height: 40,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: dataController.isSearching.value
                ? CircularProgressIndicator(
                    color: lightColor,
                  )
                : Text("Search"),
          ),
        ),
      ),
      SizedBox(height: 10),
      Obx(
        () => dataController.user.value.isNotEmpty
            ? ListTile(
                leading: Image.network(dataController.user["profileUrl"]),
                title: Text(
                  dataController.user["name"],
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                subtitle: Text(
                  dataController.user["email"],
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.message),
                ),
                onTap: () {
                  Get.toNamed("/chat-page");
                },
              )
            : Container(),
      )
    ]),
  ));
}
