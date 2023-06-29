import 'package:chatee/components/story.dart';
import 'package:chatee/config/colors.dart';
import 'package:chatee/data/user_story_data.dart';
import 'package:flutter/material.dart';

class ChatContactPage extends StatelessWidget {
  const ChatContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: storyData
                    .map(
                      (e) => StoryWidget(
                        name: e.useName,
                        isViewed: e.isViewed,
                        profileUrl: e.profileUrl!,
                      ),
                    )
                    .toList(),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 5),
                //   child: Column(
                //     children: [
                //       Container(
                //         width: 60,
                //         height: 60,
                //         decoration: BoxDecoration(
                //           color: lightColor,
                //           borderRadius: BorderRadius.circular(100),
                //           border: Border.all(
                //             width: 1.3,
                //             color: buttonColor,
                //           ),
                //         ),
                //         child: Icon(Icons.add),
                //       ),
                //       SizedBox(height: 5),
                //       Text(
                //         "Add story",
                //         style: Theme.of(context).textTheme.labelSmall,
                //       )
                //     ],
                //   ),
                // ),

                // ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
