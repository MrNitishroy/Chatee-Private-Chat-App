import 'package:flutter/material.dart';

import '../config/colors.dart';

class ContactRow extends StatelessWidget {
  final String? name;
  final String? lastMessage;
  final String? time;
  final bool? isOnline;
  final bool? isDelivered;
  final bool? isSeen;
  final bool? isTyping;
  final int? notificationCount;
  final String? profileUrl;
  final VoidCallback? onTap;
  const ContactRow(
      {super.key,
      this.name,
      this.lastMessage = "",
      this.time,
      this.isOnline,
      this.isDelivered,
      this.isSeen,
      this.isTyping,
      this.notificationCount = 0,
      this.profileUrl,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Row(
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
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name!.toString(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 5),
                Text(
                  lastMessage.toString(),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  time.toString(),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                SizedBox(height: 5),
                SizedBox(
                  child: notificationCount != 0
                      ? Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text(
                              notificationCount.toString(),
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : null,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
