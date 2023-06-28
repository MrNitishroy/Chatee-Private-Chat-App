import 'package:flutter/material.dart';

import '../config/colors.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
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
            ),
            SizedBox(height: 5),
            Text(
              "Add story",
              style: Theme.of(context).textTheme.labelSmall,
            )
          ],
        ),
      ),
    );
  }
}
