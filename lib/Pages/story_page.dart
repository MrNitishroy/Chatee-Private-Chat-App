import 'package:chatee/components/back_button.dart';
import 'package:chatee/controller/story_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoryPage extends StatelessWidget {
  const StoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    StoryController storyController = Get.put(StoryController());
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            storyController.addStory();
          },
          child: Icon(Icons.send_rounded),
        ),
        body: Stack(
          children: [
            Expanded(
              flex: 9,
              child: Obx(
                () => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          storyController.selectedImage.value.toString()),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: MyBackButton(),
            ),
            Positioned(
              bottom: 70,
              child: Container(
                height: 80,
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: storyController.description,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                          decoration: InputDecoration(
                            hintText: "Send message",
                            hintStyle: TextStyle(
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                            fillColor:
                                Theme.of(context).colorScheme.primaryContainer,
                            filled: true,
                            prefixIcon: Icon(
                              Icons.message_rounded,
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                            // contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
