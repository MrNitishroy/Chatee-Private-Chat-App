import 'package:flutter/material.dart';

import '../config/colors.dart';

class StoryWidget extends StatelessWidget {
  final String? name;
  final bool? isViewed;
  final String? profileUrl;
  const StoryWidget({
    super.key,
    this.name,
    this.isViewed,
    this.profileUrl =
        "https://th.bing.com/th/id/OIP.Rjs9v9RuobrZmBIA-X6FpQHaHl?pid=ImgDet&rs=1",
  });

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
                image: DecorationImage(
                  image: NetworkImage(profileUrl!),
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
            SizedBox(height: 5),
            Text(
              name.toString(),
              style: Theme.of(context).textTheme.labelSmall,
            )
          ],
        ),
      ),
    );
  }
}
