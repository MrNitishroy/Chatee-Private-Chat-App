import 'package:chatee/config/colors.dart';
import 'package:chatee/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
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
        title: Text(
          "Profile",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 23,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: const DecorationImage(
                          image: AssetImage(
                            "assets/images/profile/profile (1).jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                        color: Colors.red,
                        border: Border.all(
                          width: 4,
                          color: buttonColor,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Saloni Kumari",
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      "Generate Lorem Ipsum placeholder text for use in your graphic, print",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 1.5,
              ),
              Container(
                // margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.alternate_email_rounded),
                      color: Theme.of(context).colorScheme.onBackground,
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
                          border: InputBorder.none,
                          hintText: "Add Email",
                          hintStyle: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit),
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                // margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.phone),
                      color: Theme.of(context).colorScheme.onBackground,
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
                          border: InputBorder.none,
                          hintText: "Add Number",
                          hintStyle: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit),
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                title: Text(
                  "Logout",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              SizedBox(height: 10),
              Obx(() => ListTile(
                    leading: Icon(
                      Icons.dark_mode_rounded,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    title: Text(
                      "Dark Theme",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    trailing: Switch(
                      value: themeController.isDark.value,
                      onChanged: (value) {
                        themeController.isDark.value = value;
                        // themeController.changeTheme();
                      },
                      activeColor: buttonColor,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
